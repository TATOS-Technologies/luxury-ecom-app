import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:brandslabels/app/controller/cart_controller.dart';
import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/data/local_data/local_store.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/presentation/screens/search/widget/search_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/menu_api_repository.dart';
import 'package:meta_package/api/api_repository/recommended_products_api_repository.dart';
import 'package:meta_package/api/api_repository/search_api_repository.dart';
import 'package:meta_package/api/api_repository/wishlist_api_repository.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/recommended_products/recommended_products_model.dart';
import 'package:meta_package/api/models/search/search_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';

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

  Rx<MenuModel> menuModel = MenuModel().obs;

  Rx<SearchModel> searchItemList = SearchModel().obs;
  Rx<ProductModel> searchProductList = ProductModel().obs;

  RxList listData = [].obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isLoading = true.obs;

  RxList<ProductItem> productsList = <ProductItem>[].obs;
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

  List<List<String>> productImageList = [];
  List<List<bool>> dotsList = [];
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    txtList.addListener(() {
      searchValue.value = txtList.text;
    });
    getSizeApiRes();
    getMenuDataFromApi();
  }

  Future<void> getSizeApiRes() async {
    try {
      List<SizeModel> data =
          await recommendedProductsAPIRepository.getChooseInSizeList();
      chooseOption.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> getMenuDataFromApi() async {
    try {
      isLoading(true);
      debugPrint("CONTROLLER DATA ==============$menuModel");
      MenuModel data = await menuAPIRepository.getMenuAPISearchResponse();
      menuModel.value = data;
      isLoading(false);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getChooseOption(ProductItem item) async {
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
      listOfChoose.add(
        SizeModel(
          label: 'Size missing? Be notified when it is back in',
          value: 'Missing',
        ),
      );

      debugPrint("Choose Option Selecte 3 List $listOfChoose");
      await getRecommendedProductDataFromApi(item);
      visibleLoader.value = false;
      debugPrint("Choose Option List 3$chooseOption");
    } catch (e) {
      visibleLoader.value = false;
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> recommendationTap(
      int index, CartController cartController) async {
    ProductItem tempProduct = ProductItem(
      id: int.parse(recommendationList[index].productId.toString()),
      sku: recommendationList[index].sku,
    );
    Get.back();
    ProductItem? tempItem = await getProductDetail(tempProduct);
    if (tempItem != null) {
      Get.toNamed(
        RoutesConstants.productDetailScreen,
        arguments: [tempItem],
      )?.whenComplete(
        () {
          cartController.getGenerateCart();
        },
      );
    }
  }

  Future<ProductItem?> getProductDetail(ProductItem item) async {
    visibleLoader.value = true;
    try {
      ProductItem data = await recommendedProductsAPIRepository
          .getProductDetailApi(item.sku.toString());
      visibleLoader.value = false;
      return data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      visibleLoader.value = false;
    }
    return null;
  }

  Future<void> getRecommendedProductDataFromApi(ProductItem item) async {
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
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> addToCartPopUPTap(
      ProductItem item, CartController cartController) async {
    if (item.typeId.toString() == "configurable") {
      if (sizeList.isEmpty) {
        dropdownValidator.value = true;
      } else {
        dropdownValidator.value = false;
        dialogLoader.value = true;
        await onAddToCart(item);
        await cartController.getGenerateCart();
        dialogLoader.value = false;
      }
    } else {
      dropdownValidator.value = false;
      dialogLoader.value = true;
      await onAddToCart(item);
      await cartController.getGenerateCart();
      dialogLoader.value = false;
    }
  }

  Future<void> onAddToCart(ProductItem item) async {
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
            : (sizeList.first.value ?? ''),
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
    try {
      debugPrint("User Token Is ${localStore.customerToken}");
      if (localStore.customerToken.toString() != "") {
        debugPrint("Customer");
        String data =
            await recommendedProductsAPIRepository.getGenerateCartApiResponse();
        if (data.isNotEmpty) {
          await postAddToCartData(
            context,
            dataName,
            customImage,
            sku,
            "1",
            data,
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
          if (data.isNotEmpty) {
            await LocalStore.setPrefStringValue(
              kStorageConstGuestauthToken,
              (data).replaceAll('"', ''),
            );
            await localStore.getGuestToken();
            debugPrint("Guest Token Is ${localStore.guestToken}");
            await postAddToCartData(
              context,
              dataName,
              customImage,
              sku,
              "2",
              data,
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
      debugPrint(e.toString());
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
    try {
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
        await recommendedProductsAPIRepository
            .guestPostAddTOCartProductResponse(passedAddTocart);
      }
      debugPrint("Add To Cart Data");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
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
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isSearchDataLoad.value = false;
    }
  }

  Future<void> getSearchProductList({itemId}) async {
    try {
      ProductModel data = await searchAPIRepository.getSearchProductAPIResponse(
          AppConstants.getUrlWithCode(),
          itemID: itemId);
      searchProductList.value = data;
      if (!productIsEnded.value) {
        productsList.addAll(searchProductList.value.items ?? []);
        productsList.refresh();
        productCount += (searchProductList.value.items?.length ?? 0);
        currentPage.value++;
        fillValueInDotsList(productsList);
        log('itemsNumber.value is:--->> $productCount');
      }
      isSearchDataLoad.value = false;
      update();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isSearchDataLoad.value = false;
    }
  }

  void fillValueInDotsList(List<ProductItem> itemList) {
    dotsList = [];
    productImageList = [];
    for (ProductItem item in itemList) {
      List<String> tempImg = [];
      if (item.mediaGalleryEntries != null) {
        List<MediaGalleryEntry> tempList = item.mediaGalleryEntries
                ?.where((element) => (element.mediaType == "image"))
                .toList() ??
            [];

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

  void searchOnChanged(String val) {
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

  void getParticularItem() {
    try {
      listData.clear();
      searchItemList.value.items?.forEach((element) {
        if (element.id != null) {
          listData.add(element.id);
        }
      });
    } catch (e) {
      isSearchDataLoad.value = false;
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
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

  bool isMediaGalleryEntriesEmpty(ProductItem item) {
    return (item.mediaGalleryEntries?.isEmpty ?? true) ||
        (item.mediaGalleryEntries?[0].file?.isEmpty ?? true);
  }

  String productImage(int index) {
    return "${AppConstants.productImageUrl}${productImageList[index].first}";
  }

  Future<void> wishListOnTap({ProductItem? product, int? index}) async {
    try {
      visibleLoader.value = true;
      if (!productsList[index!].isWishList.value) {
        if (localStore.customerToken.isNotEmpty) {
          bool addToWishData = await wishListAPIRepository.addToWishList(
              product?.sku ?? '', localStore.userDetail.email ?? '');
          visibleLoader.value = false;
          productsList[index].isWishList.value = addToWishData;
          SearchDialog.showWishlistDialog(
              product?.name ?? '', productImage(index));
        } else {
          WishListProductModel mainDataObj = WishListProductModel();
          mainDataObj = await localStore.getWishListData();

          ItemProduct itemProduct = ItemProduct();
          WishlistItem objProduct = WishlistItem();
          ExtensionAttributesProduct extensionAttributes =
              ExtensionAttributesProduct();
          StockItem stockItems = StockItem();
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
          for (CustomAttributes element in product?.customAttributes ?? []) {
            CustomAttributes customAttribute = CustomAttributes();
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
              product?.name ?? '', productImage(index));
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      visibleLoader.value = false;
    }
  }

  StockItem convertStockItem(StockItem? stockItem) {
    StockItem stockItems = StockItem();
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

  List<ConfigurableProductOption> getConfigurableProduct(
      List<ConfigurableProductOption>? configurableProductOptions) {
    List<ConfigurableProductOption> configurableProductList = [];
    for (ConfigurableProductOption element
        in configurableProductOptions ?? []) {
      ConfigurableProductOption configurableProductOption =
          ConfigurableProductOption();
      List<Values> valuesList = [];

      configurableProductOption.id = element.id;
      configurableProductOption.label = element.label;
      configurableProductOption.attributeId = element.attributeId;
      configurableProductOption.position = element.position;
      configurableProductOption.productId = element.productId;

      element.values?.forEach((valueData) {
        Values values = Values(valueIndex: valueData.valueIndex);
        valuesList.add(values);
      });

      configurableProductOption.values = valuesList;

      configurableProductList.add(configurableProductOption);
    }
    return configurableProductList;
  }
}
