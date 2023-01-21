import 'package:avoirchic/app/controller/my_account_information_controller.dart';
import 'package:get/get.dart';

class MyAccountInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAccountInformationController());
  }
}
