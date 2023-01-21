import 'package:solo_luxury/all_imports.dart';

class AppSecureShoppingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppSecureShoppingController());
  }
}
