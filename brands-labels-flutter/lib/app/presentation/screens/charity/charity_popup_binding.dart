import 'package:brandslabels/app/controller/charity_popup_controller.dart';
import 'package:get/get.dart';

class CharityPopUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharityPopUpController());
  }
}
