import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_methods.dart';
import 'package:avoirchic/app/presentation/screens/track_your_ticket_mail/track_your_ticket_notfound_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/track_tickets_email_api_repository.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class TrackYourTicketEmailController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TrackYourTicketEmailController();

  TextEditingController emailController = TextEditingController();
  RxBool isScreenLoading = false.obs;
  bool isValidation = false;

  TrackTicketEmailAPIRepository trackTicketEmailAPIRepository =
      TrackTicketEmailAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  void trackYourRequest() async {
    isValidation = true;
    update(["Login"]);
    try {
      if (validation()) {
        if (emailController.text != "") {
          isScreenLoading.value = true;

          List<TrackTicketModal> itemsData = await trackTicketEmailAPIRepository
              .getTrackTicketEmailResponse(emailController.text.trim());
          if (itemsData.isNotEmpty == true) {
            Get.toNamed(RoutesConstants.trackTicketScreen,
                arguments: [itemsData]);
          }
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(
          e: e,
          callBack: (String errorMsg) {
            Get.to(() => const TrackYourTicketNoDataFound());
          });
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }
}
