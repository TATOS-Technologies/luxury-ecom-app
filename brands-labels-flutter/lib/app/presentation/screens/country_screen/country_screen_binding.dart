import 'package:brandslabels/app/controller/country_screen_controller.dart';
import 'package:get/get.dart';

class CountryScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryScreenController());
  }
}
