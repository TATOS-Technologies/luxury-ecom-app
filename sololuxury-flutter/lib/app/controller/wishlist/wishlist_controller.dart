// ignore_for_file: inference_failure_on_function_invocation

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/cart/add_to_cart_modal.dart';
import 'package:meta_package/api/models/product/product_model.dart'
    as product_model;
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';

class WishlistController extends GetxController {
  RxInt index = 0.obs;
  RxBool isScreenLoading = false.obs;

  RxString chosenValue = LanguageConstants.myWishlistText.tr.obs;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  final WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  WishlistController();

  Rx<WishListProductModel>? wishItemModel = WishListProductModel().obs;
  RxBool isLoading = true.obs;
  MyAccountDetails userDetail = MyAccountDetails();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<SizeModel> sizeList = [];

  @override
  void onInit() async {
    super.onInit();

    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    await getSizeApiRes();

    if (localStore.customerToken.isNotEmpty) {
      getWishlistProducts();
    } else {
      getLocalWishListData();
    }
  }

  Future<void> getSizeApiRes() async {
    isLoading.value = true;
    try {
      List<SizeModel> data =
          await recommendedProductsAPIRepository.getChooseInSizeList();
      sizeList = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  void clickChatEvent({String? name, String? email}) {
    Livechat.beginChat(
        AppConstants.licenceId,
        '1',
        name ?? userDetail.firstname.toString().trim(),
        email ?? userDetail.email.toString().trim(), {});
  }

  Future<void> getWishlistProducts() async {
    isLoading.value = true;
    try {
      WishListProductModel data = await wishListAPIRepository
          .getWishListApiResponse(localStore.customerToken);
      wishItemModel?.value = data;
      wishItemModel?.value.items?.forEach((element) {
        List<SizeModel> selectedSize = [];
        if (element.product?.extensionAttributes?.configurableProductOptions
                ?.isNotEmpty ??
            false) {
          element.product?.extensionAttributes?.configurableProductOptions
              ?.first.values
              ?.forEach((element2) {
            final SizeModel sizeModel = sizeList.firstWhere((element3) =>
                element2.valueIndex.toString() == element3.value.toString());
            selectedSize.add(sizeModel);
          });

          element.product?.sizeList = selectedSize;
        }
      });
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getLocalWishListData() async {
    wishItemModel?.value = await localStore.getWishListData();
    wishItemModel?.value.items?.forEach((element) {
      List<SizeModel> selectedSize = [];
      if (element.product?.extensionAttributes?.configurableProductOptions
              ?.isNotEmpty ??
          false) {
        element.product?.extensionAttributes?.configurableProductOptions?.first
            .values
            ?.forEach((element2) {
          final SizeModel sizeModel = sizeList.firstWhere((element3) =>
              element2.valueIndex.toString() == element3.value.toString());
          selectedSize.add(sizeModel);
        });

        element.product?.sizeList = selectedSize;
      }
    });
    isLoading.value = false;
  }

  Future<void> getGenerateCart(int index) async {
    try {
      isScreenLoading.value = true;

      if (localStore.customerToken.toString() != "") {
        String data =
            await recommendedProductsAPIRepository.getGenerateCartApiResponse();
        debugPrint(
            "Data === ${wishItemModel?.value.items?[index].product?.countController?.text}");
        await postAddToCartData(
          wishItemModel?.value.items?[index].product?.name ?? '',
          productImage(index),
          wishItemModel?.value.items?[index].product?.sku ?? '',
          "1",
          data.toString(),
          wishItemModel?.value.items?[index].product?.countController?.text
                  .trim() ??
              "1",
          wishItemModel?.value.items?[index].product?.typeId ?? '',
          optionId: getAttributeId(index),
          optionValue: getSelectedSizeValue(index),
        );
        debugPrint('test data if');
      } else {
        debugPrint("Guest");
        localStore.getGuestToken();

        if (localStore.guestToken.isNotEmpty) {
          await postAddToCartData(
            wishItemModel?.value.items?[index].product?.name ?? '',
            productImage(index),
            wishItemModel?.value.items?[index].product?.sku ?? '',
            "2",
            localStore.guestToken,
            wishItemModel?.value.items?[index].product?.countController?.text
                    .trim() ??
                "1",
            wishItemModel?.value.items?[index].product?.typeId ?? '',
            optionId: getAttributeId(index),
            optionValue: getSelectedSizeValue(index),
          );
        } else {
          String data = await recommendedProductsAPIRepository
              .getGenerateCartApiResponse();
          await LocalStore.setPrefStringValue(
            kStorageConstGuestauthToken,
            (data).replaceAll('"', ''),
          );
          await postAddToCartData(
            wishItemModel?.value.items?[index].product?.name ?? '',
            productImage(index),
            wishItemModel?.value.items?[index].product?.sku ?? '',
            "2",
            data.toString(),
            wishItemModel?.value.items?[index].product?.countController?.text
                    .trim() ??
                "1",
            wishItemModel?.value.items?[index].product?.typeId ?? '',
            optionId: getAttributeId(index),
            optionValue: getSelectedSizeValue(index),
          );
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }

  Future<void> postAddToCartData(
      String dataName,
      String customImage,
      String sku,
      String getValue,
      String getToken,
      String? productQty,
      String productType,
      {String? optionId,
      String? optionValue}) async {
    late Map<String, dynamic> passedAddToCart;
    if (productType == "configurable") {
      passedAddToCart = {
        "cartItem": {
          "sku": sku,
          "qty": productQty,
          "product_type": "configurable",
          "quote_id": getToken,
          "product_option": {
            "extension_attributes": {
              "configurable_item_options": [
                {"option_id": optionId ?? '', "option_value": optionValue}
              ]
            }
          }
        }
      };
    } else {
      passedAddToCart = {
        "cartItem": {"sku": sku, "qty": productQty, "quote_id": getToken}
      };
    }
    try {
      AddToCartModal addToCartData;
      if (getValue == "1") {
        debugPrint("Here Customer Post");
        addToCartData =
            await recommendedProductsAPIRepository.postAddTOCartProductResponse(
          passedAddToCart,
        );
      } else {
        debugPrint("Here Guest Post");
        addToCartData = await recommendedProductsAPIRepository
            .guestPostAddTOCartProductResponse(passedAddToCart);
      }
      debugPrint("Add To Cart Data $addToCartData");
      return showAddDialog(Get.context!, dataName, customImage);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> deleteWishListData(int index) async {
    try {
      isScreenLoading.value = true;

      if (localStore.customerToken.isNotEmpty) {
        // todo need to verify return data type
        await wishListAPIRepository.deleteWishList(
            (wishItemModel?.value.items?[index].id ?? 0).toString(),
            localStore.userDetail.email ?? '');
        wishItemModel?.value.items?.removeAt(index);
      } else {
        WishListProductModel wishItemList = WishListProductModel();
        wishItemList = await localStore.getWishListData();

        for (int i = 0; i < (wishItemList.items?.length ?? 0); i++) {
          if (wishItemList.items![i].id.toString() ==
              wishItemModel?.value.items?[index].id.toString()) {
            wishItemModel?.value.items?.removeAt(index);
            wishItemList.items?.removeAt(i);
          }
        }
        await LocalStore.setPrefStringValue(
            kStorageConstWishListData, jsonEncode(wishItemList));
      }
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }

  void showAddDialog(
      BuildContext context, String dataName, String customImage) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 12,
          contentPadding: const EdgeInsets.all(14.0),
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
                "${LanguageConstants.youaddCartText.tr} $dataName ${LanguageConstants.youaddCartEndText.tr}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: appColor),
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
                        border: Border.all(color: appColor),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(customImage),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: appColor),
                                  child: Text(
                                    LanguageConstants.viewCartText.tr,
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                onTap: () {
                                  debugPrint("click");
                                  Get.toNamed<dynamic>(
                                      RoutesConstants.cartScreen);
                                  // Get.to<dynamic>(
                                  //   () => const CartScreen(),
                                  // );
                                },
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offAllNamed(
                                      RoutesConstants.dashboardScreen);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: appColor),
                                  child: Text(
                                    LanguageConstants.continueShoppingText.tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
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

  Future<void> wishListOnTap(ItemProduct? item) async {
    product_model.ProductItem itemProduct = product_model.ProductItem();
    WishlistItem data = WishlistItem();
    data = item?.product ?? WishlistItem();

    itemProduct.id = item?.product?.id;
    itemProduct.sku = data.sku;
    itemProduct.name = data.name;
    itemProduct.attributeSetId = data.attributeSetId;
    itemProduct.price = data.price;
    itemProduct.status = data.status;
    itemProduct.visibility = data.visibility;
    itemProduct.typeId = data.typeId;
    itemProduct.createdAt = data.createdAt;
    itemProduct.updatedAt = data.updatedAt;
    itemProduct.productLinks = data.productLinks;
    itemProduct.tierPrices = data.tierPrices;
    itemProduct.mediaGalleryEntries = data.mediaGalleryEntries;

    itemProduct.customAttributes = [];
    for (var element in data.customAttributes!) {
      product_model.CustomAttributes customAttribute =
          product_model.CustomAttributes();
      customAttribute.value = element.value.toString();
      customAttribute.attributeCode = element.attributeCode;
      itemProduct.customAttributes?.add(customAttribute);
    }

    Get.toNamed<dynamic>(RoutesConstants.productDetailsScreen,
        arguments: [itemProduct, "brand"]);
  }

  bool isWishListEmptyOrNot() {
    return (wishItemModel?.value.items == null ||
        (wishItemModel?.value.items?.isEmpty ?? false));
  }

  String productImage(int index) {
    for (var element
        in wishItemModel?.value.items?[index].product?.customAttributes ?? []) {
      if (element.attributeCode == "image") {
        return "${AppConstants.productImageUrl}${element.value}";
      }
    }
    return "";
  }

  String getProductPrice(int index) {
    return wishItemModel?.value.items?[index].product?.extensionAttributes
            ?.convertedRegularPrice ??
        '';
  }

  String getAttributeId(int index) {
    return (wishItemModel?.value.items?[index].product?.extensionAttributes
                ?.configurableProductOptions?.isNotEmpty ??
            false)
        ? (wishItemModel?.value.items?[index].product?.extensionAttributes
                ?.configurableProductOptions?.first.attributeId ??
            "0")
        : "0";
  }

  String getSelectedSizeValue(int index) {
    return (wishItemModel
                ?.value.items?[index].product?.selectSizeValue?.value !=
            null)
        ? (wishItemModel
                ?.value.items?[index].product?.selectSizeValue?.value.value ??
            "0")
        : "0";
  }
}
