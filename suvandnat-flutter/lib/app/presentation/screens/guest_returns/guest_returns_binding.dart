import 'package:get/get.dart';
import 'package:suvandnat/app/controller/guest_returns/guest_returns_controller.dart';

class GuestReturnsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestReturnsController());
  }
}
