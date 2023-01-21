import 'package:brandslabels/app/controller/brand_controller.dart';
import 'package:get/get.dart';

class BrandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BrandController());
  }
}
