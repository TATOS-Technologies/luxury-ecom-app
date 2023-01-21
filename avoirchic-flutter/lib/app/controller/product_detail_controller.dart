import 'dart:convert';
import 'dart:developer';

import 'package:avoirchic/app/controller/cart_controller.dart';
import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/core/consts/key_value_constants.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/data/local_data/local_store.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/screens/search/widget/product_detail_dialog.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/api_repository/generate_cart_repo.dart';
import 'package:meta_package/api/api_repository/my_orders_api_repository.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/api_repository/recommended_products_api_repository.dart';
import 'package:meta_package/api/api_repository/wishlist_api_repository.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/models/my_ticket/create_ticket_request.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/recommended_products/recommended_products_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:meta_package/constants/key_value_constants.dart';

import '../main/main.common.dart';

class ProductDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<ProductItem>? product = ProductItem().obs;
  RxBool isLoading = true.obs;
  RxBool isScreenLoading = false.obs;

  final CartController cartController = Get.find();

  RxString estimatedTime = "".obs;
  RxString selectSize = "".obs;
  PageController controllerPage = PageController(initialPage: 0);
  RxBool productIsInCart = false.obs;
  RxInt frameIndex = 0.obs;

  RxList<CountryListModel> getCountryListData = RxList<CountryListModel>();
  Rx<CountryListModel> selectedCountry = CountryListModel().obs;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController ticketEmailController = TextEditingController();
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

  RxList<SizeModel> chooseOption = <SizeModel>[].obs;
  RxList<SizeModel> listOfChoose = <SizeModel>[].obs;
  RxList<RecommendedProductModel> itemsData = RxList([]);

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

  ProductDetailController(this.cartGenerateAddRepository);

  @override
  void onInit() async {
    controller = TabController(vsync: this, length: myTabs.length);

    await localStore.getUserDetail();

    if (Get.parameters.containsKey("sku") &&
        (Get.parameters[kRouteParameterProductSkuKey]?.isNotEmpty ?? false)) {
      debugPrint(
          "product sku --> ${Get.parameters[kRouteParameterProductSkuKey]}");
      product?.value.sku = Get.parameters[kRouteParameterProductSkuKey];
    } else {
      product?.value = Get.arguments[0] is ProductItem
          ? Get.arguments[0] as ProductItem
          : ProductItem();
      debugPrint("product sku --> ${product?.value.sku}");
    }
    debugPrint("Product Id ---> ${product?.value.id}");
    debugPrint("Product Name ---> ${product?.value.name}");
    await getProductDetail();
    getChooseOption();
    getSizeListFromApi();

    super.onInit();
    getRecommendedProductDataFromApi();
    getEstimatedTime();
    getCountryList();
  }

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: LanguageConstants.recommendation.tr,
    ),
    Tab(
      text: LanguageConstants.recentlyViewed.tr,
    ),
  ];
  final emailController = TextEditingController().obs;
  late TabController controller;
  RxList<SizeModel> sizeList1 = <SizeModel>[].obs;

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  RxBool isSelected = false.obs;
  RxBool isSelected1 = false.obs;
  List<SizeModel> sizeListData = <SizeModel>[].obs;
  RxString sizeList = "".obs;
  RxBool iswishlist = false.obs;

  Future<void> getCountryList() async {
    try {
      List<CountryListModel>? countryList =
          await addressAPIRepository.getCountryListResponse();
      if (countryList?.isNotEmpty == true) {
        getCountryListData.value = countryList!;
        getCountryListData.removeWhere(
            (element) => (element.fullNameEnglish?.isEmpty ?? true));
      }
      debugPrint(
        "country list Get $getCountryListData",
      );
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<String> createMyTicketForCancelItemOrder(
    bool isPurchased,
  ) async {
    debugPrint("getStoreDataFromApi -> ");

    try {
      Map<String, dynamic> returnReasonListData = await myTicketAPIRepository
          .postCreateMyTickets(TicketForm(CreateTicketRequest(
                  name: firstNameController.text,
                  lastName: lastNameController.text,
                  email: ticketEmailController.text,
                  phone: phoneNumberController.text,
                  brand: (product?.value.getBrandName().isNotEmpty ?? false)
                      ? product?.value.getBrandName() ?? ''
                      : 'Test',
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
      debugPrint("Cancel createMyTicketForCancelItemOrder list Get");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
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
      debugPrint(
        "CONTROLLER DATA ==============$itemsData",
      );
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(
        "CONTROLLER DATA ==============$e",
      );
      isLoading(false);
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> getProductDetail() async {
    isLoading(true);
    try {
      ProductItem data = await recommendedProductsAPIRepository
          .getProductDetailApi(product?.value.sku.toString() ?? '');
      product?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading(false);
  }

  Future<void> getEstimatedTime() async {
    try {
      List<dynamic> response =
          await recommendedProductsAPIRepository.getEstimatedTime(
        (product?.value.id ?? '').toString(),
      );
      if (response[0].runtimeType == bool) {
        estimatedTime.value = response[1].toString();
      } else {
        estimatedTime.value = response[0].toString();
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> postNotifyMe(
    String productSkuId,
    String email, {
    int? productSize,
  }) async {
    debugPrint("productSkuId ==> $productSkuId");
    debugPrint("email ==> $email");
    debugPrint("productSize ==> $productSize");
    Map<String, Map<String, dynamic>> bodyData = {};
    if (productSize == null) {
      bodyData = {
        "notifymeForm": {
          "email": email,
          "product_sku": productSkuId,
        }
      };
    } else {
      bodyData = {
        "notifymeForm": {
          "email": email,
          "product_sku": productSkuId,
          "product_size": productSize
        }
      };
    }
    try {
      String data =
          await recommendedProductsAPIRepository.postNotifyMeReq(bodyData);
      debugPrint("this is revert data from notify me :- $data");
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: CommonTextPoppins(data),
        ),
      );
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> getSizeListFromApi() async {
    log("getSizeListFromApi Size List 00000");
    isLoading(true);
    try {
      Map<String, dynamic> sizeListData1 =
          await recommendedProductsAPIRepository
              .getSizeListApi((product?.value.id ?? '').toString());

      log("getSizeListFromApi Size List $sizeListData1");
      if (sizeListData1 != null) {
        if (sizeListData1[0]['status'] != "No Data") {
          debugPrint("Here INside Size");
          // sizeListData.addAll(sizeListData1); // todo uncomment on correct parsing
          debugPrint("Here INside Size111");
          isLoading(true);

          debugPrint("Size List Inside $sizeListData");
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("Here INside Size");
      debugPrint("CONTROLLER DATA 111==============$e");
      isLoading(false);
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> getChooseOption() async {
    isLoading(true);
    try {
      List<SizeModel> data =
          await recommendedProductsAPIRepository.getChooseInSizeList();
      if (data.isNotEmpty == true) {
        chooseOption.value = data;
      }

      for (var i in chooseOption) {
        if (product?.value.extensionAttributes?.configurableProductOptions
                ?.first.values?.isNotEmpty ==
            true) {
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
      listOfChoose.add(
        SizeModel(
          label: LanguageConstants.sizeMissingNotifiedItsBack.tr,
          value: 'Missing',
        ),
      );

      debugPrint(
        "Choose Option Selecte 3 List $listOfChoose",
      );
      isLoading(false);
      debugPrint(
        "Choose Option List 3$chooseOption",
      );
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      isLoading(false);
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> deleteWishListData(BuildContext context, String dataName,
      String customImage, String sku, String getId) async {
    try {
      bool data = await wishListAPIRepository.deleteWishList(
          getId, localStore.userDetail.email ?? '');
      iswishlist.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  //Add TO WishList Api Calling
  Future<void> postAddToWishlistData(BuildContext context, String dataName,
      String customImage, String sku) async {
    debugPrint("Here Customer Post");
    try {
      bool addToWishData = await wishListAPIRepository.addToWishList(
          sku, localStore.userDetail.email ?? '');

      debugPrint("Add To Cart Data $addToWishData");
      iswishlist.value = true;
      return showWishlistDialog(context, dataName, customImage);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> addToCart({bool isDialogShow = true}) async {
    try {
      if (checkProductTypeIsConfigurable() && sizeList.isEmpty) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
              content:
                  CommonTextPoppins(LanguageConstants.selectProductOption.tr)),
        );
        return;
      }
      isScreenLoading.value = true;
      if (product != null) {
        await cartGenerateAddRepository.addtoCart(
            product?.value ?? ProductItem(), sizeList1);
        if (isDialogShow) {
          return ProductDetailDialog.showDialogBox(
            Get.context!,
            product?.value.name ?? '',
            productImage(),
          );
        } else {
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
      isScreenLoading.value = false;
    }
  }

  //
  //Add To Cart Open Dialog3
  void showWishlistDialog(
    BuildContext context,
    String name,
    String image,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          contentPadding: const EdgeInsets.all(
            14.0,
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          backgroundColor: const Color(
            0xffedf8fe,
          ),
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
                LanguageConstants.youaddCartText.tr,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "$name",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                LanguageConstants.youaddCartEndText.tr,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(
                        14,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(
                            0xFFbcbcbc,
                          ),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "${AppConstants.productImageUrl}$image",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 180,
                                height: 30,
                                alignment: Alignment.center,
                                // padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: const Color(
                                    0xFF367587,
                                  ),
                                ),
                                child: Text(
                                  LanguageConstants.continueShoppingText.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            InkWell(
                              child: Container(
                                width: 180,
                                height: 30,
                                alignment: Alignment.center,
                                // padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    0,
                                  ),
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: const Color(
                                      0xFF357486,
                                    ),
                                  ),
                                ),

                                child: Text(
                                  LanguageConstants.viewWishListText.tr,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xFF377687),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onTap: () {
                                debugPrint("click");
                                Get.toNamed(
                                  RoutesConstants.wishlistScreen,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
            ],
          ),
        );
      },
    );
  }

  Future showDialogBoxOpen(
    BuildContext context,
    bool fromSpecialSize,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => CommonAlertDialog(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 0.0,
            ),
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            contentWidget: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 3.3,
              child: Form(
                // key: formKey.value,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 10.0,
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
                        style: const TextStyle(
                          color: Color(0xFF367587),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.close,
                            size: 22,
                            color: Color(
                              0xFF367587,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: const Color(
                      0xFF367587,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: TextFormField(
                      controller: emailController.value,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(
                          bottom: 12,
                          top: 12,
                          left: 10,
                        ),
                        hintText:
                            LanguageConstants.specialSizeEnterEmailText.tr,
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
                        errorStyle: const TextStyle(color: Colors.red),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            0.0,
                          ),
                          borderSide: const BorderSide(
                            color: Color(
                              0xFF367587,
                            ),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            0.0,
                          ),
                          borderSide: const BorderSide(
                            color: Color(
                              0xFF367587,
                            ),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF367587),
                          ),
                          borderRadius: BorderRadius.circular(
                            0.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return "Enter Email";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  fromSpecialSize
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 15.6,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(
                                0.0,
                              ),
                              border: Border.all(
                                  color: const Color(
                                    0xFF367587,
                                  ),
                                  width: 1),
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
                                hint: selectSize.toString() == ""
                                    ? Text(
                                        LanguageConstants
                                            .specialSizeSelectSizeText.tr,
                                        style: const TextStyle(
                                          color: Color(
                                            0xFF6B6B6B,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        "$selectSize",
                                        style: const TextStyle(
                                          color: Color(
                                            0xFF6B6B6B,
                                          ),
                                        ),
                                      ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 22,
                                  color: Color(
                                    0xff000080,
                                  ),
                                ),
                                iconEnabledColor: Colors.transparent,
                                onChanged: (value) {
                                  selectSize.value = value.toString();
                                },
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 25.0),
                  InkWell(
                    onTap: fromSpecialSize
                        ? () {
                            recommendedProductsAPIRepository
                                .postSpecialSizeResponse(
                                    email: emailController.value.text,
                                    sku: product?.value.sku.toString() ?? '',
                                    website: 'www.avoir-chic.com');
                            Navigator.pop(context);
                          }
                        : () {
                            if (product?.value.typeId == 'configurable') {
                              postNotifyMe(product?.value.sku ?? '',
                                  emailController.value.text,
                                  productSize: (sizeList1.first.value ?? '') !=
                                          "Missing"
                                      ? int.parse(sizeList1.first.label ?? '0')
                                      : 0);
                            } else {
                              postNotifyMe(product?.value.sku ?? '',
                                  emailController.value.text);
                            }
                            Navigator.pop(context);
                            emailController.value.clear();
                          },
                    child: Text(
                      LanguageConstants.specialSizeSubmitText.tr,
                      style: const TextStyle(
                        color: Color(0xFF367587),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        );
      },
    );
  }

  bool productIsInStock() {
    return product?.value.extensionAttributes != null
        ? (product?.value.extensionAttributes?.stockItem?.isInStock ?? false)
        : false;
  }

  String getConvertRegularPriceFromConfigurableProduct() {
    return product?.value.extensionAttributes?.convertedRegularPrice ?? '';
  }

  Future<void> recommendationProductOnTap(int index) async {
    product?.value = ProductItem(
      id: int.parse(
        itemsData[index].productId ?? '0',
      ),
      sku: itemsData[index].sku,
    );
    await getProductDetail();
  }

  bool checkItemDataImageUrlIsEmpty() {
    return itemsData.first.imageUrl != null;
  }

  Future<void> notifyWhenAvailableOnTap(BuildContext context) async {
    await localStore.getUserDetail();
    debugPrint(localStore.userDetail.email);
    debugPrint('$sizeList');
    if (sizeList1.isNotEmpty) {
      if (localStore.customerToken == "" &&
          localStore.userDetail.email == null) {
        await Future.delayed(const Duration(seconds: 1))
            .whenComplete(() => showDialogBoxOpen(context, false));
      } else {
        if (product?.value.typeId == 'configurable') {
          postNotifyMe(
            product?.value.sku ?? '',
            localStore.userDetail.email!,
            productSize: (sizeList1.first.value ?? '') != "Missing"
                ? int.parse(sizeList1.first.label ?? '0')
                : 0,
          );
        } else {
          postNotifyMe(product?.value.sku ?? '', localStore.userDetail.email!);
        }
      }
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: CommonTextPoppins("Please choose an option"),
        ),
      );
    }
  }

  Future<void> wishlistOnTap(BuildContext context) async {
    if (localStore.customerToken.toString() != "") {
      if (iswishlist.value) {
        deleteWishListData(
          context,
          product?.value.name ?? '',
          "${product?.value.customAttributes![1].value}",
          product?.value.sku ?? '',
          (product?.value.id ?? '').toString(),
        );
      } else {
        postAddToWishlistData(
          context,
          product?.value.name ?? '',
          "${product?.value.customAttributes![1].value}",
          product?.value.sku ?? '',
        );
      }
    } else {
      await addWishListDataToLocal();
    }
  }

  Future<void> addWishListDataToLocal() async {
    WishListProductModel mainDataObj = WishListProductModel();
    mainDataObj = await localStore.getWishListData();

    log("${mainDataObj.items?.length ?? 0}", name: "wishListData mainDataObj");

    ItemProduct itemProduct = ItemProduct();
    WishlistItem objProduct = WishlistItem();
    ExtensionAttributesProduct extensionAttributes =
        ExtensionAttributesProduct();
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

    stockItems =
        convertStockItem(product?.value.extensionAttributes?.stockItem);

    extensionAttributes.configurableProductOptions = getConfigurableProduct(
      product?.value.extensionAttributes?.configurableProductOptions,
    );

    extensionAttributes.convertedRegularOldPrice =
        product?.value.extensionAttributes?.convertedRegularOldPrice;
    extensionAttributes.convertedRegularPrice =
        product?.value.extensionAttributes?.convertedRegularPrice;

    extensionAttributes.stockItem = stockItems;
    objProduct.extensionAttributes = extensionAttributes;
    itemProduct.id = product?.value.id;
    itemProduct.product = objProduct;

    lstItemProduct.add(itemProduct);

    mainDataObj.itemsCount =
        mainDataObj.items == null ? 1 : (mainDataObj.items?.length ?? 0) + 1;
    mainDataObj.items = lstItemProduct;

    await LocalStore.setPrefStringValue(
      kStorageConstWishListData,
      jsonEncode(mainDataObj),
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
    List<ConfigurableProductOption>? configurableProductOptions,
  ) {
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

  bool checkProductTypeIsConfigurable() {
    return product?.value.typeId.toString() == "configurable";
  }

  Future<void> buyNowOnTap() async {
    if (productIsInCart.value) {
      Get.toNamed(RoutesConstants.checkoutOrderScreen,
          arguments: cartController.cartModel.value);
    } else {
      await addToCart(isDialogShow: false);
    }
  }
}
