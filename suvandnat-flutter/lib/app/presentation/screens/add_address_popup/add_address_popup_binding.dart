import 'package:get/get.dart';

import 'package:suvandnat/app/controller/add_address_popup/add_address_popup_controller.dart';

class AddAddressPopUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddressPopUpController());
  }
}
