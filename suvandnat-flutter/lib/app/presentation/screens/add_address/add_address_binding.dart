import 'package:get/get.dart';
import 'package:suvandnat/app/controller/add_address/add_address_controller.dart';

class AddAddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddressController());
  }
}
