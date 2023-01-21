import 'package:brandslabels/app/controller/my_account_controller.dart';
import 'package:brandslabels/app/controller/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => MyAccountController());
  }
}
