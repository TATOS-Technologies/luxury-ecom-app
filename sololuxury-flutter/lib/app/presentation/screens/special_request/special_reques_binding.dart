import 'package:solo_luxury/all_imports.dart';

class SpecialRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpecialRequestController());
  }
}
