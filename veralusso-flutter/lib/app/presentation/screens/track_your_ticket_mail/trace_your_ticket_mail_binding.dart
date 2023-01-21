import 'package:get/get.dart';
import 'package:veralusso/app/controller/track_your_ticket_mail/track_your_ticket_mail_controller.dart';

class TrackYourTicketEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackYourTicketEmailController());
  }
}
