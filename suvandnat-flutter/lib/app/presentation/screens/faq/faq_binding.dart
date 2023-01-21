import 'package:get/get.dart';
// import 'package:suvandnat/app/screens/faq/faq_controller.dart';
import 'package:suvandnat/app/controller/faq/faq_controller.dart';

class FaqBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}
