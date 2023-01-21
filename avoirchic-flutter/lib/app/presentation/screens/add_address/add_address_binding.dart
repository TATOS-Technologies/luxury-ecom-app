import 'package:get/get.dart';
import '../../../controller/add_address_controller.dart';

class AddAddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddressController());
  }
}
