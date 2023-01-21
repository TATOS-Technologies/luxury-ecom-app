import 'package:brandslabels/app/controller/cart_controller.dart';
import 'package:brandslabels/app/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
