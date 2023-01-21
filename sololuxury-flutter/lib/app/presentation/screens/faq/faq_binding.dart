import 'package:solo_luxury/all_imports.dart';

class FaqBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}
