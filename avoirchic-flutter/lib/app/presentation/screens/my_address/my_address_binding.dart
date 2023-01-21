import 'package:avoirchic/app/controller/my_address_controller.dart';
import 'package:get/get.dart';

class AddressBookBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressBookController());
  }
}
