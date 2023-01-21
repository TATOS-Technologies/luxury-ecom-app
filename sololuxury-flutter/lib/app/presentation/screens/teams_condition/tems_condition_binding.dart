import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/controller/teams_condition/tems_condition_controller.dart';

class TermAndConditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermAndConditionController());
  }
}
