import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_orders/order_details/order_details_controller.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailsController());
  }
}
