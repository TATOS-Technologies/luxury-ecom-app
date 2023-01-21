import 'package:get/get.dart';
import 'package:suvandnat/app/controller/select_country/select_country_controller.dart';

class SelectCountryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectCountryController());
  }
}
