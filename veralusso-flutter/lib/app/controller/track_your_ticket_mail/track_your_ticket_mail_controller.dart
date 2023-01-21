import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/track_tickets_email_api_repository.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/error_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';
import 'package:veralusso/app/presentation/screens/track_your_ticket_mail/track_ticket_negativeresponse.dart';

class TrackYourTicketEmailController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TrackYourTicketEmailController();

  TextEditingController emailController = TextEditingController();
  RxBool isScreenLoading = false.obs;
  bool isValid = false;

  TrackTicketEmailAPIRepository trackTicketEmailAPIRepository =
      TrackTicketEmailAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);

      return false;
    }
    return true;
  }

  void trackYourRequest() async {
    isValid = true;
    update(["track"]);
    try {
      if (validation()) {
        if (emailController.value.text != "") {
          isScreenLoading.value = true;
          List<TrackTicketModal> itemsData = await trackTicketEmailAPIRepository
              .getTrackTicketEmailResponse(emailController.text.trim());
          Get.toNamed(RoutesConstants.trackTicketScreen, arguments: itemsData);
        }
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(
          e: e,
          callBack: (String errorMsg) {
            Get.to(() => const TrackYourTicketNoDataFound());
          });
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }
}
