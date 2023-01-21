import 'package:brandslabels/app/controller/contact_us_controller.dart';
import 'package:get/get.dart';

class ContactUsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsController());
  }
}
