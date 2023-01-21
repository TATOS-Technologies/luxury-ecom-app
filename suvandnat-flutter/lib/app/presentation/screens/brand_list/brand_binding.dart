import 'package:get/get.dart';
import 'package:suvandnat/app/controller/brand_list/brand_controller.dart';

class BrandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BrandController());
  }
}
