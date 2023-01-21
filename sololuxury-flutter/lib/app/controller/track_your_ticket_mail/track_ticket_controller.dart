import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/my_ticket/add_message_request.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:solo_luxury/all_imports.dart';

import '../../presentation/screens/track_ticket_list/trace_ticket_dialog_box.dart';

class TrackTicketController extends GetxController {
  RxList<TrackTicketModal> trackTicketList = <TrackTicketModal>[].obs;
  RxBool dialogLoading = true.obs;
  TicketMessagesModel ticketMessagesModel = TicketMessagesModel();
  MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));
  final TextEditingController messageController = TextEditingController();
  Rx<TicketData> getTicketMessagesData = TicketData().obs;
  RxBool isButtonTap = false.obs;

  @override
  void onInit() {
    if (Get.arguments is List<TrackTicketModal>) {
      trackTicketList.value = Get.arguments as List<TrackTicketModal>;
    }
    super.onInit();
  }

  Future<void> getTicketMessages(TrackTicketModal? myTicketList) async {
    dialogLoading.value = true;
    try {
      TicketMessagesModel finalResponse = await myTicketAPIRepository
          .postMyTicketsResponseProvider(AddMessageRequest(
              website: "www.sololuxury.com",
              email: myTicketList?.email,
              ticketId: myTicketList?.ticketCode));
      debugPrint('Data === ${finalResponse.toJson()}');
      ticketMessagesModel = finalResponse;
      getTicketMessagesData.value =
          (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
              ? ticketMessagesModel.tickets?.data?.first ?? TicketData()
              : TicketData();

      debugPrint("Response addDataToTicket is:-->>$finalResponse");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      dialogLoading.value = false;
    }
  }

  void showDialogBoxOpen(TrackTicketModal ticket) {
    getTicketMessages(ticket);
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return TraceMessageDialog(
          ticket: ticket,
        );
      },
    );
  }

  Future<void> addMessageToTicket(TrackTicketModal? myTicketList) async {
    dialogLoading.value = true;
    debugPrint(
      "getStoreDataFromApi -> ${(DateTime.now().millisecondsSinceEpoch / 1000).ceil()}",
    );
    try {
      TicketMessagesModel finalResponse =
          await myTicketAPIRepository.postMyTicketsResponseProvider(
        AddMessageRequest(
            website: "www.sololuxury.com",
            ticketId: myTicketList?.ticketCode,
            message: messageController.text,
            action: "send_messsage"),
      );
      ticketMessagesModel = finalResponse;
      getTicketMessagesData.value =
          (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
              ? (ticketMessagesModel.tickets?.data?.first ?? TicketData())
              : TicketData();
      messageController.clear();
      debugPrint("Response addDataToTicket is:-->>$finalResponse");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      dialogLoading.value = false;
    }
  }
}
