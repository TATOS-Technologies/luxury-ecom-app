import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/generate_cart_repo.dart';
import 'package:meta_package/api/models/my_ticket/create_ticket_request.dart';
import 'package:meta_package/api/models/product/product_model.dart'
    as product_model;
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/screens/product_detail/widgets/recommentaton_widget.dart';

class ProductDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<product_model.ProductItem>? product = product_model.ProductItem().obs;
  RxBool isLoading = false.obs;
  RxBool isAddToCartLoading = false.obs;
  RxBool productIsInCart = false.obs;

  final TextEditingController emailController = TextEditingController();
  RxString slectSize = "".obs;
  RxList<SizeModel> sizeList = RxList([]);
  RxString estimatedTime = "".obs;

  RxList<CountryListModel> getCountryListData = RxList<CountryListModel>();
  Rx<CountryListModel> selectedCountry = CountryListModel().obs;

  RxInt frameIndex = 0.obs;
  PageController controllerPage = PageController(initialPage: 0);
  MyAccountDetails userDetail = MyAccountDetails();

  TextEditingController emailControllerChat = TextEditingController();
  TextEditingController firstNameControllerChat = TextEditingController();

  GlobalKey<FormState> formKeyChat = GlobalKey<FormState>();
  final CartController cartController = Get.find();

  ///
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController urlOfImageController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController styleController = TextEditingController();
  final TextEditingController keywordController = TextEditingController();
  final TextEditingController urlOfWebsiteController = TextEditingController();
  final TextEditingController linkCheaperProductController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController isProductAvailableController =
      TextEditingController();

  RxBool isInStock = false.obs;
  MyOrdersAPIRepository myOrdersAPIRepository =
      MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  AddressAPIRepository addressAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));
  final CartGenerateAddRepository cartGenerateAddRepository;

  ProductDetailController({required this.cartGenerateAddRepository});

  @override
  void onInit() async {
    controller = TabController(vsync: this, length: myTabs.length);

    await localStore.getUserDetail();
    userDetail = localStore.userDetail;

    if (Get.parameters.containsKey("sku") &&
        (Get.parameters[kRouteParameterProductSkuKey]?.isNotEmpty ?? false)) {
      debugPrint(
          "product sku --> ${Get.parameters[kRouteParameterProductSkuKey]}");
      product?.value.sku = Get.parameters[kRouteParameterProductSkuKey];
      debugPrint("Sku!!!${product?.value.sku}");
    } else {
      product?.value = Get.arguments[0] is product_model.ProductItem
          ? Get.arguments[0] as product_model.ProductItem
          : product_model.ProductItem();
      debugPrint("product sku --> ${product?.value.sku}");
    }
    debugPrint("Product Id ---> ${product?.value.id}");
    debugPrint("Product Name ---> ${product?.value.name}");
    await getProductDetail();
    getChooseOption();
    //getSizeListFromApi();

    super.onInit();
    getRecommendedProductDataFromApi();
    getEstimatedTime();
    getCountryList();

    controllerPage.addListener(() {
      frameIndex.value = controllerPage.page?.toInt() ?? 0;
    });
  }

  bool productIsInStock() {
    log('productIsInStock is:-->>${product?.value.extensionAttributes?.stockItem?.isInStock}');
    return product?.value.extensionAttributes != null ? isInStock.value : false;
  }

  Future<void> getCountryList() async {
    try {
      debugPrint("getStoreDataFromApi -> ");

      List<CountryListModel>? countryList =
          await addressAPIRepository.getCountryListResponse();
      if (countryList?.isNotEmpty == true) {
        getCountryListData.value = countryList!;
      }
      debugPrint("country list Get $getCountryListData");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {}
  }

  void onRecommended() {
    // getSizeListFromApi();
    getRecommendedProductDataFromApi();
  }

  void clickChatEvent({String? name, String? email}) {
    Livechat.beginChat(
        AppConstants.licenceId,
        '1',
        name ?? userDetail.firstname.toString().trim(),
        email ?? userDetail.email.toString().trim(), {});
  }

  final List<Tab> myTabs = <Tab>[
    Tab(text: LanguageConstants.recommendation.tr),
    Tab(text: LanguageConstants.recentlyViewed.tr),
  ];

  late TabController controller;

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  RxBool isSelected = false.obs;
  RxBool isSelected1 = false.obs;

  RxList<RecommendedProductModel> itemsData = RxList([]);
  RxList<SizeModel> sizeListData = RxList([]);
  RxList<SizeModel> chooseOption = RxList([]);

  Future<void> getEstimatedTime() async {
    debugPrint("this is product id ====> ${product?.value.id}");
    try {
      List<dynamic> response =
          await recommendedProductsAPIRepository.getEstimatedTime(
        product?.value.id.toString() ?? '',
      );
      if (response[0].runtimeType == bool) {
        isInStock.value = false;
        estimatedTime.value = response[1].toString();
      } else {
        isInStock.value = true;
        estimatedTime.value = response[0].toString();
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {}
  }

  Future<void> getProductDetail() async {
    try {
      isLoading(true);
      product_model.ProductItem data = await recommendedProductsAPIRepository
          .getProductDetailApi(product?.value.sku.toString() ?? '');
      product?.value = data;
      isLoading(false);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<String> createMyTicketForCancelItemOrder(bool isPurchased) async {
    debugPrint("getStoreDataFromApi -> ");
    try {
      Map<String, dynamic> returnReasonListData = await myTicketAPIRepository
          .postCreateMyTickets(TicketForm(CreateTicketRequest(
                  name: localStore.userDetail.firstname,
                  lastName: localStore.userDetail.lastname,
                  email: localStore.userDetail.email,
                  phone: phoneNumberController.text,
                  brand:
                      (product?.value.getBrandName().toString().isEmpty ?? true)
                          ? 'Test'
                          : product?.value.getBrandName(),
                  style: styleController.text,
                  keyword: keywordController.text,
                  imageUrl: urlOfImageController.text,
                  remarks: remarksController.text,
                  langCode: localStore.currentCode,
                  customerId: localStore.userDetail.id,
                  ticketType: 1,
                  isItBought: "$isPurchased",
                  cheaperWebsite: urlOfWebsiteController.text,
                  cheaperLink: linkCheaperProductController.text,
                  cheaperPriceWithTax: priceController.text,
                  cheaperAvailable: isProductAvailableController.text,
                  countryId: selectedCountry.value.id)
              .toJson()));
      debugPrint(
        "getStoreDataFromApi createMyTicketForCancelItemOrder -> $returnReasonListData",
      );
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
    return '';
  }

  ///API CALLING
  Future<void> getRecommendedProductDataFromApi() async {
    isLoading(true);
    try {
      List<RecommendedProductModel> data =
          await recommendedProductsAPIRepository.getRecommendedProductResponse(
              product?.value.sku.toString() ?? '');
      if (data.isNotEmpty == true) {
        itemsData.value = data;
      }
      isLoading(false);
      // recommendedProductModel(itemsData);
      debugPrint("CONTROLLER DATA ==============${itemsData[0].typeId}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  int getMediaGalleryEntriesLenght() {
    if (product?.value.mediaGalleryEntries == null) {
      return 0;
    } else {
      return product?.value.mediaGalleryEntries?.length ?? 0;
    }
  }

  Future<void> getSizeListFromApi() async {
    isLoading(true);
    try {
      debugPrint("Size List initial ${Get.arguments}");
      // todo response structure parsing change
      dynamic sizeListData1 = await recommendedProductsAPIRepository
          .getSizeListApi(product?.value.id.toString() ?? '');

      debugPrint("Size List $sizeListData1");
      if (sizeListData1[0]['status'] != "No Data") {
        debugPrint("Here INside Size");
        // sizeListData.addAll(sizeListData1); // todo uncomment on correct parsing
        debugPrint("Here INside Size111");
        isLoading(true);
        debugPrint("Size List Inside $sizeListData1");
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  RxList<SizeModel> listOfChoose = RxList([]);

  Future<void> getChooseOption() async {
    isLoading(true);
    try {
      List<SizeModel> data =
          await recommendedProductsAPIRepository.getChooseInSizeList();
      debugPrint("Choose Option List $data");
      chooseOption.value = data;
      for (var i in chooseOption) {
        if (product?.value.extensionAttributes?.configurableProductOptions
                ?.first.values !=
            null) {
          for (var f in product?.value.extensionAttributes
                  ?.configurableProductOptions?.first.values ??
              []) {
            if (i.value != "" &&
                (i.value.toString() == f.valueIndex.toString())) {
              listOfChoose.add(i);
            }
          }
        }
      }

      debugPrint('Length === ${listOfChoose.length}');

      listOfChoose.add(
        SizeModel(
          label: LanguageConstants.sizeMissingNotifiedItsBack.tr,
          value: 'Missing',
        ),
      );

      debugPrint("Choose Option Selecte 3 List $listOfChoose");
      isLoading(false);
      debugPrint("Choose Option List 3$chooseOption");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addToCart({bool showDialogue = true}) async {
    try {
      if (checkProductTypeIsConfigurable() && sizeList.isEmpty) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
              content:
                  CommonTextPoppins(LanguageConstants.selectProductOption.tr)),
        );
        return;
      }
      isAddToCartLoading.value = true;

      if (product != null) {
        await cartGenerateAddRepository.addtoCart(
            product?.value ?? product_model.ProductItem(), sizeList);
        if (showDialogue) {
          showAddDialog(Get.context!, product?.value.name, productImage());
        } else {
          // ignore: inference_failure_on_function_invocation
          Get.toNamed(RoutesConstants.checkoutOrderScreen,
              arguments: cartController.cartModel.value);
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {
      isAddToCartLoading.value = false;
    }
  }

  //Add TO Cart Api Calling
  Future<void> getApiCallingForCreteCart() async {
    try {
      Map<String, dynamic> addToCartData =
          await recommendedProductsAPIRepository.getCreateCartApiResponse();
      debugPrint("Response $addToCartData");
      Get.toNamed(RoutesConstants.cartScreen);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {}
  }

  //Add TO Cart Api Calling
  Future<void> postAddToCartData(
      String dataName,
      String customImage,
      String sku,
      String getValue,
      String getToken,
      String productType,
      String optionId,
      String optionValue,
      bool isDialogShow) async {
    try {
      Map<String, Map<String, Object>> passedAddToCart;

      if (productType == "configurable") {
        passedAddToCart = {
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
        passedAddToCart = {
          "cartItem": {"sku": sku, "qty": 1, "quote_id": getToken}
        };
      }

      if (getValue == "1") {
        await recommendedProductsAPIRepository
            .postAddTOCartProductResponse(passedAddToCart);
      } else {
        await recommendedProductsAPIRepository
            .guestPostAddTOCartProductResponse(passedAddToCart);
      }
      productIsInCart.value = true;
      if (isDialogShow) {
        return showAddDialog(Get.context!, dataName, customImage);
      } else {
        Get.toNamed(RoutesConstants.checkoutOrderScreen,
            arguments: cartController.cartModel.value);
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {}
  }

  //Add TO WishList Api Calling
  Future<void> postAddToWishlistData(
      BuildContext context, Rx<product_model.ProductItem> itemData) async {
    try {
      isAddToCartLoading.value = true;
      if (localStore.customerToken.isNotEmpty) {
        bool addToWishData = await wishListAPIRepository.addToWishList(
            product?.value.sku ?? '', localStore.userDetail.email ?? '');
        if (addToWishData) {
          return showWishlistDialog(
              context, product?.value.name ?? '', productImage());
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
        objProduct.id = itemData.value.id;
        objProduct.sku = itemData.value.sku;
        objProduct.name = itemData.value.name;
        objProduct.attributeSetId = itemData.value.attributeSetId;
        objProduct.price = itemData.value.price;
        objProduct.status = itemData.value.status;
        objProduct.visibility = itemData.value.visibility;
        objProduct.typeId = itemData.value.typeId;
        objProduct.createdAt = itemData.value.createdAt;
        objProduct.updatedAt = itemData.value.updatedAt;
        objProduct.productLinks = itemData.value.productLinks;
        objProduct.tierPrices = itemData.value.tierPrices;
        objProduct.customAttributes = [];
        extensionAttributes.configurableProductOptions = [];
        for (product_model.CustomAttributes element
            in itemData.value.customAttributes ?? []) {
          product_model.CustomAttributes customAttribute =
              product_model.CustomAttributes();
          customAttribute.value = element.value.toString();
          customAttribute.attributeCode = element.attributeCode;
          objProduct.customAttributes?.add(customAttribute);
        }

        stockItems =
            convertStockItem(itemData.value.extensionAttributes?.stockItem);

        extensionAttributes.configurableProductOptions = getConfigurableProduct(
            itemData.value.extensionAttributes?.configurableProductOptions);

        extensionAttributes.convertedRegularOldPrice =
            itemData.value.extensionAttributes?.convertedRegularOldPrice;
        extensionAttributes.convertedRegularPrice =
            itemData.value.extensionAttributes?.convertedRegularPrice;

        extensionAttributes.stockItem = stockItems;
        objProduct.extensionAttributes = extensionAttributes;
        itemProduct.id = itemData.value.id;
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
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {
      isAddToCartLoading.value = false;
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

  Future<void> postNotifyMe(String productSkuId, String email,
      {double? productSize}) async {
    try {
      Map<String, dynamic> bodyData = {};
      if (productSize != null) {
        bodyData = {
          "notifymeForm": {
            "email": email,
            "product_sku": productSkuId,
            "product_size": productSize.toString()
          }
        };
      } else {
        bodyData = {
          "notifymeForm": {
            "email": email,
            "product_sku": productSkuId,
          }
        };
      }
      String data =
          await recommendedProductsAPIRepository.postNotifyMeReq(bodyData);
      debugPrint("this is revert data from notify me :- $data");
      if (data.isNotEmpty == true) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CommonTextPoppins(data),
          ),
        );
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {}
  }

  //ShowDialog For Confomation
  void showAddDialog(
      BuildContext context, String? dataname, String? customimage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 10,
          contentPadding: const EdgeInsets.all(14.0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          backgroundColor: homeBackground,
          contentWidget: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    CommonTextPoppins(LanguageConstants.addedYourCart.tr,
                        textAlign: TextAlign.center,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.clear,
                        size: 25.r,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.w),
                CommonTextPoppins("$dataname",
                    textAlign: TextAlign.center,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                SizedBox(height: 20.h),
                Container(
                  height: 195.h,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.all(30.w),
                  decoration: BoxDecoration(
                      color: const Color(0xfffffcf9),
                      borderRadius: BorderRadius.circular(5)),
                  child: CachedNetworkImage(
                    imageUrl: "$customimage",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20.w),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        child: CommonThemeButton(
                          isOutLined: true,
                          buttonColor: homeBackground,
                          textColor: primary,
                          onTap: () {
                            Get.toNamed(RoutesConstants.cartScreen,
                                arguments: true);
                          },
                          title: LanguageConstants.viewCartText.tr,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        child: CommonThemeButton(
                          isOutLined: true,
                          buttonColor: homeBackground,
                          textColor: primary,
                          onTap: () {
                            Get.offAllNamed(RoutesConstants.dashboardScreen);
                          },
                          title: LanguageConstants.continueShoppingText.tr,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                    height: 40.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: appColorPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: productIsInStock()
                          ? () async {
                              await buyNowOnTap();
                            }
                          : null,
                      child: CommonTextPoppins(
                        productIsInStock()
                            ? LanguageConstants.buyNow.tr
                            : LanguageConstants.soldOut.tr,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: whiteColor,
                      ),
                    )),
                SizedBox(height: 30.w),
                itemsData.isEmpty
                    ? const SizedBox()
                    : Center(
                        child: CommonTextPoppins(
                            LanguageConstants.recommendation.tr,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: blackColor),
                      ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                    width: 327.w,
                    height: 250.w,
                    child: itemsData.isEmpty
                        ? Container()
                        : itemsData[0].imageUrl == null
                            ? Center(
                                child: Text(itemsData[0].message.toString()),
                              )
                            : const RecommentationWidget()),
                SizedBox(height: 30.w),
              ],
            ),
          ),
        );
      },
    );
  }

  //show Wish List Add
  //ShowDialog For Confomation
  void showWishlistDialog(
      BuildContext context, String? dataname, String? customimage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 12,
          contentPadding: EdgeInsets.all(20.w),
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          backgroundColor: homeBackground,
          contentWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      size: 22,
                      color: appColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              Text(
                "${LanguageConstants.youaddCartText.tr} $dataname ${LanguageConstants.youaddWishEndText.tr}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: appColor,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 200.w,
                width: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      "$customimage",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 30.w,
                      child: CommonThemeButton(
                        onTap: () {
                          debugPrint("click");
                          Get.toNamed(
                            RoutesConstants.wishlistScreen,
                          );
                        },
                        title: LanguageConstants.viewWishListText.tr,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: SizedBox(
                      height: 30.w,
                      child: CommonThemeButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: LanguageConstants.continueShoppingText.tr,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }

  void showDialogBoxOpen(BuildContext context, bool fromSpecialSize) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => CommonAlertDialog(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.w,
            ),
            insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            backgroundColor: homeBackground,
            contentWidget: Form(
              // key: formKey.value,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.close,
                        size: 22,
                        color: Colors.transparent,
                      ),
                      Text(
                        fromSpecialSize
                            ? LanguageConstants.specialSizeRequestsText.tr
                            : LanguageConstants.notifyMe.tr,
                        style: TextStyle(
                          color: appColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.close,
                            size: 22,
                            color: appColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const SizedBox(
                    width: double.maxFinite, height: 1,
                    // color: const Color(0xFFDEC5B9),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: appTileBGcolor,
                        // contentPadding: const EdgeInsets.only(
                        //   bottom: 12,
                        //   top: 12,
                        //   left: 10,
                        // ),
                        hintText:
                            LanguageConstants.specialSizeEnterEmailText.tr,
                        hintStyle: const TextStyle(color: Color(0xFF6B6B6B)),
                        labelStyle: const TextStyle(color: Color(0xFF6B6B6B)),
                        errorStyle: const TextStyle(color: Colors.red),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterEmail.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),
                  fromSpecialSize
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Container(
                            // height: MediaQuery.of(context).size.height / 15.6,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: appTileBGcolor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                dropdownColor: homeBackground,
                                items: sizeListData
                                    .map(
                                      (value) => DropdownMenuItem(
                                        value: value.value.toString(),
                                        child: Text(value.value.toString()),
                                      ),
                                    )
                                    .toList(),
                                isExpanded: true,
                                hint: slectSize.toString() == ""
                                    ? Text(
                                        LanguageConstants
                                            .specialSizeSelectSizeText.tr,
                                        style: const TextStyle(
                                          color: Color(0xFF6B6B6B),
                                        ),
                                      )
                                    : Text(
                                        "$slectSize",
                                        style: const TextStyle(
                                          color: Color(0xFF6B6B6B),
                                        ),
                                      ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 22,
                                  color: appColor,
                                ),
                                iconEnabledColor: Colors.transparent,
                                onChanged: (value) {
                                  slectSize.value = value.toString();
                                },
                              ),
                            ),
                          ),
                        )
                      : product?.value.typeId == 'configurable'
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 15.6,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  // borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color: appTileBorderColor,
                                    width: 1,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    dropdownColor: homeBackground,
                                    items: sizeListData
                                        .map(
                                          (value) => DropdownMenuItem(
                                            value: value.value.toString(),
                                            child: Text(value.value.toString()),
                                          ),
                                        )
                                        .toList(),
                                    isExpanded: true,
                                    hint: slectSize.toString() == ""
                                        ? Text(
                                            LanguageConstants
                                                .specialSizeSelectSizeText.tr,
                                            style: const TextStyle(
                                              color: Color(0xFF6B6B6B),
                                            ),
                                          )
                                        : Text(
                                            "$slectSize",
                                            style: const TextStyle(
                                              color: Color(0xFF6B6B6B),
                                            ),
                                          ),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 22,
                                      color: appColor,
                                    ),
                                    iconEnabledColor: Colors.transparent,
                                    onChanged: (value) {
                                      slectSize.value = value.toString();
                                    },
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                  const SizedBox(height: 25.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                        backgroundColor: appColorPrimary,
                        elevation: 0),
                    onPressed: fromSpecialSize
                        ? () async {
                            Get.back();
                            isAddToCartLoading.value = true;
                            await recommendedProductsAPIRepository
                                .postSpecialSizeResponse(
                                    email: emailController.text,
                                    sku: product?.value.sku.toString() ?? '',
                                    website: 'www.sololuxury.com');
                            emailController.clear();
                          }
                        : () async {
                            Get.back();
                            isAddToCartLoading.value = true;

                            if (product?.value.typeId == 'configurable') {
                              await postNotifyMe(
                                product?.value.sku ?? '',
                                emailController.text,
                                productSize: double.parse(slectSize.value),
                              );
                            } else {
                              await postNotifyMe(
                                product?.value.sku ?? '',
                                emailController.text,
                              );
                            }
                            emailController.clear();
                          },
                    child: Text(
                      LanguageConstants.specialSizeSubmitText.tr,
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String productImage() {
    for (var element in product?.value.customAttributes ?? []) {
      if (element.attributeCode == "image") {
        return "${AppConstants.productImageUrl}${element.value}";
      }
    }
    return "";
  }

  String getConvertRegularPriceFromConfigurableProduct() {
    return product?.value.extensionAttributes?.convertedRegularPrice ?? '';
  }

  void recommendationOnTap(int index) {
    product?.value = product_model.ProductItem(
      id: int.parse(itemsData[index].productId.toString()),
      sku: itemsData[index].sku,
    );
    getProductDetail();
  }

  Future<void> notifyOnClick() async {
    try {
      await localStore.getUserDetail();

      if (localStore.customerToken.isEmpty &&
          (localStore.userDetail.email?.isEmpty ?? true)) {
        showDialogBoxOpen(
          Get.context!,
          false,
        );
      } else {
        isAddToCartLoading.value = true;

        if (product?.value.typeId == 'configurable') {
          if (sizeList.isNotEmpty) {
            await postNotifyMe(
              product?.value.sku ?? '',
              localStore.userDetail.email ?? '',
              productSize: sizeList.first.value != "Missing"
                  ? double.parse(sizeList.first.label.toString())
                  : 0,
            );
          } else {
            ScaffoldMessenger.of(Get.context!).showSnackBar(
              SnackBar(
                content: CommonTextPoppins(
                  LanguageConstants.pleaseChooseOption.tr,
                ),
              ),
            );
          }
        } else {
          await postNotifyMe(
            product?.value.sku ?? '',
            localStore.userDetail.email!,
          );
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {
      isAddToCartLoading.value = false;
    }
  }

  bool checkProductTypeIsConfigurable() {
    return product?.value.typeId.toString() == "configurable";
  }

  Future<void> buyNowOnTap() async {
    if (productIsInCart.value) {
      Get.toNamed(RoutesConstants.checkoutOrderScreen,
          arguments: cartController.cartModel.value);
    } else {
      await addToCart(showDialogue: false);
    }
  }
}
