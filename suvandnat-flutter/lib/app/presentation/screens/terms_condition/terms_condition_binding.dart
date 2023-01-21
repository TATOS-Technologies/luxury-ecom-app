import 'package:get/get.dart';
import 'package:suvandnat/app/controller/terms_condition/terms_condition_controller.dart';

class TeamsConditionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamsConditionController());
  }
}
