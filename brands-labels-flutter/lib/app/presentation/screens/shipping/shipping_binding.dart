import 'package:brandslabels/app/controller/shipping_controller.dart';
import 'package:get/get.dart';

class ShippingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingController());
  }
}
