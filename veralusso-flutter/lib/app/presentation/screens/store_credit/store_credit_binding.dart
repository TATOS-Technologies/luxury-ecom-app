import 'package:get/get.dart';
import 'package:veralusso/app/controller/store_credit/store_credit_controller.dart';

class StoreCreditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreCreditController());
  }
}
