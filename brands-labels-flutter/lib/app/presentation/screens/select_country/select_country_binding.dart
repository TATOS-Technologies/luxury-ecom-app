import 'package:brandslabels/app/controller/select_country_controller.dart';
import 'package:get/get.dart';

class SelectCountryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectCountryController());
  }
}
