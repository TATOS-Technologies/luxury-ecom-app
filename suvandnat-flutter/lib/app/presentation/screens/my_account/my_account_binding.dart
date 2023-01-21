import 'package:get/get.dart';
import 'package:suvandnat/app/controller/my_account/my_account_controller.dart';

class MyAccountBinding extends Bindings {
  @override
  void dependencies() {
    /*   Get.lazyPut(() => MyAccountController(myAccountAPIRepository: Get.find()));*/
    Get.lazyPut(() => MyAccountController());
    // Get.lazyPut<IMyAccountProvider>(() => MyAccountAPIProvider());
    /* Get.put(MyAccountAPIRepository(myAccountAPIProvider: Get.find()));*/
  }
}
