import 'package:solo_luxury/all_imports.dart';

class ForgotPasswordMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordMenuController());
  }
}
