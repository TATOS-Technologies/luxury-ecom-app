import 'package:brandslabels/app/controller/special_request_controller.dart';
import 'package:get/get.dart';

class SpecialRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpecialRequestController());
  }
}
