import 'dart:convert';
import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/data/local_data/local_store.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/presentation/screens/cart/widget/cart_coupon_applied_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livechatt/livechatt.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/api_repository/cart_get_data_repository.dart';
import 'package:meta_package/api/api_repository/recommended_products_api_repository.dart';
import 'package:meta_package/api/api_repository/wishlist_api_repository.dart';
import 'package:meta_package/api/models/cart/cart_model.dart' as cart;
import 'package:meta_package/api/models/cart/donation_modal.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/services/cart_service.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/utils/validator.dart';

import '../presentation/common_widgets/common_widget/common_text_poppins.dart';

class CartController extends GetxController {
  Rx<cart.CartModel> cartModel = cart.CartModel().obs;
  final CartGetDataAPIRepository cartGetDataAPIRepository =
      CartGetDataAPIRepository(
          baseUrl: AppConstants.apiEndPointLogin,
          cartService: CartService(
              RecommendedProductApi(baseUrl: AppConstants.apiEndPointLogin),
              CartApi(
                baseUrl: AppConstants.apiEndPointLogin,
              )));
  final RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxList cartItemNumber = [].obs;

  CartController();

  RxBool isLoading = false.obs;
  RxBool isMainLoading = false.obs;
  RxBool showAppliedCoupons = false.obs;
  Rx<ProductItem> product = ProductItem().obs;
  Rx<Totals> getTotalsData = Totals().obs;

  MyAccountDetails userDetail = MyAccountDetails();

  TextEditingController promoCodeController = TextEditingController();

  Rx<CouponCode> couponCode = CouponCode().obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<DonationItems> donationList = <DonationItems>[].obs;

  @override
  void onInit() async {
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    getGenerateCart();
    getDonationData();
    getCoupons();
    super.onInit();
  }

