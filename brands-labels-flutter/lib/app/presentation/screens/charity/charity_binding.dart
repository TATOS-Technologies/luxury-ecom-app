import 'package:brandslabels/app/controller/charity_controller.dart';
import 'package:get/get.dart';

class CharityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharityController());
  }
}
