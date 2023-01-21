import 'package:solo_luxury/all_imports.dart';

class CountryPopUpScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryPopUpScreenController());
  }
}
