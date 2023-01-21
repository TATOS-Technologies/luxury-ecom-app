import 'package:get/get.dart';
import 'package:suvandnat/app/controller/cart/cart_controller.dart';
import 'package:suvandnat/app/controller/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
