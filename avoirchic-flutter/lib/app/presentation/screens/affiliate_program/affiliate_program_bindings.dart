import 'package:avoirchic/app/controller/affiliate_program_controller.dart';
import 'package:get/get.dart';

class AffiliateProgramBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AffiliateProgramController());
  }
}
