import 'package:solo_luxury/app/controller/my_account/my_account_information_controller.dart';
import 'package:solo_luxury/all_imports.dart';

class MyAccountInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAccountInformationController());
  }
}
