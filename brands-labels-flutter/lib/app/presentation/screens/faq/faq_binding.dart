import 'package:brandslabels/app/controller/faq_controller.dart';
import 'package:get/get.dart';

class FaqBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}
