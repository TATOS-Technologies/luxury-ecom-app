import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/my_ticket/add_message_request.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/my_tickets/widgets/message_dialog.dart';

class MyTicketsController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ExpandableController aboutUsExpandableController = ExpandableController();
  RxBool isLoading = true.obs;
  RxBool dialogLoading = true.obs;
  RxList<MyTicketList> getTicketList = RxList<MyTicketList>();
  final TextEditingController messageController = TextEditingController();
  TicketMessagesModel ticketMessagesModel = TicketMessagesModel();
  Rx<TicketData> getTicketMessagesData = TicketData().obs;
  RxBool isButtonTap = false.obs;

  MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));
  String? countryCode;

  MyTicketsController({this.countryCode});

  @override
  void onInit() {
    getMyTicket();
    super.onInit();
  }

  Future<void> getMyTicket() async {
    isLoading.value = true;
    try {
      List<MyTicketList> itemsData = await myTicketAPIRepository
          .getMyTickets(localStore.userDetail.id.toString());
      if (itemsData.isNotEmpty == true) {
        getTicketList.value = itemsData;
        debugPrint(itemsData[0].myticketsId);
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    messageController.clear();
  }

  Future<void> addMessageToTicket(MyTicketList? myTicketList) async {
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

  Future<void> getTicketMessages(MyTicketList? myTicketList) async {
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

  void showDialogBoxOpen(MyTicketList ticket) {
    getTicketMessages(ticket);
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return MessageDialog(
          ticket: ticket,
        );
      },
    );
  }
}
