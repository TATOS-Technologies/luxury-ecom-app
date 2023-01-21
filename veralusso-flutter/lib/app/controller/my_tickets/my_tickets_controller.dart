import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:veralusso/app/controller/my_tickets/widget/message_dialog.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/main/main.common.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class MyTicketsController extends GetxController {
  RxInt index = 0.obs;
  final MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  MyTicketsController();

  RxBool isLoading = true.obs;
  RxBool isButtonTap = false.obs;
  RxBool dialogLoading = true.obs;
  TicketMessagesModel ticketMessagesModel = TicketMessagesModel();
  Rx<TicketData> getTicketMessagesData = TicketData().obs;

  RxList<MyTicketList> getTicketList = RxList<MyTicketList>();
  final TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    getMyTicket();
    super.onInit();
  }

  Future<void> getMyTicket() async {
    isLoading.value = true;
    try {
      debugPrint("getStoreDataFromApi -> ");
      await localStore.getUserDetail();
      List<MyTicketList> itemsData = await myTicketAPIRepository.getMyTickets(localStore.userDetail.id.toString());
      if (itemsData.isNotEmpty == true) {
        getTicketList.value = itemsData;
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      isLoading.value = false;
      Validators.appCatchError(error: e);
    }
    messageController.clear();
  }

  Future<void> addMessageToTicket(MyTicketList? myTicketList) async {
    dialogLoading.value = true;
    debugPrint(
      "getStoreDataFromApi -> ${(DateTime.now().millisecondsSinceEpoch / 1000).ceil()}",
    );
    try {
      final data = {
        "website": "www.veralusso.com",
        "ticket_id": myTicketList?.ticketCode,
        "message": messageController.text,
        "action": "send_messsage",
      };
      TicketMessagesModel finalResponse = await myTicketAPIRepository.postMyTicketsResponseProvider(
        data,
      );
      ticketMessagesModel = finalResponse;
      getTicketMessagesData.value = (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
          ? ticketMessagesModel.tickets?.data?.first ?? TicketData()
          : TicketData();
      messageController.clear();
      debugPrint("Response addDataToTicket is:-->>$finalResponse");
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e, st) {
      log('Error addDataToTicket $e && st:-> $st');
      Validators.appCatchError(error: e);
    } finally {
      dialogLoading.value = false;
    }
  }

  Future<void> getTicketMessages(MyTicketList? myTicketList) async {
    dialogLoading.value = true;
    try {
      final data = {
        "website": "www.veralusso.com",
        "email": myTicketList?.email,
        "ticket_id": myTicketList?.ticketCode,
      };
      TicketMessagesModel finalResponse = await myTicketAPIRepository.postMyTicketsResponseProvider(
        data,
      );
      ticketMessagesModel = finalResponse;
      getTicketMessagesData.value = (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
          ? ticketMessagesModel.tickets?.data?.first ?? TicketData()
          : TicketData();
      debugPrint("Response addDataToTicket is:-->>$finalResponse");
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e, st) {
      log('Error addDataToTicket $e && st:-> $st');
      Validators.appCatchError(error: e);
    } finally {
      dialogLoading.value = false;
    }
  }

  void showDialogBoxOpen(MyTicketList ticket) {
    getTicketMessages(ticket);
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return MessageDialog(
          ticket: ticket,
        );
      },
    );
  }
}
