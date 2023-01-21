import 'package:get/get.dart';
import 'package:avoirchic/app/controller/my_account_controller.dart';
import 'package:avoirchic/app/controller/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => MyAccountController());
  }
}
