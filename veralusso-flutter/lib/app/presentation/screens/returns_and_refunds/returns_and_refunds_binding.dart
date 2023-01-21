import 'package:get/get.dart';
import 'package:veralusso/app/controller/returns_and_refunds/returns_and_refunds_controller.dart';

class ReturnsAndRefundsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReturnsAndRefundsController());
  }
}
