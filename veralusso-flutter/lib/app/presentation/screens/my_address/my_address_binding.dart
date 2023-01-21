import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_address/my_address_controller.dart';

class MyAddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAddressController());
  }
}
