import 'package:brandslabels/app/controller/checkout_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/check_order_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/api_repository/cart_get_data_repository.dart';
import 'package:meta_package/api/api_repository/check_order_api_repository.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:meta_package/api/services/cart_service.dart';
import 'package:meta_package/api/services/checkout_service.dart';

import '../../../core/consts/app_constants.dart';

class CheckoutOrderBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("CHECKOUT Binding ======");
    Get.lazyPut(() =>
        CheckoutOrderController(
          checkoutOrderAPIRepository: CheckoutOrderAPIRepository(
              checkoutService: CheckoutService(
                checkoutOrderApi: CheckOrderApi(
                  baseUrl: AppConstants.apiEndPointLogin,
                ),
              ),
              baseUrl: AppConstants.apiEndPointLogin),
          cartGetDataAPIRepository: CartGetDataAPIRepository(
            baseUrl: AppConstants.apiEndPointLogin,
            cartService: CartService(
                RecommendedProductApi(baseUrl: AppConstants.apiEndPointLogin),
                CartApi(
                  baseUrl: AppConstants.apiEndPointLogin,
                )),
          ), addressListAPIRepository: AddressAPIRepository(
            addressService: AddAddressService(AppConstants.apiEndPointLogin)),
        ));
    debugPrint("CHECKOUT end Binding ======");
  }
}
