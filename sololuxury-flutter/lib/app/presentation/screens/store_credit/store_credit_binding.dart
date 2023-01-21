import 'package:solo_luxury/all_imports.dart';

class StoreCreditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreCreditController());
  }
}
