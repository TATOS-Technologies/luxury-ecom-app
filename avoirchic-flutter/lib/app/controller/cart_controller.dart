import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/data/local_data/local_store.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:avoirchic/app/presentation/screens/cart/widget/cart_coupon_applied_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import 'package:meta_package/translations/translations.dart';
import 'package:meta_package/utils/validator.dart';

import '../main/main.common.dart';
import '../presentation/common_widgets/common_widget/common_text_poppins.dart';
import '../theme/colors.dart';

class CartController extends GetxController {
  Rx<cart.CartModel> cartModel = cart.CartModel().obs;
  RxInt cartItemNumber = 1.obs;
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

  CartController();

  MyAccountDetails userDetail = MyAccountDetails();

  RxBool isLoading = true.obs;
  RxBool isScreenLoading = false.obs;
  RxString getCartToken = "".obs;
  RxList<DonationItems> donationList = <DonationItems>[].obs;
  Rx<Totals> getTotalsData = Totals().obs;
  Rx<CouponCode> couponCode = CouponCode().obs;
  TextEditingController promoCodeController = TextEditingController();
  RxBool showAppliedCoupons = false.obs;

  @override
  Future<void> onInit() async {
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    getGenerateCart();
    getDonationData();
    getCoupons();
    super.onInit();
  }

  Future confirmationDialogForRemove(int index, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return CommonAlertDialog(
            elevation: 6.0,
            radius: 0,
            backgroundColor: const Color(
              0xffedf8fe,
            ),
            titleWidget: Text(
              LanguageConstants.removeProduct.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            contentWidget: Text(
              LanguageConstants.areYouSureWantToRemoveThisProductFromCart.tr,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            actionWidgets: [
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: avoirChickTheme,
                  ),
                  child: Text(
                    LanguageConstants.yes.tr,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onTap: () {
                  Get.back();
                  if (localStore.customerToken.toString() != "") {
                    deleteCartProductContent(
                      index,
                      1,
                    );
                  } else {
                    deleteCartProductContent(
                      index,
                      2,
                    );
                  }
                },
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: avoirChickTheme,
                  ),
                  child: Text(
                    LanguageConstants.no.tr,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ],
          );
        });
  }

  Future<void> getCoupons() async {
    try {
      CouponCode data = await cartGetDataAPIRepository.getCoupons();
      couponCode.value = data;
      couponCode.value.items
          ?.removeWhere((element) => (element.code?.isEmpty ?? true));
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> addCouponsToCartForField() async {
    isScreenLoading.value = true;
    try {
      String data = await cartGetDataAPIRepository
          .addCouponsToCart(promoCodeController.text);
      debugPrint("getCoupons List Is addCouponsToCart $data");
      await getTotals(showDialog: true);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      isScreenLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }

  Future<void> deleteAppliedCoupon() async {
    isScreenLoading.value = true;
    try {
      String data = await cartGetDataAPIRepository.deleteAppliedCoupons();
      await getTotals();
      showAppliedCoupons.value = false;
      promoCodeController.text = '';
      Validators.apiResponseMessage(
        body: data,
        message: LanguageConstants.couponRemoved.tr,
        color: Colors.green,
      );
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }

  Future<void> getTotals({
    bool showDialog = false,
  }) async {
    try {
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
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
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

  Future<void> getDonationData() async {
    donationList.value = [];
    try {
      DonationModal data = await cartGetDataAPIRepository.getDonationListData();
      donationList.value = data.items ?? [];
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  bool checkItemSkuEmptyData(ProductItem item) {
    return cartModel.value.items == null ||
        (cartModel.value.items
                ?.where((element) =>
                    (element.sku.toString().split('-').first) ==
                    (item.sku.toString().split('-').first ?? ''))
                .isEmpty ??
            false);
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
    isLoading.value = true;

    try {
      if (localStore.customerToken.isNotEmpty) {
        String data =
            await recommendedProductsAPIRepository.getGenerateCartApiResponse();
        if (data.isNotEmpty) {
          await getFaqContent(1);
        }
      } else {
        if (localStore.guestToken.isNotEmpty) {
          await getFaqContent(2);
        } else {
          String data = await recommendedProductsAPIRepository
              .getGenerateCartApiResponse();
          if (data.isNotEmpty) {
            getCartToken.value = (data).replaceAll('"', '');
            await LocalStore.setPrefStringValue(
              kStorageConstGuestauthToken,
              getCartToken.value.toString(),
            );
            await localStore.getGuestToken();
            if (getCartToken.value.isNotEmpty) {
              await getFaqContent(2);
            }
          }
        }
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

  void checkForEmptyDeletation(int index, BuildContext context) {
    if (cartModel.value.items?[index].qty == 1) {
      confirmationDialogForRemove(index, context);
    } else {
      postRemoveFromCartData(index);
    }
  }

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
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
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
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> postAddToWishlistData(int index) async {
    try {
      isLoading.value = true;
      String sku = cartModel.value.items?[index].sku ?? '';
      debugPrint("Here Customer Post");
      bool addToWishData = await wishListAPIRepository.addToWishList(
        sku,
        localStore.userDetail.email ?? '',
      );
      debugPrint("Add To Cart Data $addToWishData");
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            content:
                CommonTextPoppins(LanguageConstants.productAddedTowishList.tr)),
      );
      if (localStore.customerToken.toString() != "") {
        deleteCartProductContent(index, 1);
      } else {
        deleteCartProductContent(index, 2);
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

  void deleteProductFun(int index) {
    if (localStore.customerToken.toString() != "") {
      deleteCartProductContent(index, 1);
    } else {
      deleteCartProductContent(index, 2);
    }
  }

  String getRegularPriceFun(int index) {
    return localStore.getRegularPriceWithCurrency(
        cartModel.value.items?[index].price?.toString() ?? '',
        cartModel.value.items?[index].price?.toString() ?? '');
  }

  String getRegularPriceFun2(int index) {
    String price = ((cartModel.value.items?[index].qty ?? 0) *
            (double.tryParse(
                    cartModel.value.items?[index].price.toString() ?? '') ??
                0))
        .toString();
    return localStore.getRegularPriceWithCurrency(price, price).toString();
  }

  Future<void> getFaqContent(int getValue) async {
    cart.CartModel cartData;
    try {
      if (getValue == 1) {
        cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse(
          currentCurrency: localStore.currentCurrency,
        );
      } else {
        cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse(
            currentCurrency: localStore.currentCurrency);
      }
      cartModel.value = cartData;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
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
                  AppConstants.deleteCartProdyctData);
        } else {
          await cartGetDataAPIRepository.deleteCartCartQTYDataApiResponse(
              deleteProductId,
              "${AppConstants.getDeleteUrlWithCode() + AppConstants.guestCreateCart}/${localStore.guestToken}/items/");
        }
      }
      await getFaqContent(getValue);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getDeleteFaq(int getValue) async {
    cart.CartModel cartData;
    try {
      if (getValue == 1) {
        cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse(
            currentCurrency: localStore.currentCurrency);
      } else {
        cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse(
            currentCurrency: localStore.currentCurrency);
      }
      cartModel.value = cartData;
      debugPrint("CartModel Is $cartModel");
      debugPrint('$cartData');
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  bool isItemListEmpty() {
    return (cartModel.value.items?.isNotEmpty ?? false);
  }
}
