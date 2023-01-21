import 'package:get/get.dart';
import 'package:veralusso/app/controller/login/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
