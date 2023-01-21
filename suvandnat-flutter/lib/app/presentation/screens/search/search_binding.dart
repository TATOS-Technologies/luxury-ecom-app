import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/api_repository/generate_cart_repo.dart';
import 'package:meta_package/api/services/cart_service.dart';
import 'package:suvandnat/app/controller/search/search_controller.dart';
import 'package:suvandnat/app/controller/cart/cart_controller.dart';
import 'package:suvandnat/app/controller/product_detail/product_detail_controller.dart';

import '../../../core/const/app_constants.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());

    Get.lazyPut(() => ProductDetailController(
        cartGenerateAddRepository: CartGenerateAddRepository(CartService(
            RecommendedProductApi(baseUrl: AppConstants.apiEndPointLogin),
            CartApi(
              baseUrl: AppConstants.apiEndPointLogin,
            )))));

    debugPrint("BINDING=============");
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
