import 'package:brandslabels/app/controller/returns_and_refunds_controller.dart';
import 'package:get/get.dart';

class ReturnsAndRefundsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReturnsAndRefundsController());
  }
}
