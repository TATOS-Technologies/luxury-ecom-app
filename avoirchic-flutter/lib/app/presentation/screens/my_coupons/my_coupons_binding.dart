import 'package:avoirchic/app/controller/my_coupons_controller.dart';
import 'package:get/get.dart';

class MyCouponsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCouponsController());
  }
}
