import 'package:solo_luxury/all_imports.dart';

class ReturnsAndRefundsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReturnsAndRefundsController());
  }
}
