import 'package:brandslabels/app/controller/guest_returns_controller.dart';
import 'package:get/get.dart';

class GuestReturnsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestReturnsController());
  }
}
