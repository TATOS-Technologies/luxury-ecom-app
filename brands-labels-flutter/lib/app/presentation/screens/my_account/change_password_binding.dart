import 'package:brandslabels/app/controller/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}
