import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:veralusso/app/controller/track_your_ticket_mail/widget/ticket_message_dialog.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/main/main.common.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class TrackTicketController extends GetxController {
  RxList<TrackTicketModal> trackTicketList = <TrackTicketModal>[].obs;
  final MyTicketAPIRepository myTicketAPIRepository =
      MyTicketAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  TrackTicketController();

  RxBool dialogLoading = true.obs;
  RxBool isButtonTap = false.obs;
  TicketMessagesModel ticketMessagesModel = TicketMessagesModel();
  Rx<TicketData> getTicketMessagesData = TicketData().obs;

  final TextEditingController messageController = TextEditingController();

  @override
  Future<void> onInit() async {
    trackTicketList.value = Get.arguments is List<TrackTicketModal>
        ? Get.arguments as List<TrackTicketModal>
        : [];
    await localStore.getUserDetail();
    super.onInit();
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
      TicketMessagesModel finalResponse =
          await myTicketAPIRepository.postMyTicketsResponseProvider(
        data,
      );
      ticketMessagesModel = finalResponse;
      getTicketMessagesData.value =
          (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
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
      TicketMessagesModel finalResponse =
          await myTicketAPIRepository.postMyTicketsResponseProvider(
        data,
      );
      ticketMessagesModel = finalResponse;
      getTicketMessagesData.value =
          (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
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
