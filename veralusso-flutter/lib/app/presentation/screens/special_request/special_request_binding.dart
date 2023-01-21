import 'package:get/get.dart';
import '../../../controller/special_request/special_request_controller.dart';

class SpecialRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpecialRequestController());
  }
}
