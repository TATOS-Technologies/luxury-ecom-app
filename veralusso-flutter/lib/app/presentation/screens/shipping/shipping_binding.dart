import 'package:get/get.dart';
import 'package:veralusso/app/controller/shipping/shipping_controller.dart';

class ShippingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingController());
  }
}
