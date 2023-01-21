import 'package:get/get.dart';
import 'package:veralusso/app/controller/forgot_password/forget_password_controller.dart';

class ForgotPasswordMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordMenuController());
  }
}
