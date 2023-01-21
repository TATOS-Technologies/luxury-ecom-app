import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_orders/my_orders_controller.dart';

class MyOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrdersController(), fenix: true);
  }
}
