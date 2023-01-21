import 'package:solo_luxury/all_imports.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