  Future<void> getCoupons() async {
    try {
      CouponCode data = await cartGetDataAPIRepository.getCoupons();
      couponCode.value = data;
      couponCode.value.items
          ?.removeWhere((element) => (element.code?.isEmpty ?? true));
      debugPrint("getCoupons List Is ${couponCode.value}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> addCouponsToCartForField() async {
    isLoading.value = true;
    try {
      String data = await cartGetDataAPIRepository.addCouponsToCart(
        promoCodeController.text,
      );
      if (data.isNotEmpty == true) {
        debugPrint("getCoupons List Is addCouponsToCart $data");
        await getTotals(showDialog: true);
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteAppliedCoupon() async {
    isLoading.value = true;
    try {
      String? data = await cartGetDataAPIRepository.deleteAppliedCoupons();
      await getTotals();
      if (data.isNotEmpty == true) {
        showAppliedCoupons.value = false;
        promoCodeController.text = '';
        Validators.apiResponseMessage(
          body: data,
          message: 'Coupon Removed Successfully',
          color: Colors.green,
        );
      } else {
        showAppliedCoupons.value = false;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getTotals({
    bool showDialog = false,
  }) async {
    try {
      isLoading.value = true;
      Totals data = await cartGetDataAPIRepository.getTotals();
      getTotalsData.value = data;
      if (getTotalsData.value.getDiscount() != null) {
        showAppliedCoupons.value = true;
        promoCodeController.text = (getTotalsData.value.getDiscountName() ?? '')
            .split('(')
            .last
            .split(')')
            .first;
      } else {
        showAppliedCoupons.value = false;
        promoCodeController.clear();
      }
      if (showDialog) {
        showAppliedCoupons.value = true;
        showDialogForSuccessfullyAppliedCoupons(
          promoCodeController.text,
          data.discountAmount?.abs().toString() ?? '0',
        );
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> postAddToWishlistData(int index) async {
    try {
      isLoading.value = true;
      String sku = cartModel.value.items?[index].sku ?? '';
      dynamic addToWishData;
      debugPrint("Here Customer Post");
      addToWishData = await wishListAPIRepository.addToWishList(
          sku, localStore.userDetail.email ?? '');
      debugPrint("Add To Cart Data $addToWishData");
      if (addToWishData != null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
              content: CommonTextPoppins('Product added to wishList')),
        );
        if (localStore.customerToken.toString() != "") {
          await deleteCartProductContent(index, 1);
        } else {
          await deleteCartProductContent(index, 2);
        }
      } else {
        String? message;
        try {
          message = jsonDecode(addToWishData.errorMsg.toString())['message']
              .toString();
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(content: CommonTextPoppins(message)),
          );
        } on FormatException {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
                content: CommonTextPoppins(addToWishData.errorMsg.toString())),
          );
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  void showDialogForSuccessfullyAppliedCoupons(
      String couponCode, String savedValue) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return CartCouponSuccessfullyApplied(
          couponCode: couponCode,
          savedValue: savedValue,
        );
      },
    );
  }

  Future<ProductItem?> getProductDetail(String sku) async {
    try {
      isLoading(true);
      ProductItem data = await recommendedProductsAPIRepository
          .getProductDetailApi(sku.toString());
      product.value = data;
      isLoading(false);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return product.value;
  }

  void clickChatEvent({String? name, String? email}) {
    Livechat.beginChat(
        AppConstants.licenceId,
        '1',
        name ?? userDetail.firstname.toString().trim(),
        email ?? userDetail.email.toString().trim());
  }

  bool checkItemSkuEmptyData(ProductItem item) {
    return cartModel.value.items == null ||
        (cartModel.value.items
                ?.where((element) =>
                    (element.sku.toString().split('-').first) ==
                    (item.sku.toString().split('-').first))
                .isEmpty ??
            false);
  }

  Future<void> getDonationData() async {
    try {
      donationList.value = [];
      DonationModal data = await cartGetDataAPIRepository.getDonationListData();
      donationList.value = data.items ?? [];
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> fetchCart() async {
    try {
      cartModel.value =
          await cartGetDataAPIRepository.getCartGetDataApiResponse(
              currentCurrency: LocalStore.localStore.currentCurrency);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("Error $e");
      ExceptionHandler.appCatchError(error: e);
    }
    await getTotals();
  }

  Future<void> getGenerateCart() async {
    try {
      isMainLoading.value = true;
      if (localStore.customerToken.isNotEmpty) {
        String data =
            await recommendedProductsAPIRepository.getGenerateCartApiResponse();

        if (data.isNotEmpty == true) {
          await getFaqContent(1);
        }
      } else {
        await localStore.getGuestToken();
        if (localStore.guestToken.isNotEmpty) {
          await getFaqContent(2);
        } else {
          String data = await recommendedProductsAPIRepository
              .getGenerateCartApiResponse();
          await LocalStore.setPrefStringValue(
              kStorageConstGuestauthToken, (data).replaceAll('"', ''));
          await localStore.getGuestToken();
          await getFaqContent(2);
        }
      }
    } catch (e) {
      isMainLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isMainLoading.value = false;
    }
  }

  String getProductImage(int index) {
    if (cartModel.value.items?[index].extensionAttributesImage?.productImage !=
        null) {
      return cartModel
              .value.items?[index].extensionAttributesImage?.productImage ??
          '';
    } else {
      return "";
    }
  }

  Future<void> deleteProduct(int index) async {
    if (localStore.customerToken.toString() != "") {
      await deleteCartProductContent(index, 1);
    } else {
      await deleteCartProductContent(index, 2);
    }
  }

  Future<void> getFaqContent(int getValue) async {
    try {
      cart.CartModel cartData;
      if (getValue == 1) {
        cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse(
            currentCurrency: localStore.currentCurrency);
      } else {
        cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse(
            currentCurrency: localStore.currentCurrency);
      }
      cartModel.value = cartData;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    }
    await getTotals();
  }

  Future<void> deleteCartProductContent(int index, int getValue) async {
    try {
      isLoading.value = true;
      String? deleteProductId =
          cartModel.value.items?[index].itemId?.toString();
      if (deleteProductId != null) {
        if (getValue == 1) {
          await cartGetDataAPIRepository.deleteCartCartQTYDataApiResponse(
            deleteProductId,
            AppConstants.getDeleteUrlWithCode() +
                AppConstants.deleteCartProdyctData,
          );
        } else {
          await cartGetDataAPIRepository.deleteCartCartQTYDataApiResponse(
            deleteProductId,
            "${AppConstants.getDeleteUrlWithCode() + AppConstants.guestCreateCart}/${localStore.guestToken.toString()}/items/",
          );
        }
      }
      await getFaqContent(getValue);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  //Add TO Cart Api Calling
  Future<void> increaseProductQty(int index) async {
    try {
      isLoading.value = true;
      cart.Items? cartItem = cartModel.value.items?[index];
      String sku = cartItem?.sku ?? '';
      String quoteId = cartItem?.quoteId ?? '';
      int itemId = cartItem?.itemId ?? 0;
      int qty = (cartItem?.qty ?? 0) + 1;
      Map<String, dynamic> passedAddToCart = {
        "cartItem": {
          "sku": sku,
          "qty": "$qty",
          "quote_id": localStore.guestToken.toString()
        }
      };
      Map<String, dynamic> passedAddToCart2 = {
        "cartItem": {"sku": sku, "qty": "$qty", "quote_id": quoteId}
      };
      cart.Items addToCartData;
      if (localStore.customerToken.toString() != "") {
        debugPrint("Customer Here Post");
        addToCartData = await recommendedProductsAPIRepository.updateProductQty(
            passedAddToCart2, itemId.toString());
      } else {
        debugPrint("Guest Here Post");
        addToCartData = await recommendedProductsAPIRepository
            .guestUpdateProductQty(passedAddToCart, itemId.toString());
      }
      debugPrint("Remove To Cart Data $addToCartData");
      cartModel.value.items?[index] = addToCartData;
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> postRemoveFromCartData(int index) async {
    try {
      isLoading.value = true;
      cart.Items? cartItem = cartModel.value.items?[index];
      String sku = cartItem?.sku ?? '';
      String quoteId = cartItem?.quoteId ?? '';
      int itemId = cartItem?.itemId ?? 0;
      int qty = (cartItem?.qty ?? 0) - 1;
      Map<String, dynamic> passedAddToCart = {
        "cartItem": {
          "sku": sku,
          "qty": "$qty",
          "quote_id": localStore.guestToken.toString()
        }
      };
      Map<String, dynamic> passedAddToCart2 = {
        "cartItem": {"sku": sku, "qty": "$qty", "quote_id": quoteId}
      };
      cart.Items addToCartData;
      if (localStore.customerToken.toString() != "") {
        debugPrint("Customer Here Post");
        addToCartData = await recommendedProductsAPIRepository.updateProductQty(
            passedAddToCart2, itemId.toString());
      } else {
        debugPrint("Guest Here Post");
        addToCartData = await recommendedProductsAPIRepository
            .guestUpdateProductQty(passedAddToCart, itemId.toString());
      }
      debugPrint("Remove To Cart Data $addToCartData");
      cartModel.value.items?[index] = addToCartData;
    } catch (e, st) {
      log('Error is:-->> $e && st is:-->>$st');
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
  }

  String getSubTotal(int index) {
    return localStore.getRegularPriceWithCurrency(
        (cartModel.value.items?[index].price *
                cartModel.value.items?[index].qty)
            .toString(),
        (cartModel.value.items?[index].price *
                cartModel.value.items?[index].qty)
            .toString());
  }
}
