import 'package:get/get.dart';
import 'package:suvandnat/app/controller/charity/charity_popup_controller.dart';

class CharityPopUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharityPopUpController());
  }
}
