import 'package:get/get.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';

class CountryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryController());
  }
}
