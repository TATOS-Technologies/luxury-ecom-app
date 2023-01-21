import 'package:get/get.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';

class TrackTicketController extends GetxController {
  RxList<TrackTicketModal> trackTicketList = <TrackTicketModal>[].obs;

  @override
  void onInit() {
    trackTicketList.value = Get.arguments is List<TrackTicketModal>
        ? Get.arguments as List<TrackTicketModal>
        : [];
    super.onInit();
  }
}
