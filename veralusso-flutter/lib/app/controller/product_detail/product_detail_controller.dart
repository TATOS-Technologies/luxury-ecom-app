// ignore_for_file: unnecessary_null_comparison, inference_failure_on_function_invocation

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
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/recommended_products/recommended_products_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:veralusso/app/controller/cart/cart_controller.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/const/constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/screens/product_detail/product_detail_dialog.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class ProductDetailController extends GetxController with GetSingleTickerProviderStateMixin {
  Rx<ProductItem>? product = ProductItem().obs;
  RxBool isLoading = true.obs;
  RxBool isScreenLoading = false.obs;

  RxString slectSize = "".obs;
  RxString estimatedTime = "".obs;
  RxList<SizeModel> chooseOption = <SizeModel>[].obs;
  RxList<SizeModel> listOfChoose = <SizeModel>[].obs;
  RxBool isInStock = false.obs;
  RxBool isWishlist = false.obs;

  RxInt frameIndex = 0.obs;
  PageController controllerPage = PageController(initialPage: 0);
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
  final CartController cartController = Get.find();

  RxList<CountryListModel> getCountryListData = <CountryListModel>[].obs;
  Rx<CountryListModel> selectedCountry = CountryListModel().obs;

  MyAccountDetails userDetail = MyAccountDetails();

  MyOrdersAPIRepository myOrdersAPIRepository = MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  AddressAPIRepository addressAPIRepository =
      AddressAPIRepository(addressService: AddAddressService(AppConstants.apiEndPointLogin));
  WishListAPIRepository wishListAPIRepository = WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final CartGenerateAddRepository cartGenerateAddRepository;

  ProductDetailController({required this.cartGenerateAddRepository});

  @override
  Future<void> onInit() async {
    controller = TabController(vsync: this, length: myTabs.length);

    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    product?.value = Get.arguments[0] is ProductItem ? Get.arguments[0] as ProductItem : ProductItem();
    super.onInit();

    await getChooseOption();
    await getRecommendedProductDataFromApi();
    await getEstimatedTime();
    await getCountryList();
  }

  final List<Tab> myTabs = <Tab>[
    Tab(text: LanguageConstants.recommendation.tr),
    Tab(text: LanguageConstants.recentlyViewed.tr),
  ];

  late TabController controller;
  TextEditingController emailController = TextEditingController();
  TextEditingController sizeController = TextEditingController();

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  RxBool isSelected = false.obs;
  RxBool isSelected1 = false.obs;
  RxBool productIsInCart = false.obs;

  RxList<RecommendedProductModel> itemsData = <RecommendedProductModel>[].obs;
  List<SizeModel> sizeListData = <SizeModel>[].obs;
  RxList<SizeModel> sizeList = RxList([]);

  ///API CALLING
  Future<void> getRecommendedProductDataFromApi() async {
    isLoading(true);
    try {
      List<RecommendedProductModel> data =
          await recommendedProductsAPIRepository.getRecommendedProductResponse(product?.value.sku.toString() ?? '');
      if (data.isNotEmpty == true) {
        itemsData.value = data;
      }

      isLoading(false);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCountryList() async {
    try {
      List<CountryListModel>? countryList = await addressAPIRepository.getCountryListResponse();
      if (countryList?.isNotEmpty == true) {
        getCountryListData.value = countryList!;
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }
  }

  Future getProductDetail() async {
    isLoading(true);

    try {
      ProductItem data =
          await recommendedProductsAPIRepository.getProductDetailApi(product?.value.sku.toString() ?? '');
      product?.value = data;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }

    isLoading(false);
  }

  Future<void> postAddToWishlistData(BuildContext context, String dataName, String customImage, String sku) async {
    bool addToWishData = await wishListAPIRepository.addToWishList(sku, localStore.userDetail.email ?? '');
    isWishlist.value = addToWishData;
    if (isWishlist.value) {
      return ProductDetailDialog.showWishlistDialog(
        context,
        dataName,
        customImage,
      );
    }
  }

  Future<void> postNotifyMe(String productSkuId, String email, {double? productSize}) async {
    Map<String, dynamic> bodyData = {};
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

    try {
      String data = await recommendedProductsAPIRepository.postNotifyMeReq(bodyData);
      debugPrint("this is revert data from notify me :- $data");
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
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }
  }

  Future<void> getEstimatedTime() async {
    debugPrint("this is product id ====> ${product?.value.id}");
    try {
      List<dynamic>? response = await recommendedProductsAPIRepository.getEstimatedTime(
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
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }
  }

  Future<void> getChooseOption() async {
    isLoading(true);
    try {
      List<SizeModel> data = await recommendedProductsAPIRepository.getChooseInSizeList();
      chooseOption.value = data;
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

      log(listOfChoose.length.toString(), name: "Length");
      isLoading(false);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e, stackStarce) {
      log(e.toString(), name: "Error");
      log(stackStarce.toString(), name: "stackStarce");
      Validators.appCatchError(error: e);
      isLoading(false);
    }
  }

  Future<void> addToCart({bool isDialogShow = true}) async {
    try {
      if (checkProductTypeIsConfigurable() && sizeList.isEmpty) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: CommonTextPoppins(LanguageConstants.selectProductOption.tr)),
        );
        return;
      }
      isScreenLoading.value = true;

      if (product != null) {
        await cartGenerateAddRepository.addtoCart(product?.value ?? ProductItem(), sizeList);
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {
      isScreenLoading.value = false;
    }
    productIsInCart.value = true;
    if (isDialogShow) {
      return ProductDetailDialog.showAddToCartDialogBox(Get.context!, product?.value.name ?? '', productImage());
    } else {
      Get.toNamed(RoutesConstants.checkoutOrderScreen, arguments: cartController.cartModel.value);
    }
  }

  void showDialogBoxOpen(BuildContext context, bool fromSpecialSize) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          radius: 12,
          contentWidget: Form(
            // key: form,
            child: SizedBox(
              width: 300.w,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                // Container(
                //   width: double.maxFinite,
                //   height: 1,
                //   color: Colors.black,
                // ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      // contentPadding:
                      //     const EdgeInsets.only(bottom: 12, top: 12, left: 10),
                      hintText: LanguageConstants.specialSizeEnterEmailText.tr,
                      hintStyle: const TextStyle(color: Color(0xFF6B6B6B)),
                      labelStyle: const TextStyle(color: Color(0xFF6B6B6B)),
                      errorStyle: const TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: textFieldBoarderColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: textFieldBoarderColor,
                          width: 1.0,
                        ),
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: textFieldBoarderColor,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value == '') {
                        return LanguageConstants.enterEmailAddress.tr;
                      }
                      return '';
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                fromSpecialSize
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 15.6,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: textFieldBoarderColor, width: 1),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
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
                                      LanguageConstants.specialSizeSelectSizeText.tr,
                                    )
                                  : Text(
                                      "$slectSize",
                                      style: const TextStyle(color: Colors.black),
                                    ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 22,
                                color: Colors.black,
                              ),
                              iconEnabledColor: Colors.transparent,
                              onChanged: (value) {
                                slectSize.value = value.toString();
                              },
                            ),
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(height: 25.0),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: blackColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        )),
                    onPressed: fromSpecialSize
                        ? () async {
                            Get.back();
                            isScreenLoading.value = true;
                            await recommendedProductsAPIRepository.postSpecialSizeResponse(
                                email: emailController.text,
                                sku: product?.value.sku.toString() ?? '',
                                website: 'www.veralusso.com');
                            emailController.clear();
                            isScreenLoading.value = false;
                          }
                        : () async {
                            Get.back();
                            isScreenLoading.value = true;

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
                            isScreenLoading.value = false;
                          },
                    child: CommonTextPoppins(
                      LanguageConstants.specialSizeSubmitText.tr,
                      color: whiteColor,
                    )),

                const SizedBox(height: 10.0),
              ]),
            ),
          ),
        );
      },
    );
  }

  Future<String> createMyTicketForCancelItemOrder(bool isPurchased) async {
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
      debugPrint("$e");
      Validators.appCatchError(error: e);
    }
    return '';
  }

  String productImage() {
    for (var element in product?.value.customAttributes ?? []) {
      if (element.attributeCode == "image") {
        return "${AppConstants.productImageUrl}${element.value}";
      }
    }
    return "";
  }

  bool checkProductTypeIsConfigurable() {
    return product?.value.typeId.toString() == "configurable";
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
        isScreenLoading.value = true;

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
            product?.value.sku ?? '',
            localStore.userDetail.email ?? '',
          );
        }
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
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

  String getConvertRegularPrice() {
    return product?.value.extensionAttributes?.convertedRegularPrice ?? '';
  }
}
