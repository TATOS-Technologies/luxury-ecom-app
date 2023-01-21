import 'package:get/get.dart';
import 'package:suvandnat/app/controller/login/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
