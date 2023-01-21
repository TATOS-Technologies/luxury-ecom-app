import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/api_repository/generate_cart_repo.dart';
import 'package:meta_package/api/api_repository/my_orders_api_repository.dart';
import 'package:meta_package/api/api_repository/recommended_products_api_repository.dart';
import 'package:meta_package/api/api_repository/wishlist_api_repository.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/recommended_products/recommended_products_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:suvandnat/app/controller/cart/cart_controller.dart';
import 'package:suvandnat/app/controller/product_detail/product_detail_dialog.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/colors.dart';

class ProductDetailController extends GetxController with GetSingleTickerProviderStateMixin {
  String argumentBrandOrDash = "brand";

  Rx<ProductItem>? product = ProductItem().obs;
  RxBool isLoading = true.obs;
  RxBool isAddToCartLoading = false.obs;
  RxBool productIsInCart = false.obs;
  final CartController cartController = Get.find();

  RxBool isSelected = false.obs;
  RxBool isSelected1 = false.obs;
  RxInt frameIndex = 0.obs;
  PageController controllerPage = PageController(initialPage: 0);
  TextEditingController emailController = TextEditingController();
  RxString estimatedTime = "".obs;
  RxBool isInStock = false.obs;
  RxBool isWishlist = false.obs;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController urlOfImageController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController styleController = TextEditingController();
  final TextEditingController keywordController = TextEditingController();
  final TextEditingController urlOfWebsiteController = TextEditingController();
  final TextEditingController linkCheaperProductController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController isProductAvailableController = TextEditingController();

  RxList<CountryListModel> getCountryListData = RxList<CountryListModel>();
  Rx<CountryListModel> selectedCountry = CountryListModel().obs;

  MyOrdersAPIRepository myOrdersAPIRepository = MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  AddressAPIRepository addressAPIRepository =
      AddressAPIRepository(addressService: AddAddressService(AppConstants.apiEndPointLogin));
  WishListAPIRepository wishListAPIRepository = WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final CartGenerateAddRepository cartGenerateAddRepository;

  ProductDetailController({required this.cartGenerateAddRepository});

