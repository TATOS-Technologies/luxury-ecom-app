import 'package:brandslabels/app/controller/add_address_controller.dart';
import 'package:get/get.dart';

class AddAddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddressController());
  }
}
