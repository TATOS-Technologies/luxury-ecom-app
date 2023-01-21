import 'package:get/get.dart';
import 'package:veralusso/app/controller/signup/signup_controller.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
