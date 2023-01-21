import 'package:solo_luxury/all_imports.dart';

class ForgotPasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    /*Get.lazyPut<IForgotpasswordProvider>(() => ForgotPasswordProvider());
    Get.put(ForgotPasswordAPIRepository(provider: Get.find()));*/
    Get.lazyPut(() => ForgotPasswordPageController(
        /*forgotpasswordAPIRepository: Get.find()*/));
  }
}
