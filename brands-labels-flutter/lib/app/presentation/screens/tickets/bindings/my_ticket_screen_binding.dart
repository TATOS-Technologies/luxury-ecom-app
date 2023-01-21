import 'package:brandslabels/app/controller/my_ticket_screen_controller.dart';
import 'package:get/get.dart';

class MyTicketScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTicketScreenController());
  }
}
