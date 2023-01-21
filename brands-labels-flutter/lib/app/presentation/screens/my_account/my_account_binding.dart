import 'package:brandslabels/app/controller/my_account_controller.dart';
import 'package:get/get.dart';

class MyAccountBinding extends Bindings {
  @override
  void dependencies() {
    /*   Get.lazyPut(() => MyAccountController(myAccountAPIRepository: Get.find()));*/
    Get.lazyPut(() => MyAccountController());
    /* Get.put(MyAccountAPIRepository(myAccountAPIProvider: Get.find()));*/
  }
}
