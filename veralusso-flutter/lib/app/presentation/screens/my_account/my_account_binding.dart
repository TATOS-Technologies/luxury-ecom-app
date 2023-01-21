import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_account/my_account_controller.dart';

class MyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAccountController());
  }
}
