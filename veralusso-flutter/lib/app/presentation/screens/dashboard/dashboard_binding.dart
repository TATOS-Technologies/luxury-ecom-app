import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_account/my_account_controller.dart';
import 'package:veralusso/app/controller/dashboard/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => MyAccountController());
  }
}
