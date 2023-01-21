// ignore_for_file: prefer_typing_uninitialized_variables, inference_failure_on_function_invocation

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/recommended_products_api_repository.dart';
import 'package:meta_package/api/api_repository/wishlist_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart'
    as my_account;
import 'package:meta_package/api/models/product/product_model.dart' as pm;
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:suvandnat/app/controller/wishlist/wishlist_dialog.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class WishlistController extends GetxController {
  RxInt index = 0.obs;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  WishlistController();

  Rx<WishListProductModel> wishItemModel = WishListProductModel().obs;
  RxBool isLoading = true.obs;
  my_account.MyAccountDetails userDetail = my_account.MyAccountDetails();
  List<SizeModel> sizeList = [];
  RxBool isScreenLoading = false.obs;
  TextEditingController? countController = TextEditingController(text: "1");
  Rx<SizeModel>? selectSizeValue = SizeModel().obs;

  @override
  Future<void> onInit() async {
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
    try {
      List<SizeModel>? data =
          await recommendedProductsAPIRepository.getChooseInSizeList();
      if (data.isNotEmpty == true) {
        sizeList = data;
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> getWishlistProducts() async {
    try {
      WishListProductModel data = await wishListAPIRepository
          .getWishListApiResponse(localStore.customerToken);
      wishItemModel.value = data;
      wishItemModel.value.items?.forEach((element) {
        element.product?.countController = TextEditingController(text: '1');
        element.product?.selectSizeValue = SizeModel().obs;
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
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getLocalWishListData() async {
    wishItemModel.value = await localStore.getWishListData();
    wishItemModel.value.items?.forEach((element) {
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
        if (data.isNotEmpty == true) {
          await postAddToCartData(
            wishItemModel.value.items?[index].product?.name ?? '',
            productImage(index),
            wishItemModel.value.items?[index].product?.sku ?? '',
            "1",
            data,
            countController?.text.trim(),
            wishItemModel.value.items?[index].product?.typeId ?? '',
            optionId: getAttributeId(index),
            optionValue: getSelectedSizeValue(index),
          );
        }
      } else {
        debugPrint("Guest");
        localStore.getGuestToken();

        if (localStore.guestToken.isNotEmpty) {
          await postAddToCartData(
            wishItemModel.value.items?[index].product?.name ?? '',
            productImage(index),
            wishItemModel.value.items?[index].product?.sku ?? '',
            "2",
            localStore.guestToken,
            countController?.text.trim(),
            wishItemModel.value.items?[index].product?.typeId ?? '',
            optionId: getAttributeId(index),
            optionValue: getSelectedSizeValue(index),
          );
        } else {
          String data = await recommendedProductsAPIRepository
              .getGenerateCartApiResponse();
          if (data.isNotEmpty == true) {
            await LocalStore.setPrefStringValue(
              kStorageConstGuestauthToken,
              (data).replaceAll('"', ''),
            );
            await postAddToCartData(
              wishItemModel.value.items?[index].product?.name ?? '',
              productImage(index),
              wishItemModel.value.items?[index].product?.sku ?? '',
              "2",
              data,
              countController?.text.trim(),
              wishItemModel.value.items?[index].product?.typeId ?? '',
              optionId: getAttributeId(index),
              optionValue: getSelectedSizeValue(index),
            );
          }
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
    try {
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
      if (getValue == "1") {
        await recommendedProductsAPIRepository
            .postAddTOCartProductResponse(passedAddToCart);
      } else {
        await recommendedProductsAPIRepository
            .guestPostAddTOCartProductResponse(passedAddToCart);
      }
      return WishlistDialog.showAddDialog(Get.context!, dataName, customImage);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> deleteWishListData(int index) async {
    try {
      isScreenLoading.value = true;

      if (localStore.customerToken.isNotEmpty) {
        await wishListAPIRepository.deleteWishList(
            (wishItemModel.value.items?[index].id ?? 0).toString(),
            localStore.userDetail.email ?? '');
        wishItemModel.value.items?.removeAt(index);
      } else {
        WishListProductModel wishItemList = WishListProductModel();
        wishItemList = await localStore.getWishListData();

        for (int i = 0; i <( wishItemList.items?.length ?? 0); i++) {
          if (wishItemList.items![i].id.toString() ==
              wishItemModel.value.items?[index].id.toString()) {
            wishItemModel.value.items?.removeAt(index);
            wishItemList.items?.removeAt(i);
          }
        }
        await LocalStore.setPrefStringValue(
            kStorageConstWishListData, jsonEncode(wishItemList));
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

  String productImage(int index) {
    for (var element
        in wishItemModel.value.items?[index].product?.customAttributes ?? []) {
      if (element.attributeCode == "image") {
        return "${AppConstants.productImageUrl}${element.value}";
      }
    }
    return "";
  }

  String getProductPrice(int index) {
    return wishItemModel.value.items?[index].product?.extensionAttributes
            ?.convertedRegularPrice ??
        '';
  }

  String getAttributeId(int index) {
    return (wishItemModel.value.items?[index].product?.extensionAttributes!
                .configurableProductOptions?.isNotEmpty ??
            false)
        ? (wishItemModel.value.items?[index].product?.extensionAttributes!
                .configurableProductOptions?.first.attributeId ??
            "0")
        : "0";
  }

  String getProductName(int index) {
    return wishItemModel.value.items?[index].product?.name ?? '';
  }

  String getSelectedSizeValue(int index) {
    return (selectSizeValue?.value.value ?? "0");
  }

  bool isWishListEmpty() {
    return (wishItemModel.value.items == null ||
        (wishItemModel.value.items?.isEmpty ?? false));
  }

  Future<void> wishListOnTap(ItemProduct? item) async {
    pm.ProductItem itemProduct = pm.ProductItem();
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
    itemProduct.createdAt = DateTime.parse(data.createdAt.toString());
    itemProduct.updatedAt = DateTime.parse(data.updatedAt.toString());
    itemProduct.productLinks = data.productLinks;
    itemProduct.tierPrices = data.tierPrices;

    itemProduct.customAttributes = [];
    for (var element in data.customAttributes!) {
      pm.CustomAttributes customAttribute = pm.CustomAttributes();
      customAttribute.value = element.value.toString();
      customAttribute.attributeCode = element.attributeCode;
      itemProduct.customAttributes?.add(customAttribute);
    }

    Get.toNamed(RoutesConstants.productDetailsScreen,
        arguments: [itemProduct, "brand"]);
  }
}
