import 'package:brandslabels/app/controller/add_address_popup_controller.dart';
import 'package:get/get.dart';

class AddAddressPopUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddressPopUpController());
  }
}
