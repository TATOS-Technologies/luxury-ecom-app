import 'package:get/get.dart';
import 'package:suvandnat/app/controller/signup/signup_controller.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
