import 'package:get/get.dart';
import 'package:suvandnat/app/controller/charity/charity_controller.dart';

class CharityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharityController());
  }
}
