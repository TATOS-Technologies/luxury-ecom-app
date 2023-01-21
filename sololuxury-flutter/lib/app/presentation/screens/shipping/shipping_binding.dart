import 'package:solo_luxury/all_imports.dart';

class ShippingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingController());
  }
}
