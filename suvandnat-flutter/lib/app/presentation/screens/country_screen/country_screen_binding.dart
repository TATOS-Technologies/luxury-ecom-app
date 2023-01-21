import 'package:get/get.dart';
import 'package:suvandnat/app/controller/country_screen/country_screen_controller.dart';

class CountryPopUpScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryPopUpScreenController());
  }
}
