import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/check_order_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/services/cart_service.dart';
import 'package:meta_package/api/services/checkout_service.dart';
import 'package:solo_luxury/all_imports.dart';

class CheckoutOrderBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("CHECKOUT Binding ======");

    var cartServ = CartService(
        RecommendedProductApi(baseUrl: AppConstants.apiEndPointLogin),
        CartApi(
          baseUrl: AppConstants.apiEndPointLogin,
        ));
    Get.lazyPut(
      () => CheckoutOrderController(
        checkoutOrderAPIRepository: CheckoutOrderAPIRepository(
            checkoutService: CheckoutService(
              checkoutOrderApi: CheckOrderApi(
                baseUrl: AppConstants.apiEndPointLogin,
              ),
            ),
            baseUrl: AppConstants.apiEndPointLogin),
        cartGetDataAPIRepository: CartGetDataAPIRepository(
          baseUrl: AppConstants.apiEndPointLogin,
          cartService: cartServ,
        ),
      ),
    );
    debugPrint("CHECKOUT end Binding ======");
  }
}
