import 'package:get/get.dart';
import 'package:veralusso/app/controller/filter/filter_controller.dart';

class FilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterController());
  }
}
