import 'package:get/get.dart';
import 'package:veralusso/app/controller/affiliate_program/affiliate_program_controller.dart';

class AffiliateProgramBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AffiliateProgramController());
  }
}
