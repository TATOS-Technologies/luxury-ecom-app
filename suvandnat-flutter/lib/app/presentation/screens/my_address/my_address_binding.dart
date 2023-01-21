import 'package:get/get.dart';
import 'package:suvandnat/app/controller/my_address/my_address_controller.dart';

class MyAddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAddressController());
  }
}
