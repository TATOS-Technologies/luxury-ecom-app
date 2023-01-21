import 'package:brandslabels/app/controller/product_add_to_cart_controller.dart';
import 'package:get/get.dart';

class ProductAddToCartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductAddToCartController());
  }
}
