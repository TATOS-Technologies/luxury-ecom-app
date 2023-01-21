import 'package:get/get.dart';
import 'package:veralusso/app/controller/faq/faq_controller.dart';

class FaqBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}
