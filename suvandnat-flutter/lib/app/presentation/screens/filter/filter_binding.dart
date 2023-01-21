import 'package:get/get.dart';
import 'package:suvandnat/app/controller/filter/filter_controller.dart';

class FilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterController());
  }
}
