// ignore_for_file: inference_failure_on_function_invocation

import 'dart:async';
import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/product/product_model.dart'
    as product_model;
import 'package:meta_package/api/models/search/search_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/search/widget/search_dialog.dart';

class SearchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final SearchAPIRepository searchAPIRepository =
      SearchAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final MenuAPIRepository menuAPIRepository =
      MenuAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  SearchController();

  Rx<MenuModel>? menuModel = MenuModel().obs;

  Rx<SearchModel> searchItemList = SearchModel().obs;
  Rx<product_model.ProductModel>? searchProductList =
      product_model.ProductModel().obs;
  RxList<product_model.ProductItem> productsList =
      <product_model.ProductItem>[].obs;

  RxList<int> listData = <int>[].obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isLoading = true.obs;
  final TextEditingController txtList = TextEditingController();
  RxBool isSearchDataLoad = false.obs;
  Timer? debounceTimer;
  RxString searchValue = ''.obs;
  RxString lastInputValue = ''.obs;
  RxInt productCount = 0.obs;
  RxInt currentPage = 0.obs;
  RxBool productLoading = false.obs;
  RxBool productIsEnded = false.obs;
  RxBool visibleLoader = false.obs;
  RxBool dialogLoader = false.obs;
  RxBool dropdownValidator = false.obs;
  RxList<SizeModel> chooseOption = RxList([]);
  RxList<SizeModel> listOfChoose = RxList([]);
  RxList<SizeModel> sizeList = RxList([]);
  RxList<RecommendedProductModel> recommendationList = RxList([]);
  RxString slectSize = "".obs;
  RxString getCartToken = "".obs;
  final String argument = "dash";

  List<List<String>> productImageList = [];
  List<List<bool>> dotsList = [];

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    super.onInit();
    txtList.addListener(() {
      searchValue.value = txtList.text;
    });
    await getSizeApiRes();
    await getMenuDataFromApi();
  }

  @override
  void dispose() {
    debounceTimer?.cancel();
    super.dispose();
  }

  void onSearchChange(String val) {
    if (lastInputValue.value != val) {
      if (debounceTimer?.isActive ?? false) {
        debounceTimer?.cancel();
      }
      isSearchDataLoad.value = true;
      debounceTimer = Timer(
        const Duration(milliseconds: 750),
        () {
          if (val.isNotEmpty) {
            lastInputValue.value = val;
            productsList.clear();
            productCount.value = 0;
            currentPage.value = 0;
            productIsEnded.value = false;
            getSearchData(argument: val);
          }
        },
      );
    }
  }

  Future<void> getSizeApiRes() async {
    try {
      List<SizeModel> data =
          await recommendedProductsAPIRepository.getChooseInSizeList();
      chooseOption.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> getChooseOption(product_model.ProductItem item) async {
    visibleLoader.value = true;
    try {
      listOfChoose.value = [];
      sizeList.value = [];

      if (item.extensionAttributes?.configurableProductOptions?.isNotEmpty ??
          false) {
        item.extensionAttributes?.configurableProductOptions?.first.values
            ?.forEach((element) {
          final SizeModel sizeModel = chooseOption.firstWhere((element2) =>
              element.valueIndex.toString() == element2.value.toString());
          listOfChoose.add(sizeModel);
        });
      }
      listOfChoose.add(SizeModel(
          label: LanguageConstants.sizeMissingNotifiedItsBack.tr,
          value: 'Missing'));

      log("${listOfChoose.length}", name: "listOfChoose length");
      await getRecommendedProductDataFromApi(item);
      visibleLoader.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      visibleLoader.value = false;
    }
  }

  Future<void> getRecommendedProductDataFromApi(
      product_model.ProductItem item) async {
    try {
      List<RecommendedProductModel> data =
          await recommendedProductsAPIRepository
              .getRecommendedProductResponse(item.sku.toString());
      recommendationList.value = data;
      debugPrint(
          "CONTROLLER DATA ==============${recommendationList[0].typeId}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> recommendationTap(
      int index, CartController cartController) async {
    product_model.ProductItem tempProduct = product_model.ProductItem(
      id: int.parse(recommendationList[index].productId.toString()),
      sku: recommendationList[index].sku,
    );
    Get.back<dynamic>();
    product_model.ProductItem? tempItem = await getProductDetail(tempProduct);
    if (tempItem != null) {
      Get.toNamed<dynamic>(
        RoutesConstants.productDetailsScreen,
        arguments: [tempItem, tempItem.id ?? 0],
      )?.whenComplete(
        () {
          cartController.getGenerateCart();
        },
      );
    }
  }

  Future<product_model.ProductItem?> getProductDetail(
      product_model.ProductItem item) async {
    visibleLoader.value = true;
    //
    try {
      product_model.ProductItem data = await recommendedProductsAPIRepository
          .getProductDetailApi(item.sku.toString());
      visibleLoader.value = false;
      return data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      visibleLoader.value = false;
    }
    return null;
  }

  Future<void> addToCartPopUPTap(
      product_model.ProductItem item, CartController cartController) async {
    if (item.typeId.toString() == "configurable") {
      if (sizeList.isEmpty) {
        dropdownValidator.value = true;
        return;
      }
    }
    dropdownValidator.value = false;
    dialogLoader.value = true;
    try {
      await onAddToCart(item);
      await cartController.getGenerateCart();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      dialogLoader.value = false;
    }
    dialogLoader.value = false;
  }

  Future<void> onAddToCart(product_model.ProductItem item) async {
    debugPrint("ProductType Is ${item.typeId}");
    if (item.typeId.toString() == "configurable") {
      await getGenerateCart(
        Get.context!,
        item.name!,
        "${item.customAttributes![1].value}",
        item.sku ?? '',
        item.typeId ?? '',
        item.extensionAttributes?.configurableProductOptions?.first
                .attributeId ??
            '',
        (item.extensionAttributes?.configurableProductOptions?.first.values
                    ?.isEmpty ==
                true)
            ? "0"
            : (sizeList.first.value ?? '').toString(),
      );
    } else {
      await getGenerateCart(
        Get.context!,
        item.name!,
        "${item.customAttributes![1].value}",
        item.sku ?? '',
        item.typeId ?? '',
        "0",
        "0",
      );
    }
  }

  Future<void> getGenerateCart(
      BuildContext context,
      String dataName,
      String customImage,
      String sku,
      String productType,
      String optionId,
      String optionvalue) async {
    log("User Token Is ${localStore.customerToken}");

    try {
      if (localStore.customerToken.toString() != "") {
        debugPrint("Customer");
        String data =
            await recommendedProductsAPIRepository.getGenerateCartApiResponse();
        getCartToken.value = data;
        if (getCartToken.value.isNotEmpty) {
          await postAddToCartData(
            Get.context!,
            dataName,
            customImage,
            sku,
            "1",
            getCartToken.value,
            productType,
            optionId,
            optionvalue,
          );
        }
      } else {
        debugPrint("Guest");
        if (localStore.guestToken.toString() != "") {
          await postAddToCartData(
            context,
            dataName,
            customImage,
            sku,
            "2",
            localStore.guestToken,
            productType,
            optionId,
            optionvalue,
          );
        } else {
          String data = await recommendedProductsAPIRepository
              .getGenerateCartApiResponse();
          getCartToken.value = data.replaceAll('"', '');
          if (getCartToken.value.isNotEmpty) {
            await LocalStore.setPrefStringValue(
              kStorageConstGuestauthToken,
              getCartToken.value.toString(),
            );
            localStore.getGuestToken();
            debugPrint("Guest Token Is ${localStore.guestToken}");
            await postAddToCartData(
              Get.context!,
              dataName,
              customImage,
              sku,
              "2",
              getCartToken.value,
              productType,
              optionId,
              optionvalue,
            );
          }
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> postAddToCartData(
      BuildContext context,
      String dataName,
      String customImage,
      String sku,
      String getValue,
      String getToken,
      String productType,
      String optionId,
      String optionValue) async {
    Map<String, Map<String, Object>> passedAddTocart;
    debugPrint("Add Product is $productType");
    debugPrint("Add Product is $optionValue");
    if (sizeList.toString() == "[]") {
      passedAddTocart = {
        "cartItem": {"sku": sku, "qty": 1, "quote_id": getToken}
      };
    } else {
      if (productType == "configurable") {
        debugPrint("Here Inside Condife");
        passedAddTocart = {
          "cartItem": {
            "sku": sku,
            "qty": 1,
            "product_type": "configurable",
            "quote_id": getToken,
            "product_option": {
              "extension_attributes": {
                "configurable_item_options": [
                  {
                    "option_id": optionId,
                    "option_value":
                        "${sizeList.first.value == "Missing" ? slectSize : optionValue}"
                  }
                ]
              }
            }
          }
        };
      } else {
        debugPrint("Here OutSide Condife");
        passedAddTocart = {
          "cartItem": {"sku": sku, "qty": 1, "quote_id": getToken}
        };
      }
    }

    debugPrint("json is $passedAddTocart");
    if (getValue == "1") {
      debugPrint("Here Customer Post");
      await recommendedProductsAPIRepository
          .postAddTOCartProductResponse(passedAddTocart);
    } else {
      debugPrint("Here Guest Post");
      await recommendedProductsAPIRepository.guestPostAddTOCartProductResponse(
        passedAddTocart,
      );
    }
    debugPrint("Add To Cart Data");
  }

  Future<void> getMenuDataFromApi() async {
    isLoading(true);
    debugPrint("CONTROLLER DATA ==============$menuModel");
    try {
      MenuModel data = await menuAPIRepository.getMenuAPISearchResponse();
      menuModel?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getSearchData({String argument = ''}) async {
    try {
      if (currentPage.value == 0) isSearchDataLoad.value = true;
      productLoading.value = true;
      SearchModel data = await searchAPIRepository.getSearchAPIResponse(
        argument: argument,
        currentPage: currentPage.value,
        pageSize: 20,
      );
      searchItemList.value = data;
      getParticularItem();
      if ((searchItemList.value.items ?? []).isEmpty) {
        productIsEnded.value = true;
        productLoading.value = false;
      } else {
        await getSearchProductList(itemId: listData);
        productLoading.value = false;
      }
      update();
      isSearchDataLoad.value = false;
      productLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isSearchDataLoad.value = false;
      productLoading.value = false;
    }
  }

  Future<void> getSearchProductList({RxList<int>? itemId}) async {
    try {
      product_model.ProductModel data = await searchAPIRepository
          .getSearchProductAPIResponse(AppConstants.getUrlWithCode(),
              itemID: itemId);
      searchProductList?.value = data;
      if (!productIsEnded.value) {
        productsList.addAll(searchProductList?.value.items ?? []);
        productsList.refresh();
        productCount += (searchProductList?.value.items?.length ?? 0);
        currentPage.value++;
        fillValueInDotsList(productsList);
        log('itemsNumber.value is:--->> $productCount');
      }
      isSearchDataLoad.value = false;
      update();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isSearchDataLoad.value = false;
    }
  }

  String productImage(product_model.ProductItem? product) {
    for (var element in product?.customAttributes ?? []) {
      if (element.attributeCode == "image") {
        return "${AppConstants.productImageUrl}${element.value}";
      }
    }
    return "";
  }

  Future<void> wishListOnTap(
      {product_model.ProductItem? product, int? index}) async {
    try {
      if (!productsList[index!].isWishList.value) {
        visibleLoader.value = true;
        if (localStore.customerToken.isNotEmpty) {
          bool addToWishData = await wishListAPIRepository.addToWishList(
              product?.sku ?? '', localStore.userDetail.email ?? '');
          if (addToWishData) {
            visibleLoader.value = false;
            productsList[index].isWishList.value = true;
            SearchDialog.showWishlistDialog(
                product?.name ?? '', productImage(product));
          }
        } else {
          WishListProductModel mainDataObj = WishListProductModel();
          mainDataObj = await localStore.getWishListData();

          ItemProduct itemProduct = ItemProduct();
          WishlistItem objProduct = WishlistItem();
          product_model.ExtensionAttributesProduct extensionAttributes =
              product_model.ExtensionAttributesProduct();
          product_model.StockItem stockItems = product_model.StockItem();
          List<ItemProduct>? lstItemProduct = mainDataObj.items ?? [];
          objProduct.id = product?.id;
          objProduct.sku = product?.sku;
          objProduct.name = product?.name;
          objProduct.attributeSetId = product?.attributeSetId;
          objProduct.price = product?.price;
          objProduct.status = product?.status;
          objProduct.visibility = product?.visibility;
          objProduct.typeId = product?.typeId;
          objProduct.createdAt = product?.createdAt;
          objProduct.updatedAt = product?.updatedAt;
          objProduct.productLinks = product?.productLinks;
          objProduct.tierPrices = product?.tierPrices;
          objProduct.customAttributes = [];
          extensionAttributes.configurableProductOptions = [];
          for (product_model.CustomAttributes element
              in product?.customAttributes ?? []) {
            product_model.CustomAttributes customAttribute =
                product_model.CustomAttributes();
            customAttribute.value = element.value.toString();
            customAttribute.attributeCode = element.attributeCode;
            objProduct.customAttributes?.add(customAttribute);
          }

          stockItems =
              convertStockItem(product?.extensionAttributes?.stockItem);

          extensionAttributes.configurableProductOptions =
              getConfigurableProduct(
                  product?.extensionAttributes?.configurableProductOptions);

          extensionAttributes.convertedRegularOldPrice =
              product?.extensionAttributes?.convertedRegularOldPrice;
          extensionAttributes.convertedRegularPrice =
              product?.extensionAttributes?.convertedRegularPrice;

          extensionAttributes.stockItem = stockItems;
          objProduct.extensionAttributes = extensionAttributes;
          itemProduct.id = product?.id;
          itemProduct.product = objProduct;

          lstItemProduct.add(itemProduct);

          mainDataObj.itemsCount = mainDataObj.items == null
              ? 1
              : (mainDataObj.items?.length ?? 0) + 1;
          mainDataObj.items = lstItemProduct;

          await LocalStore.setPrefStringValue(
            kStorageConstWishListData,
            jsonEncode(mainDataObj),
          );
          productsList[index].isWishList.value = true;

          visibleLoader.value = false;
          SearchDialog.showWishlistDialog(
              product?.name ?? '', productImage(product));
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      visibleLoader.value = false;
    }
  }

  product_model.StockItem convertStockItem(product_model.StockItem? stockItem) {
    product_model.StockItem stockItems = product_model.StockItem();
    stockItems.itemId = stockItem?.itemId;
    stockItems.productId = stockItem?.productId;
    stockItems.stockId = stockItem?.stockId;
    stockItems.qty = stockItem?.qty;
    stockItems.isInStock = stockItem?.isInStock;
    stockItems.isQtyDecimal = stockItem?.isQtyDecimal;
    stockItems.showDefaultNotificationMessage =
        stockItem?.showDefaultNotificationMessage;
    stockItems.useConfigMinQty = stockItem?.useConfigMinQty;
    stockItems.minQty = stockItem?.minQty;
    stockItems.useConfigMinSaleQty = stockItem?.useConfigMinSaleQty;
    stockItems.minSaleQty = stockItem?.minSaleQty;
    stockItems.useConfigMaxSaleQty = stockItem?.useConfigMaxSaleQty;
    stockItems.maxSaleQty = stockItem?.maxSaleQty;
    stockItems.useConfigBackorders = stockItem?.useConfigBackorders;
    stockItems.backorders = stockItem?.backorders;
    stockItems.useConfigNotifyStockQty = stockItem?.useConfigNotifyStockQty;
    stockItems.notifyStockQty = stockItem?.notifyStockQty;
    stockItems.useConfigQtyIncrements = stockItem?.useConfigQtyIncrements;
    stockItems.qtyIncrements = stockItem?.qtyIncrements;
    stockItems.useConfigEnableQtyInc = stockItem?.useConfigEnableQtyInc;
    stockItems.enableQtyIncrements = stockItem?.enableQtyIncrements;
    stockItems.useConfigManageStock = stockItem?.useConfigManageStock;
    stockItems.manageStock = stockItem?.manageStock;
    stockItems.isDecimalDivided = stockItem?.isDecimalDivided;
    stockItems.stockStatusChangedAuto = stockItem?.stockStatusChangedAuto;
    return stockItems;
  }

  List<product_model.ConfigurableProductOption> getConfigurableProduct(
      List<product_model.ConfigurableProductOption>?
          configurableProductOptions) {
    List<product_model.ConfigurableProductOption> configurableProductList = [];
    for (product_model.ConfigurableProductOption element
        in configurableProductOptions ?? []) {
      product_model.ConfigurableProductOption configurableProductOption =
          product_model.ConfigurableProductOption();
      List<product_model.Values> valuesList = [];

      configurableProductOption.id = element.id;
      configurableProductOption.label = element.label;
      configurableProductOption.attributeId = element.attributeId;
      configurableProductOption.position = element.position;
      configurableProductOption.productId = element.productId;

      element.values?.forEach((valueData) {
        product_model.Values values =
            product_model.Values(valueIndex: valueData.valueIndex);
        valuesList.add(values);
      });

      configurableProductOption.values = valuesList;

      configurableProductList.add(configurableProductOption);
    }
    return configurableProductList;
  }

  void fillValueInDotsList(RxList<product_model.ProductItem> itemList) {
    dotsList = [];
    productImageList = [];
    for (product_model.ProductItem item in itemList) {
      List<String> tempImg = [];
      if (item.mediaGalleryEntries != null) {
        List<product_model.MediaGalleryEntry> tempList = item
            .mediaGalleryEntries!
            .where((element) => element.mediaType == "image")
            .toList();

        for (var element in tempList) {
          if (element.file != null) {
            tempImg.add(element.file!);
          }
        }

        List<bool> list = List.generate(tempList.length, (index) => false);
        if (list.isNotEmpty) {
          list.first = true;
          dotsList.add(list);
          productImageList.add(tempImg);
        } else {
          dotsList.add(list);
          productImageList.add(tempImg);
        }
      }
    }
  }

  void getParticularItem() {
    listData.clear();
    debugPrint("listData===================$listData");
    searchItemList.value.items?.forEach((SearchItems element) {
      debugPrint("listData===================${element.id}");
      if (element.id != null) {
        listData.add(element.id ?? 0);
        debugPrint("listDataDATATATTATA===================$listData");
      }
    });
  }

  void productOnPageChanged(int index, int index2) {
    dotsList[index] = List.generate(
      dotsList[index].length,
      (index) => false,
    );
    dotsList[index][index2] = true;
    update(
      ['images_dots', 'back_button', 'next_button'],
    );
  }

  bool isMediaGalleryEntriesEmpty(
      List<product_model.MediaGalleryEntry>? mediaGalleryEntries) {
    return (mediaGalleryEntries?.isEmpty ?? true) ||
            (mediaGalleryEntries?[0].file?.isEmpty ?? true)
        ? true
        : false;
  }

  bool scrollNotificationData(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.pixels ==
            scrollNotification.metrics.maxScrollExtent &&
        scrollNotification.metrics.axisDirection == AxisDirection.down &&
        !productLoading.value &&
        !productIsEnded.value) {
      getSearchData(
        argument: lastInputValue.value,
      );
    }
    return true;
  }
}
