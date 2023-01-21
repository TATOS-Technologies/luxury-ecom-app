import 'dart:convert';
import 'dart:developer';

import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/data/local_data/local_store.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/recommended_products_api_repository.dart';
import 'package:meta_package/api/api_repository/wishlist_api_repository.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';

class WishlistController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isScreenLoading = false.obs;

  RxString chosenValue = LanguageConstants.myWishlistText.tr.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  WishlistController();

  Rx<WishListProductModel>? wishItemModel = WishListProductModel().obs;
  List<SizeModel> sizeList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    await getSizeApiRes();
    if (localStore.customerToken.isNotEmpty) {
      getWishlistProducts();
    } else {
      getLocalWishListData();
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

  Future<void> getSizeApiRes() async {
    try {
      List<SizeModel> data =
          await recommendedProductsAPIRepository.getChooseInSizeList();
      sizeList = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> getWishlistProducts() async {
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
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getGenerateCart(int index) async {
    log(localStore.customerToken, name: "User Token");
    try {
      isScreenLoading.value = true;
      if (localStore.customerToken.isNotEmpty) {
        String data =
            await recommendedProductsAPIRepository.getGenerateCartApiResponse();
        if (data.isNotEmpty == true) {
          await postAddToCartData(
            wishItemModel?.value.items?[index].product?.name ?? '',
            productImage(index),
            wishItemModel?.value.items?[index].product?.sku ?? '',
            "1",
            data,
            wishItemModel?.value.items?[index].product?.countController?.text
                    .trim() ??
                "1",
            wishItemModel?.value.items?[index].product?.typeId ?? '',
            optionId: getAttributeId(index),
            optionValue: getSelectedSizeValue(index),
          );
        }
      } else {
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
          if (data.isNotEmpty) {
            await LocalStore.setPrefStringValue(
              kStorageConstGuestauthToken,
              (data).replaceAll('"', ''),
            );
            await postAddToCartData(
              wishItemModel?.value.items?[index].product?.name ?? '',
              productImage(index),
              wishItemModel?.value.items?[index].product?.sku ?? '',
              "2",
              data,
              wishItemModel?.value.items?[index].product?.countController?.text
                      .trim() ??
                  "1",
              wishItemModel?.value.items?[index].product?.typeId ?? '',
              optionId: getAttributeId(index),
              optionValue: getSelectedSizeValue(index),
            );
          }
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
    try {
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

      log(passedAddToCart.toString(), name: "passedAddToCart Json");
      log(getValue, name: "getValue");
      if (getValue == "1") {
        await recommendedProductsAPIRepository
            .postAddTOCartProductResponse(passedAddToCart);
      } else {
        await recommendedProductsAPIRepository
            .guestPostAddTOCartProductResponse(passedAddToCart);
      }
      return showAddToCartDialog(Get.context!, dataName, customImage);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteWishListData(int index) async {
    try {
      isScreenLoading.value = true;

      if (localStore.customerToken.isNotEmpty) {
        bool data = await wishListAPIRepository.deleteWishList(
            (wishItemModel?.value.items?[index].id ?? 0).toString(),
            localStore.userDetail.email ?? '');
        if (data) {
          wishItemModel?.value.items?.removeAt(index);
        }
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
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }

  bool isWishListEmpty() {
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

  void showAddToCartDialog(BuildContext context, String name, String image) {
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
                LanguageConstants.youaddCartText.tr,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Text(
                LanguageConstants.toShoopingCartText.tr,
                style: const TextStyle(
                  fontSize: 14,
                ),
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
                  const SizedBox(width: 20.0),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: const Color(0xff000080)),
                              child: Text(
                                LanguageConstants.continueShoppingText.tr,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RoutesConstants.cartScreen);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                      color: const Color(0xff000080)),
                                  color: Colors.white),
                              child: Text(
                                LanguageConstants.gotoCartText.tr.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff000080),
                                    fontWeight: FontWeight.w500),
                              ),
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

  String getAttributeId(int index) {
    return (wishItemModel?.value.items?[index].product?.extensionAttributes!
                .configurableProductOptions?.isNotEmpty ??
            false)
        ? (wishItemModel?.value.items?[index].product?.extensionAttributes!
                .configurableProductOptions?.first.attributeId ??
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
