import 'package:solo_luxury/app/controller/my_coupons/my_coupons_controller.dart';
import 'package:solo_luxury/all_imports.dart';

class MyCouponsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCouponsController());
  }
}
