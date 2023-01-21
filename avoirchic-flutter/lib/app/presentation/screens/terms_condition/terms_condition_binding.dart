import 'package:avoirchic/app/controller/terms_condition_controller.dart';
import 'package:get/get.dart';

class TeamsConditionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamsConditionController());
  }
}
