import 'dart:developer';

import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/presentation/screens/my_tickets/widgets/ticket_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/models/my_ticket/add_message_request.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:meta_package/api/services/ticket_service.dart';

import '../main/main.common.dart';
import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class MyTicketsController extends GetxController {
  RxInt index = 0.obs;

  RxBool isLoading = true.obs;
  RxBool dialogLoading = true.obs;
  RxList<MyTicketList> getTicketList = RxList<MyTicketList>();

  final TextEditingController messageController = TextEditingController();
  TicketMessagesModel ticketMessagesModel = TicketMessagesModel();
  Rx<TicketData> getTicketMessagesData = TicketData().obs;

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
      debugPrint("getStoreDataFromApi -> ");
      List<MyTicketList> itemsData = await myTicketAPIRepository
          .getMyTickets(localStore.userDetail.id.toString());
      if (itemsData.isNotEmpty == true) {
        getTicketList.value = itemsData;
      }
      debugPrint("Response $getTicketList");
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    }
    messageController.clear();
  }

  Future<void> addMessageToTicket(MyTicketList? myTicketList) async {
    dialogLoading.value = true;
    try {
      debugPrint(
          "getStoreDataFromApi -> ${(DateTime.now().millisecondsSinceEpoch / 1000).ceil()}");
      try {
        TicketMessagesModel finalResponse = await myTicketAPIRepository
            .postMyTicketsResponseProvider(AddMessageRequest(
                website: "www.avoir-chic.com",
                ticketId: myTicketList?.ticketCode,
                message: messageController.text,
                action: "send_messsage"));
        ticketMessagesModel = finalResponse;
        getTicketMessagesData.value =
            (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
                ? ticketMessagesModel.tickets?.data?.first ?? TicketData()
                : TicketData();
        messageController.clear();
        debugPrint("Response addDataToTicket is:-->>$finalResponse");
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e, st) {
        log('Error addDataToTicket $e && st:-> $st');
        ExceptionHandler.appCatchError(error: e);
      }
      dialogLoading.value = false;
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
      dialogLoading.value = false;
    }
  }

  Future<void> getTicketMessages(MyTicketList? myTicketList) async {
    dialogLoading.value = true;
    try {
      try {
        TicketMessagesModel finalResponse = await myTicketAPIRepository
            .postMyTicketsResponseProvider(AddMessageRequest(
                website: "www.avoir-chic.com",
                email: myTicketList?.email,
                ticketId: myTicketList?.ticketCode));
        ticketMessagesModel = finalResponse;
        getTicketMessagesData.value =
            (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
                ? ticketMessagesModel.tickets?.data?.first ?? TicketData()
                : TicketData();
        debugPrint("Response addDataToTicket is:-->>$finalResponse");
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e, st) {
        log('Error addDataToTicket $e && st:-> $st');
        ExceptionHandler.appCatchError(error: e);
      }
      dialogLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
      dialogLoading.value = false;
    }
  }

  void showDialogBoxOpen(MyTicketList ticket) {
    getTicketMessages(ticket);
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return TicketDialogBox(
          ticket: ticket,
        );
      },
    );
  }
}
