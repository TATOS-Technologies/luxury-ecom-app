import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_account/my_account_information_controller.dart';

class MyAccountInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAccountInformationController());
  }
}
