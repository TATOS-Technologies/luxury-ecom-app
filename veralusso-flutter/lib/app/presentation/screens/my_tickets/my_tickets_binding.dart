import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_tickets/my_tickets_controller.dart';

class MyTicketsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTicketsController());
  }
}
