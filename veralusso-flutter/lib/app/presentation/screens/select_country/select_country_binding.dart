import 'package:get/get.dart';
import 'package:veralusso/app/controller/select_country/select_country_controller.dart';

class SelectCountryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectCountryController());
  }
}
