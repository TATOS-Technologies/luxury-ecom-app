import 'package:get/get.dart';
import 'package:veralusso/app/controller/donation/charity_controller.dart';

class CharityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharityController());
  }
}
