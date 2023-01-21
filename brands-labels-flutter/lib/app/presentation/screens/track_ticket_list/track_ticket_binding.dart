import 'package:brandslabels/app/controller/track_ticket_controller.dart';
import 'package:get/get.dart';

class TrackTicketListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackTicketController());
  }
}
