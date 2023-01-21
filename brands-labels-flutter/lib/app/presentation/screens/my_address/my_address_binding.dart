import 'package:brandslabels/app/controller/my_address_controller.dart';
import 'package:get/get.dart';

class MyAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAddressController());
  }
}
