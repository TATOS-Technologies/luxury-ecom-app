import 'dart:convert';
import 'dart:developer';

import 'package:brandslabels/app/controller/cart_controller.dart';
import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/data/local_data/local_store.dart';
import 'package:brandslabels/app/helper/deep_linking_service.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:meta_package/utils/validator.dart';

class ProductDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<ProductItem>? product = ProductItem().obs;
  RxBool isLoading = true.obs;
  RxBool isScreenLoading = false.obs;
  RxBool productIsInCart = false.obs;
  final CartController cartController = Get.find();

  RxInt frameIndex = 0.obs;
  PageController controllerPage = PageController(initialPage: 0);

  RxList<CountryListModel> getCountryListData = RxList<CountryListModel>();
  Rx<CountryListModel> selectedCountry = CountryListModel().obs;

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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  MyOrdersAPIRepository myOrdersAPIRepository =
      MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  AddressAPIRepository addressAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final CartGenerateAddRepository cartGenerateAddRepository;
  final MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));

  ProductDetailController({required this.cartGenerateAddRepository});

  @override
  void onInit() {
    // argument 0 => product details
    // TODO find correct argument
    // argument 1 =? brand / dash (not sure needs confirmation)

    if (Get.parameters.containsKey("sku") &&
        (Get.parameters[kRouteParameterProductSkuKey]?.isNotEmpty ?? false)) {
      product?.value.sku = Get.parameters[kRouteParameterProductSkuKey];
      getProductDetail();
    } else {
      product?.value = Get.arguments[0] is ProductItem
          ? Get.arguments[0] as ProductItem
          : ProductItem();
    }
    debugPrint("product sku --> ${product?.value.sku}");

    // if ((Get.arguments as List).length > 1) {
    //   argumentBrandOrDash = Get.arguments[1];
    // }
    super.onInit();
    getChooseOption();
    getSizeListFromApi();
    getCountryList();
    getRecommendedProductDataFromApi();
    debugPrint("ProductId ---> ${product?.value.id}");
    getEstimatedTime();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  final List<Tab> myTabs = <Tab>[
    Tab(text: LanguageConstants.recommendation.tr),
    Tab(text: LanguageConstants.recentlyViewed.tr),
  ];
  TextEditingController emailController = TextEditingController();

  late TabController controller;

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  RxString selectSize = "".obs;

  RxBool isSelected = false.obs;
  RxBool isSelected1 = false.obs;
  List<SizeModel> sizeListData = <SizeModel>[].obs;
  RxString estimatedTime = "".obs;

  RxList<RecommendedProductModel> itemsData = RxList([]);

  RxBool visibleLoader = false.obs;
  RxList<SizeModel> chooseOption = <SizeModel>[].obs;
  RxList<SizeModel> listOfChoose = <SizeModel>[].obs;
  RxList<SizeModel> sizeList = <SizeModel>[].obs;
  RxList<RecommendedProductModel> recommendationList =
      <RecommendedProductModel>[].obs;
  RxBool dropdownValidator = false.obs;
  RxBool dialogLoader = false.obs;

  Future<void> getCountryList() async {
    debugPrint("getStoreDataFromApi -> ");
    List<CountryListModel>? countryList =
        await addressAPIRepository.getCountryListResponse();
    if (countryList?.isNotEmpty == true) {
      getCountryListData.value = countryList!;
    }
    debugPrint("country list Get $getCountryListData");
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
                  brand: product?.value.getBrandName(),
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
          "getStoreDataFromApi createMyTicketForCancelItemOrder -> $returnReasonListData");
      debugPrint("Cancel createMyTicketForCancelItemOrder list Get");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
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
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> notifyWhenProductIsOutOfScope() async {
    isScreenLoading.value = true;
    await localStore.getUserDetail();
    isScreenLoading.value = false;

    debugPrint(localStore.userDetail.email);
    if (sizeList.isNotEmpty) {
      if (localStore.customerToken == "" &&
          localStore.userDetail.email == null) {
        showDialogBoxOpen(Get.context!, false);
      } else {
        if (product?.value.typeId == 'configurable') {
          postNotifyMe(
              product?.value.sku ?? '', localStore.userDetail.email ?? '',
              productSize: (sizeList.first.value ?? '') != "Missing"
                  ? int.parse(sizeList.first.label ?? '0')
                  : 0);
        } else {
          postNotifyMe(
              product?.value.sku ?? '', localStore.userDetail.email ?? '');
        }
      }
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(content: CommonTextPoppins("Please choose an option")),
      );
    }
  }

  Future<void> onItemTap(int index) async {
    product?.value = ProductItem(
      id: int.parse(
        itemsData[index].productId ?? '0',
      ),
      sku: itemsData[index].sku,
    );
    await getProductDetail();
  }

  Future<void> postNotifyMe(String productSkuId, String email,
      {int? productSize}) async {
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
      if (data.isNotEmpty == true) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CommonTextPoppins(data),
          ),
        );
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> getProductDetail() async {
    try {
      isLoading(true);
      ProductItem? data = await recommendedProductsAPIRepository
          .getProductDetailApi(product?.value.sku.toString() ?? '');
      if (data != null) {
        product?.value = data;
      }
      isLoading(false);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> getEstimatedTime() async {
    try {
      List<dynamic> response =
          await recommendedProductsAPIRepository.getEstimatedTime(
        product?.value.id.toString() ?? '',
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
    } finally {}
  }

  Future<void> getSizeListFromApi() async {
    isLoading(true);
    try {
      Map<String, dynamic> sizeListData1 =
          await recommendedProductsAPIRepository
              .getSizeListApi((product?.value.id ?? '').toString());
      debugPrint("Size List $sizeListData");
      if (sizeListData1[0].label != "No Data") {
        debugPrint("Here INside Size");
        // sizeListData.addAll(sizeListData1); // todo uncomment on correct parsing
        debugPrint("Here INside Size111");
        isLoading(true);

        debugPrint("Size List Inside $sizeListData");
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getChooseOption() async {
    isLoading(true);
    try {
      List<SizeModel> data =
          await recommendedProductsAPIRepository.getChooseInSizeList();
      chooseOption.value = data;

      if (product?.value.extensionAttributes?.configurableProductOptions
              ?.isNotEmpty ??
          false) {
        product?.value.extensionAttributes?.configurableProductOptions?.first
            .values
            ?.forEach((element) {
          final SizeModel sizeModel = chooseOption.firstWhere((element2) =>
              element.valueIndex.toString() == element2.value.toString());
          listOfChoose.add(sizeModel);
        });
      }
      listOfChoose.add(SizeModel(
        label: 'Size missing? Be notified when it is back in',
        value: 'Missing',
      ));

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
            product?.value ?? ProductItem(), sizeList);
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStace) {
      log(e.toString(), name: "Error");
      log(stackStace.toString(), name: "stackStace");
    } finally {
      isScreenLoading.value = false;
    }
    productIsInCart.value = true;
    if (isDialogShow) {
      return showDialogBox(
        Get.context!,
        product?.value.name ?? '',
        productImage(),
      );
    } else {
      Get.toNamed(RoutesConstants.checkoutOrderScreen,
          arguments: cartController.cartModel.value);
    }
  }

  //Add TO WishList Api Calling
  Future<void> postAddToWishlistData() async {
    try {
      isScreenLoading.value = true;
      try {
        var link = await DynamicLinkingService.buildProductPageDynamicLink(
            product?.value.sku ?? '');
        debugPrint("asdfjasfj link : $link");
      } catch (e) {
        debugPrint("exception on gen dynamic link $e");
        ExceptionHandler.appCatchError(error: e);
      }
      if (localStore.customerToken.isNotEmpty) {
        bool addToWishData = await wishListAPIRepository.addToWishList(
            product?.value.sku ?? '', localStore.userDetail.email ?? '');
        iswishlist.value = addToWishData;
        if (iswishlist.value) {
          return showWishlistDialog(
              Get.context!, product?.value.name ?? '', productImage());
        }
      } else {
        WishListProductModel mainDataObj = WishListProductModel();
        mainDataObj = await localStore.getWishListData();

        ItemProduct itemProduct = ItemProduct();
        WishlistItem objProduct = WishlistItem();
        ExtensionAttributesProduct extensionAttributes =
            ExtensionAttributesProduct();
        StockItem stockItems = StockItem();
        List<ItemProduct>? lstItemProduct = mainDataObj.items ?? [];
        if (product != null) {
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
          for (CustomAttributes element
              in product?.value.customAttributes ?? []) {
            CustomAttributes customAttribute = CustomAttributes();
            customAttribute.value = element.value.toString();
            customAttribute.attributeCode = element.attributeCode;
            objProduct.customAttributes?.add(customAttribute);
          }

          stockItems =
              convertStockItem(product?.value.extensionAttributes?.stockItem);

          extensionAttributes.configurableProductOptions =
              getConfigurableProduct(product!
                  .value.extensionAttributes?.configurableProductOptions);

          extensionAttributes.convertedRegularOldPrice =
              product?.value.extensionAttributes?.convertedRegularOldPrice;
          extensionAttributes.convertedRegularPrice =
              product?.value.extensionAttributes?.convertedRegularPrice;

          extensionAttributes.stockItem = stockItems;
          objProduct.extensionAttributes = extensionAttributes;
          itemProduct.id = product?.value.id;
          itemProduct.product = objProduct;

          lstItemProduct.add(itemProduct);

          mainDataObj.itemsCount = mainDataObj.items == null
              ? 1
              : (mainDataObj.items?.length ?? 0) + 1;
          mainDataObj.items = lstItemProduct;
          iswishlist.value = true;
          await LocalStore.setPrefStringValue(
            kStorageConstWishListData,
            jsonEncode(mainDataObj),
          );
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
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

  void showDialogBox(BuildContext context, String name, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          contentPadding: const EdgeInsets.all(14.0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          contentWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 14.0),
              Text(
                "$name  ${LanguageConstants.addedYourCart.tr}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: AppConstants.fontPoppins,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(image),
                      ),
                    ),
                  )),
                  const SizedBox(width: 10.0),
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(RoutesConstants.cartScreen);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: darkBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.viewCartText.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: darkBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.continueShopping.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 14.0),
            ],
          ),
        );
      },
    );
  }

  RxBool iswishlist = false.obs;

  //Add To Wish List
  void showWishlistDialog(BuildContext context, String name, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          contentPadding: const EdgeInsets.all(14.0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              RichText(
                textAlign: TextAlign.center,
                // textScaleFactor: 1.1,
                text: TextSpan(
                    text: LanguageConstants.youaddCartText.tr,
                    style: const TextStyle(
                        fontFamily: AppConstants.fontPoppins,
                        color: Colors.black,
                        fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                          text: name,
                          style: const TextStyle(
                              fontFamily: AppConstants.fontPoppins,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                      TextSpan(
                          text: LanguageConstants.toShoopingCartText.tr,
                          style: const TextStyle(
                              fontFamily: AppConstants.fontPoppins,
                              color: Colors.black,
                              fontSize: 15)),
                    ]),
              ),
              const SizedBox(height: 4.0),
              RichText(
                textAlign: TextAlign.center,
                // textScaleFactor: 1.0,
                text: TextSpan(
                    text: LanguageConstants.totalText.tr,
                    style: const TextStyle(
                        fontFamily: AppConstants.fontPoppins,
                        color: Colors.black,
                        fontSize: 15),
                    children: <TextSpan>[
                      const TextSpan(
                          text: ' 4 ',
                          style: TextStyle(
                              fontFamily: AppConstants.fontPoppins,
                              color: Colors.black,
                              fontSize: 15)),
                      TextSpan(
                          text: LanguageConstants.itemCartText.tr,
                          style: const TextStyle(
                              fontFamily: AppConstants.fontPoppins,
                              color: Colors.black,
                              fontSize: 15)),
                    ]),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(image),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: darkBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.continueShopping.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(RoutesConstants.wishlistScreen);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: darkBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.gotoWishListText.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 14.0),
            ],
          ),
        );
      },
    );
  }

  //Add To WMissing Size
  //getShow Dialog
  void showDialogBoxOpen(BuildContext context, bool fromSpecialSize) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Obx(() => CommonAlertDialog(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                contentWidget: SizedBox(
                  width: double.maxFinite,
                  child: Form(
                    // key: formKey.value,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      const SizedBox(
                        height: 4.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text(
                              fromSpecialSize
                                  ? LanguageConstants.specialSizeText.tr
                                  : LanguageConstants.notifyMe.tr,
                              style: const TextStyle(
                                  fontFamily: AppConstants.fontPoppins,
                                  color: Color(0xff000080),
                                  fontWeight: FontWeight.w600)),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.close,
                                size: 22,
                                color: borderGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: borderGrey,
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  bottom: 12, top: 12, left: 10),
                              hintText: LanguageConstants.enterEmail.tr,
                              labelStyle: const TextStyle(
                                  fontFamily: AppConstants.fontPoppins,
                                  color: Colors.black54),
                              errorStyle: const TextStyle(
                                  fontFamily: AppConstants.fontPoppins,
                                  color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: borderGrey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: borderGrey,
                                  width: 1.0,
                                ),
                              ),
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: borderGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(12))),
                          validator: (value) => Validators.validateEmail(
                              emailController.text.trim()),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      fromSpecialSize
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 15.6,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: borderGrey, width: 1),
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
                                                fontFamily:
                                                    AppConstants.fontPoppins,
                                                color: Color(0xFF6B6B6B)),
                                          )
                                        : Text(
                                            "$selectSize",
                                            style: const TextStyle(
                                                fontFamily:
                                                    AppConstants.fontPoppins,
                                                color: Color(0xFF6B6B6B)),
                                          ),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 22,
                                      color: Color(0xff000080),
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
                      const SizedBox(height: 20.0),
                      CommonThemeButton(
                        onTap: fromSpecialSize
                            ? () async {
                                try {
                                  await recommendedProductsAPIRepository
                                      .postSpecialSizeResponse(
                                          email: emailController.value.text,
                                          sku: product?.value.sku.toString() ??
                                              '',
                                          website: 'www.brands-labels.com');
                                  Navigator.pop(context);
                                } on ApiException catch (e) {
                                  ExceptionHandler.apiExceptionError(e: e);
                                } catch (e) {
                                  debugPrint(e.toString());
                                  ExceptionHandler.appCatchError(error: e);
                                } finally {}
                              }
                            : () {
                                if (product?.value.typeId == 'configurable') {
                                  postNotifyMe(product?.value.sku ?? '',
                                      emailController.value.text,
                                      productSize:
                                          (sizeList.first.label ?? '') !=
                                                  "Missing"
                                              ? int.parse(
                                                  sizeList.first.label ?? '0')
                                              : 0);
                                } else {
                                  postNotifyMe(product?.value.sku ?? '',
                                      emailController.value.text);
                                }
                                Navigator.pop(context);
                                emailController.clear();
                              },
                        title: LanguageConstants.submitText.tr,
                      )
                    ]),
                  ),
                ),
              ));
        });
  }

  String productImage() {
    for (var element in product?.value.customAttributes ?? []) {
      if (element.attributeCode == "image") {
        return "${AppConstants.productImageUrl}${element.value}";
      }
    }
    return "";
  }

  bool productIsInStock() {
    return product?.value.extensionAttributes != null
        ? (product?.value.extensionAttributes?.stockItem?.isInStock ?? false)
        : false;
  }

  String getConvertRegularPriceFromConfigurableProduct() {
    return product?.value.extensionAttributes?.convertedRegularPrice ?? '';
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
