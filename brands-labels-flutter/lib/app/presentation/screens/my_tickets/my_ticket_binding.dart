import 'package:brandslabels/app/controller/my_ticket_controller.dart';
import 'package:get/get.dart';

class MyTicketsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTicketsController());
  }
}
