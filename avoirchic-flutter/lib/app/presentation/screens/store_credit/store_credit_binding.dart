import 'package:avoirchic/app/controller/store_credit_controller.dart';
import 'package:get/get.dart';

class StoreCreditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreCreditController());
  }
}
