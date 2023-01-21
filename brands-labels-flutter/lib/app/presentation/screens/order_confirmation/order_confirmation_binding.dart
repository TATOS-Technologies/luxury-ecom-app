import 'package:brandslabels/app/controller/order_confirmation_controller.dart';
import 'package:get/get.dart';

class OrderConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderConfirmationController());
  }
}
