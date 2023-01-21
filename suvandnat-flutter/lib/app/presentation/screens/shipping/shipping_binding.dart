import 'package:get/get.dart';
import 'package:suvandnat/app/controller/shipping/shipping_controller.dart';

class ShippingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingController());
  }
}
