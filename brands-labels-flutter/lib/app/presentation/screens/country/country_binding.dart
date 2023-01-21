import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:get/get.dart';

class CountryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryController());
  }
}
