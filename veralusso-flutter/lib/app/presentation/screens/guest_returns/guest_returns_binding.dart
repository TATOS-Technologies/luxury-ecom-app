import 'package:get/get.dart';
import 'package:veralusso/app/controller/guest_returns/guest_returns_controller.dart';

class GuestReturnsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestReturnsController());
  }
}
