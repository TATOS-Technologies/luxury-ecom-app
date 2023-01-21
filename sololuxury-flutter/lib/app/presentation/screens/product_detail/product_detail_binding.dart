import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/api_repository/generate_cart_repo.dart';
import 'package:meta_package/api/services/cart_service.dart';
import 'package:solo_luxury/all_imports.dart';

class ProductDetailsBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("PRODUCT DETAIL Binding ======");
    Get.lazyPut(() => ProductDetailController(
        cartGenerateAddRepository: CartGenerateAddRepository(CartService(
            RecommendedProductApi(baseUrl: AppConstants.apiEndPointLogin),
            CartApi(
              baseUrl: AppConstants.apiEndPointLogin,
            )))));

    debugPrint("BINDING=============");
    Get.lazyPut(() => CartController(), fenix: true);
    /* Get.put(() => RecommendedProductsAPIRepository(
        RecommendedProductsAPIProvider: Get.find()));*/
    /*  Get.put(() =>
        ProductDetailController(recommendedProductsAPIRepository: Get.find()));*/
  }
}
