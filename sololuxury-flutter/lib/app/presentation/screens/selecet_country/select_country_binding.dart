import 'package:solo_luxury/all_imports.dart';

class SelectCountryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectCountryController());
  }
}
