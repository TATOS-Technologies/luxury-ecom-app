import 'package:avoirchic/app/controller/app_secure_shopping_controller.dart';
import 'package:get/get.dart';

class AppSecureShoppingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppSecureShoppingController());
  }
}
