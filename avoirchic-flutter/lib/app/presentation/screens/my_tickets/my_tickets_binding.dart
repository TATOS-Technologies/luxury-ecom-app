import 'package:avoirchic/app/controller/my_tickets_controller.dart';
import 'package:get/get.dart';

class MyTicketsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTicketsController());
  }
}
