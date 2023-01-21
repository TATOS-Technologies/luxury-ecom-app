import 'package:get/get.dart';
import 'package:veralusso/app/controller/special_size_request/special_size_request_controller.dart';

class SpecialSizeRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpecialSizeRequestController());
  }
}
