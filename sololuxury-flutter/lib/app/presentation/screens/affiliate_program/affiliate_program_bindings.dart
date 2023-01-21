import 'package:solo_luxury/all_imports.dart';

class AffiliateProgramBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AffiliateProgramController());
  }
}
