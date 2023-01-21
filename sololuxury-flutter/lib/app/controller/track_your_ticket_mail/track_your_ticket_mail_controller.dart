import 'dart:developer';

import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:meta_package/meta_package.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/controller/track_your_ticket_mail/track_email_nodatafound_screen.dart';

class TrackYourTicketEmailController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TrackYourTicketEmailController();

  TextEditingController emailController = TextEditingController();
  RxBool isScreenLoading = false.obs;
  bool isSubmitButtonPressed = false;
  TrackTicketEmailAPIRepository trackTicketEmailAPIRepository =
      TrackTicketEmailAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  bool validation() {
    if (!GetUtils.isEmail(emailController.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  void trackYourRequest() async {
    isSubmitButtonPressed = true;
    update(["validation"]);
    try {
      if (emailController.value.text != "" && validation()) {
        isScreenLoading.value = true;
        List<TrackTicketModal> itemsData = await trackTicketEmailAPIRepository
            .getTrackTicketEmailResponse(emailController.text.trim());
        Get.toNamed<dynamic>(RoutesConstants.trackTicketScreen,
            arguments: itemsData);
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(
          e: e,
          callBack: (String errorMsg) {
            Get.to<dynamic>(() => const TrackYourTicketNoDataFound());
          });
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }
}
