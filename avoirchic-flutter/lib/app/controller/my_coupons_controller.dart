import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/api_repository/cart_get_data_repository.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/api/services/cart_service.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class MyCouponsController extends GetxController {
  CartGetDataAPIRepository cartGetDataAPIRepository = CartGetDataAPIRepository(
      baseUrl: AppConstants.apiEndPointLogin,
      cartService: CartService(
          RecommendedProductApi(baseUrl: AppConstants.apiEndPointLogin),
          CartApi(
            baseUrl: AppConstants.apiEndPointLogin,
          )));
  RxBool isLoading = false.obs;
  Rx<CouponCode> couponCode = CouponCode().obs;

  MyCouponsController();

  @override
  void onInit() {
    getCoupons();
    super.onInit();
  }

  Future<void> getCoupons() async {
    isLoading.value = true;
    try {
      CouponCode data = await cartGetDataAPIRepository.getCoupons();
      couponCode.value = data;
      couponCode.value.items
          ?.removeWhere((element) => (element.code?.isEmpty ?? true));
      debugPrint("getCoupons List Is ${couponCode.value}");
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
}
