import 'package:solo_luxury/all_imports.dart';

class OrderConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderConfirmationController());
  }
}
