import 'package:avoirchic/app/controller/track_your_ticket_mail_controller.dart';
import 'package:get/get.dart';

class TrackYourTicketEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackYourTicketEmailController());
  }
}
