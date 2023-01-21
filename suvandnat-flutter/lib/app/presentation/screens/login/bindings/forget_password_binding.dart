import 'package:get/get.dart';
import 'package:suvandnat/app/controller/login/forget_password_controller.dart';

class ForgotPasswordMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordMenuController());
  }
}