  @override
  void onInit() {
    getChooseOption();
    getSizeListFromApi();
    getCountryList();
    // argument 0 => product details
    // TODO find correct argument
    // argument 1 =? brand / dash (not sure needs confirmation)

    if (Get.parameters.containsKey("sku") && (Get.parameters[kRouteParameterProductSkuKey]?.isNotEmpty ?? false)) {
      product?.value.sku = Get.parameters[kRouteParameterProductSkuKey];
      getProductDetail();
    } else {
      product?.value = Get.arguments[0] is ProductItem ? Get.arguments[0] as ProductItem : ProductItem();
    }
    debugPrint("product sku --> ${product?.value.sku}");

    if ((Get.arguments as List).length > 1) {
      argumentBrandOrDash = Get.arguments[1].toString();
    }

    super.onInit();
    getRecommendedProductDataFromApi();
    getEstimatedTime();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  RxString slectSize = "".obs;

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

  List<SizeModel> sizeListData = <SizeModel>[].obs;
  RxList<SizeModel> chooseOption = <SizeModel>[].obs;
  RxList<SizeModel> sizeList = <SizeModel>[].obs;

  RxList<RecommendedProductModel> itemsData = <RecommendedProductModel>[].obs;

  ///API CALLING
  Future<void> getRecommendedProductDataFromApi() async {
    isLoading(true);
    try {
      List<RecommendedProductModel> data =
          await recommendedProductsAPIRepository.getRecommendedProductResponse(product?.value.sku.toString() ?? "");

      if (data.isNotEmpty == true) {
        itemsData.value = data;
      }
      isLoading(false);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
      isLoading(false);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCountryList() async {
    try {
      List<CountryListModel>? countryList = await addressAPIRepository.getCountryListResponse();
      if (countryList?.isNotEmpty == true) {
        getCountryListData.value = countryList!;
        getCountryListData.removeWhere((element) => (element.fullNameEnglish?.isEmpty ?? true));
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> getProductDetail() async {
    isLoading(true);
    try {
      ProductItem data =
          await recommendedProductsAPIRepository.getProductDetailApi(product?.value.sku.toString() ?? "");
      product?.value = data;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getEstimatedTime() async {
    try {
      List<dynamic> data = await recommendedProductsAPIRepository.getEstimatedTime(product?.value.id.toString() ?? "");
      if (data[0].runtimeType == bool) {
        isInStock.value = false;
        estimatedTime.value = data[1].toString();
      } else {
        isInStock.value = true;
        estimatedTime.value = data[0].toString();
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> getSizeListFromApi() async {
    isLoading(true);
    try {
      Map<String, dynamic> data = await recommendedProductsAPIRepository.getSizeListApi(Get.arguments[1].toString());
      if (data[0].label != "No Data") {
        isLoading(true);
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
  }

  RxList<SizeModel> listOfChoose = <SizeModel>[].obs;

  Future<void> getChooseOption() async {
    isLoading(true);
    try {
      List<SizeModel> data = await recommendedProductsAPIRepository.getChooseInSizeList();
      if (data.isNotEmpty == true) {
        chooseOption.value = data;
      }
      if (product?.value.extensionAttributes?.configurableProductOptions?.isNotEmpty ?? false) {
        product?.value.extensionAttributes?.configurableProductOptions?.first.values?.forEach((element) {
          final SizeModel sizeModel =
              chooseOption.firstWhere((element2) => element.valueIndex.toString() == element2.value.toString());
          listOfChoose.add(sizeModel);
        });
      }

      listOfChoose.add(
        SizeModel(
          label: LanguageConstants.sizeMissingNotifiedItsBack.tr,
          value: 'Missing',
        ),
      );
      isLoading(false);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      isLoading(false);
      Validators.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> addToCart({bool showDialogue = true}) async {
    try {
      if (checkProductTypeIsConfigurable() && sizeList.isEmpty) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: CommonTextPoppins(LanguageConstants.selectProductOption.tr)),
        );
        return;
      }
      isAddToCartLoading.value = true;

      if (product != null) {
        await cartGenerateAddRepository.addtoCart(product?.value ?? ProductItem(), sizeList);
        productIsInCart.value = true;
        if (showDialogue) {
          return ProductDetailDialog.showDialogBox(
            Get.context!,
            product?.value.name ?? '',
            productImage(),
          );
        } else {
          Get.toNamed(RoutesConstants.checkoutOrderScreen, arguments: cartController.cartModel.value);
        }
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {
      isAddToCartLoading.value = false;
    }
  }

  Future<void> getGenerateCart({bool isDialogShow = true}) async {
    try {
      isAddToCartLoading.value = true;
      if (checkProductTypeIsConfigurable() && sizeList.isEmpty) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: CommonTextPoppins(LanguageConstants.selectProductOption.tr)),
        );
        return;
      }

      if (localStore.customerToken.isNotEmpty) {
        String data = await recommendedProductsAPIRepository.getGenerateCartApiResponse();
        if (data.isNotEmpty == true) {
          await postAddToCartData(
              product?.value.name ?? '',
              productImage(),
              product?.value.sku ?? '',
              "1",
              data,
              product?.value.typeId ?? '',
              checkProductTypeIsConfigurable()
                  ? product?.value.extensionAttributes?.configurableProductOptions?.first.attributeId ?? ''
                  : "0",
              checkProductTypeIsConfigurable() ? (sizeList.first.value ?? '').toString() : "0",
              isDialogShow);
        }
      } else {
        await localStore.getGuestToken();

        if (localStore.guestToken.isNotEmpty) {
          await postAddToCartData(
              product?.value.name ?? '',
              productImage(),
              product?.value.sku ?? '',
              "2",
              localStore.guestToken,
              product?.value.typeId ?? '',
              checkProductTypeIsConfigurable()
                  ? product?.value.extensionAttributes?.configurableProductOptions?.first.attributeId ?? ''
                  : "0",
              checkProductTypeIsConfigurable() ? (sizeList.first.value ?? '').toString() : "0",
              isDialogShow);
        } else {
          String data = await recommendedProductsAPIRepository.getGenerateCartApiResponse();
          if (data.isNotEmpty == true) {
            await LocalStore.setPrefStringValue(
              kStorageConstGuestauthToken,
              (data).replaceAll('"', ''),
            );
            await localStore.getGuestToken();
            await postAddToCartData(
                product?.value.name ?? '',
                productImage(),
                product?.value.sku ?? '',
                "2",
                localStore.guestToken,
                product?.value.typeId ?? '',
                checkProductTypeIsConfigurable()
                    ? product?.value.extensionAttributes?.configurableProductOptions?.first.attributeId ?? ''
                    : "0",
                checkProductTypeIsConfigurable() ? (sizeList.first.value ?? '').toString() : "0",
                isDialogShow);
          }
        }
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      isAddToCartLoading.value = false;
      log(e.toString());
      Validators.appCatchError(error: e);
    } finally {
      isAddToCartLoading.value = false;
    }
  }

  Future<void> postAddToCartData(String dataName, String customImage, String sku, String getValue, String getToken,
      String productType, String optionId, String optionValue, bool isDialogShow) async {
    Map<String, Map<String, Object>> passedAddToCart;
    try {
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
                    "option_value": "${sizeList.first.value == "Missing" ? slectSize : optionValue}"
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
        await recommendedProductsAPIRepository.postAddTOCartProductResponse(passedAddToCart);
      } else {
        await recommendedProductsAPIRepository.guestPostAddTOCartProductResponse(passedAddToCart);
      }
      productIsInCart.value = true;
      if (isDialogShow) {
        return ProductDetailDialog.showDialogBox(Get.context!, dataName, customImage);
      } else {
        Get.toNamed(RoutesConstants.checkoutOrderScreen, arguments: cartController.cartModel.value);
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> wishlistOnTap(BuildContext context) async {
    try {
      isAddToCartLoading.value = true;
      if (localStore.customerToken.toString() != "") {
        if (isWishlist.value) {
          await deleteWishListData(
            context,
            product?.value.name ?? "",
            productImage(),
            product?.value.sku ?? "",
            product?.value.id.toString() ?? "",
          );
        } else {
          await postAddToWishlistData(
            context,
            product?.value.name ?? "",
            productImage(),
            product?.value.sku ?? "",
          );
        }
      } else {
        await addWishListDataToLocal();
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isAddToCartLoading.value = false;
    }
  }

  Future<void> addWishListDataToLocal() async {
    WishListProductModel mainDataObj = WishListProductModel();
    mainDataObj = await localStore.getWishListData();

    log("${mainDataObj.items?.length ?? 0}", name: "wishListData mainDataObj");

    ItemProduct itemProduct = ItemProduct();
    WishlistItem objProduct = WishlistItem();
    ExtensionAttributesProduct extensionAttributes = ExtensionAttributesProduct();
    StockItem stockItems = StockItem();
    List<ItemProduct>? lstItemProduct = mainDataObj.items ?? [];
    objProduct.id = product?.value.id;
    objProduct.sku = product?.value.sku;
    objProduct.name = product?.value.name;
    objProduct.attributeSetId = product?.value.attributeSetId;
    objProduct.price = product?.value.price;
    objProduct.status = product?.value.status;
    objProduct.visibility = product?.value.visibility;
    objProduct.typeId = product?.value.typeId;
    objProduct.createdAt = product?.value.createdAt;
    objProduct.updatedAt = product?.value.updatedAt;
    objProduct.productLinks = product?.value.productLinks;
    objProduct.tierPrices = product?.value.tierPrices;
    objProduct.customAttributes = [];
    extensionAttributes.configurableProductOptions = [];
    for (CustomAttributes element in product?.value.customAttributes ?? []) {
      CustomAttributes customAttribute = CustomAttributes();
      customAttribute.value = element.value.toString();
      customAttribute.attributeCode = element.attributeCode;
      objProduct.customAttributes?.add(customAttribute);
    }

    stockItems = convertStockItem(product?.value.extensionAttributes?.stockItem);

    extensionAttributes.configurableProductOptions = getConfigurableProduct(
      product?.value.extensionAttributes?.configurableProductOptions,
    );

    extensionAttributes.convertedRegularOldPrice = product?.value.extensionAttributes?.convertedRegularOldPrice;
    extensionAttributes.convertedRegularPrice = product?.value.extensionAttributes?.convertedRegularPrice;

    extensionAttributes.stockItem = stockItems;
    objProduct.extensionAttributes = extensionAttributes;
    itemProduct.id = product?.value.id;
    itemProduct.product = objProduct;

    lstItemProduct.add(itemProduct);

    mainDataObj.itemsCount = mainDataObj.items == null ? 1 : (mainDataObj.items?.length ?? 0) + 1;
    mainDataObj.items = lstItemProduct;
    isWishlist.value = true;
    await LocalStore.setPrefStringValue(
      kStorageConstWishListData,
      jsonEncode(mainDataObj),
    );
  }

  Future<void> postAddToWishlistData(BuildContext context, String dataName, String customImage, String sku) async {
    try {
      bool addToWishData = await wishListAPIRepository.addToWishList(
        sku,
        localStore.userDetail.email ?? '',
      );
      isWishlist.value = addToWishData;
      return ProductDetailDialog.showWishlistDialog(
        context,
        dataName,
        customImage,
      );
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> deleteWishListData(
    BuildContext context,
    String dataName,
    String customImage,
    String sku,
    String getId,
  ) async {
    try {
      bool data = await wishListAPIRepository.deleteWishList(getId, localStore.userDetail.email ?? '');
      isWishlist.value = data;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> postNotifyMe(String productSkuId, String email, {double? productSize}) async {
    Map<String, dynamic> bodyData = {};
    try {
      if (productSize != null) {
        bodyData = {
          "notifymeForm": {"email": email, "product_sku": productSkuId, "product_size": productSize.toString()}
        };
      } else {
        bodyData = {
          "notifymeForm": {
            "email": email,
            "product_sku": productSkuId,
          }
        };
      }
      String data = await recommendedProductsAPIRepository.postNotifyMeReq(
        bodyData,
      );
      if (data.isNotEmpty == true) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CommonTextPoppins(data),
          ),
        );
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }

  void showDialogBoxOpen(
    BuildContext context,
    bool fromSpecialSize,
  ) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return Obx(
          () => CommonAlertDialog(
            contentPadding: EdgeInsets.all(24.w),
            radius: 12,
            backgroundColor: infoDialog,
            contentWidget: SizedBox(
              width: 300.w,
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
                        fromSpecialSize ? LanguageConstants.specialSizeRequestsText.tr : LanguageConstants.notifyMe.tr,
                        style: const TextStyle(
                          color: appColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                            right: 8.0,
                          ),
                          child: Icon(
                            Icons.close,
                            size: 22,
                            color: appColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 40.w,
                        width: double.infinity,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            contentPadding: const EdgeInsets.only(
                              bottom: 12,
                              top: 12,
                              left: 10,
                            ),
                            hintText: LanguageConstants.specialSizeEnterEmailText.tr,
                            hintStyle: const TextStyle(
                              color: Color(
                                0xFF6B6B6B,
                              ),
                            ),
                            labelStyle: const TextStyle(
                              color: Color(
                                0xFF6B6B6B,
                              ),
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              borderSide: const BorderSide(
                                color: appColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              borderSide: const BorderSide(
                                color: appColor,
                                width: 1.0,
                              ),
                            ),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: appColor,
                              ),
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Enter Email";
                            }
                            return "";
                          },
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      fromSpecialSize
                          ? Container(
                              height: MediaQuery.of(context).size.height / 15.6,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                                border: Border.all(
                                  color: appColor,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: sizeListData
                                      .map(
                                        (value) => DropdownMenuItem(
                                          child: Text(
                                            value.value.toString(),
                                          ),
                                          value: value.value.toString(),
                                        ),
                                      )
                                      .toList(),
                                  isExpanded: true,
                                  hint: slectSize.toString() == ""
                                      ? Text(
                                          LanguageConstants.specialSizeSelectSizeText.tr,
                                        )
                                      : Text(
                                          "$slectSize",
                                          style: const TextStyle(
                                            color: Colors.black,
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
                            )
                          : Container(),
                      const SizedBox(height: 25.0),
                      CommonThemeButton(
                        onTap: fromSpecialSize
                            ? () async {
                                Get.back();
                                isAddToCartLoading.value = true;
                                try {
                                  await recommendedProductsAPIRepository.postSpecialSizeResponse(
                                      email: emailController.text,
                                      sku: product?.value.sku.toString() ?? "",
                                      website: 'www.suvandnat.com');
                                } on ApiException catch (e) {
                                  Validators.apiExceptionError(e: e);
                                } catch (e) {
                                  log(e.toString(), name: "Error");
                                  Validators.appCatchError(error: e);
                                }
                                emailController.clear();
                              }
                            : () async {
                                Get.back();
                                isAddToCartLoading.value = true;

                                if (product!.value.typeId == 'configurable') {
                                  await postNotifyMe(
                                    product?.value.sku ?? "",
                                    emailController.text,
                                    productSize: double.parse(slectSize.value),
                                  );
                                } else {
                                  await postNotifyMe(
                                    product?.value.sku ?? "",
                                    emailController.text,
                                  );
                                }
                                emailController.clear();
                              },
                        title: LanguageConstants.specialSizeSubmitText.tr,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  StockItem convertStockItem(StockItem? stockItem) {
    StockItem stockItems = StockItem();
    stockItems.itemId = stockItem?.itemId;
    stockItems.productId = stockItem?.productId;
    stockItems.stockId = stockItem?.stockId;
    stockItems.qty = stockItem?.qty;
    stockItems.isInStock = stockItem?.isInStock;
    stockItems.isQtyDecimal = stockItem?.isQtyDecimal;
    stockItems.showDefaultNotificationMessage = stockItem?.showDefaultNotificationMessage;
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
    List<ConfigurableProductOption>? configurableProductOptions,
  ) {
    List<ConfigurableProductOption> configurableProductList = [];
    for (ConfigurableProductOption element in configurableProductOptions ?? []) {
      ConfigurableProductOption configurableProductOption = ConfigurableProductOption();
      List<Values> valuesList = [];

      configurableProductOption.id = element.id;
      configurableProductOption.label = element.label;
      configurableProductOption.attributeId = element.attributeId;
      configurableProductOption.position = element.position;
      configurableProductOption.productId = element.productId;

      element.values?.forEach((valueData) {
        Values values = Values(
          valueIndex: valueData.valueIndex,
        );
        valuesList.add(
          values,
        );
      });

      configurableProductOption.values = valuesList;

      configurableProductList.add(configurableProductOption);
    }
    return configurableProductList;
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
    product?.value = ProductItem(
      id: int.parse(itemsData[index].productId.toString()),
      sku: itemsData[index].sku,
    );
    getProductDetail();
  }

  Future<void> notifyOnClick() async {
    try {
      await localStore.getUserDetail();

      if (localStore.customerToken.isEmpty && (localStore.userDetail.email?.isEmpty ?? true)) {
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
              productSize: sizeList.first.value != "Missing" ? double.parse(sizeList.first.label.toString()) : 0,
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
            product?.value.sku ?? "",
            localStore.userDetail.email!,
          );
        }
      }
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isAddToCartLoading.value = false;
    }
  }

  Future<String> createMyTicketForCancelItemOrder(bool isPurchased) async {
    debugPrint("getStoreDataFromApi -> ");
    final map = {
      "ticketForm": {
        "name": localStore.userDetail.firstname,
        "last_name": localStore.userDetail.lastname,
        "email": localStore.userDetail.email,
        "phone": phoneNumberController.text,
        "brand": (getBrands().isEmpty) ? 'Test' : getBrands(),
        "style": styleController.text,
        "keyword": keywordController.text,
        "image_url": urlOfImageController.text,
        "remarks": remarksController.text,
        "lang_code": localStore.currentCode,
        "customer_id": localStore.userDetail.id,
        "ticket_type": 1,
        "is_it_bought": "$isPurchased",
        "cheaper_website": urlOfWebsiteController.text,
        "cheaper_link": linkCheaperProductController.text,
        "Cheaper_price_with_tax": priceController.text,
        "cheaper_avaliable": isProductAvailableController.text,
        "country_id": selectedCountry.value.id
      }
    };
    try {
      Map<String, dynamic> returnReasonListData = await myOrdersAPIRepository.postCreateMyTickets(jsonEncode(map));
      debugPrint("getStoreDataFromApi createMyTicketForCancelItemOrder -> $returnReasonListData");
      debugPrint("Cancel createMyTicketForCancelItemOrder list Get");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }
    return '';
  }

  bool checkProductTypeIsConfigurable() {
    return product?.value.typeId.toString() == "configurable";
  }

  bool productIsInStock() {
    return product?.value.extensionAttributes != null ? isInStock.value : false;
  }

  String getMaterial() {
    product?.value.customAttributes?.forEach((element) {
      if (element.attributeCode == "material") {
        return element.value ?? '';
      }
    });
    return '';
  }

  String getComposition() {
    product?.value.customAttributes?.forEach((element) {
      if (element.attributeCode == "composition") {
        return element.value ?? '';
      }
    });
    return '';
  }

  String getColor() {
    return product?.value.getColor() ?? '';
  }

  String getBrands() {
    return product?.value.getBrandName() ?? '';
  }

  Future<void> buyNowOnTap() async {
    if (productIsInCart.value) {
      Get.toNamed(RoutesConstants.checkoutOrderScreen, arguments: cartController.cartModel.value);
    } else {
      await addToCart(showDialogue: false);
    }
  }
}
