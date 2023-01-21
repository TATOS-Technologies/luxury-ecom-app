import 'package:avoirchic/app/controller/my_orders_controller.dart';
import 'package:get/get.dart';

class MyOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrdersController(), fenix: true);
  }
}
