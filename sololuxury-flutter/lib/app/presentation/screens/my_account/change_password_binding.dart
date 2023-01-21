import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/controller/my_account/change_password_controller.dart';

class ChangePasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}
