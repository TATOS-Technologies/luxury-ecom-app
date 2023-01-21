import 'package:get/get.dart';
import 'package:suvandnat/app/controller/store_credit/store_credit_controller.dart';

class StoreCreditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreCreditController());
  }
}
