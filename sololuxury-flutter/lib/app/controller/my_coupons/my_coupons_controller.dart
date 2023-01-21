import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/api/services/cart_service.dart';

import '../../../all_imports.dart';

class MyCouponsController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<CouponCode> couponCode = CouponCode().obs;
  final CartGetDataAPIRepository cartGetDataAPIRepository =
      CartGetDataAPIRepository(
          baseUrl: AppConstants.apiEndPointLogin,
          cartService: CartService(
              RecommendedProductApi(baseUrl: AppConstants.apiEndPointLogin),
              CartApi(
                baseUrl: AppConstants.apiEndPointLogin,
              )));

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
      debugPrint("getCoupons List Is coupon ${couponCode.value}");
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
