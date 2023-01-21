import 'package:brandslabels/app/controller/special_size_request_controller.dart';
import 'package:get/get.dart';

class SpecialSizeRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpecialSizeRequestController());
  }
}
