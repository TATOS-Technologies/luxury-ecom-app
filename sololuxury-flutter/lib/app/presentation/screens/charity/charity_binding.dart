import 'package:solo_luxury/all_imports.dart';

class CharityBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharityPopUpController());
  }
}
