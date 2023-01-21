import 'package:get/get.dart';
import 'package:suvandnat/app/controller/order_confirmation/order_confirmation_controller.dart';

class OrderConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderConfirmationController());
  }
}
