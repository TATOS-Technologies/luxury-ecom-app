import 'package:avoirchic/app/controller/forget_password_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordMenuController());
  }
}
