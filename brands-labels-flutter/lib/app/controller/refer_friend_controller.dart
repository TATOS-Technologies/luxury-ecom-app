import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';

class ReferFriendController extends GetxController {
  String countryCode = '1';
  String countryFriendCode = '1';
  RxString phoneErrorMsg = "".obs;

  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  TextEditingController refFirstNameController = TextEditingController();
  TextEditingController refEmailController = TextEditingController();
  TextEditingController refPhoneController = TextEditingController();
  TextEditingController yourFirstNameController = TextEditingController();
  TextEditingController yourEmailController = TextEditingController();
  TextEditingController yourPhoneController = TextEditingController();
  bool isValidation = false;

  ReferFriendController();

  RxBool isSuccessfully = false.obs;
  RxString responseMsg = "".obs;

  bool validation() {
    if (!GetUtils.isEmail(yourEmailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    } else if (!GetUtils.isEmail(refEmailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  Future<void> postData() async {
    try {
      isValidation = true;
      update(["Refer"]);
      if (validation()) {
        if (yourFirstNameController.value.text != "" &&
            yourEmailController.value.text != "" &&
            yourPhoneController.value.text != "" &&
            refEmailController.value.text != "" &&
            refPhoneController.value.text != "" &&
            refFirstNameController.value.text != "") {
          String data = await aboutAPIRepository.getReferFriendAPIResponse(
            refFirstName: refFirstNameController.text,
            refEmail: refEmailController.text,
            refPhone: "+$countryFriendCode${refPhoneController.text}",
            yourFirstName: yourFirstNameController.text,
            yourEmail: yourEmailController.text,
            yourPhone: "+$countryCode${yourPhoneController.text}",
          );
          debugPrint("message---> $data");
          if (data.isNotEmpty) {
            String message = data;
            debugPrint("message---> $message");
            isSuccessfully.value = true;
            responseMsg.value = message;
          }
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }
}
