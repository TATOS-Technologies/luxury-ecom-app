// ignore_for_file: invalid_use_of_protected_member
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/error_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class ReferFriendController extends GetxController {
  String countryCode = '1';

  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  TextEditingController refFirstNameController = TextEditingController();
  TextEditingController refEmailController = TextEditingController();
  TextEditingController refPhoneController = TextEditingController();
  TextEditingController yourFirstNameController = TextEditingController();
  TextEditingController yourEmailController = TextEditingController();
  TextEditingController yourPhoneController = TextEditingController();
  bool isValid = false;

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
      isValid = true;
      update(["Refer"]);
      if (validation()) {
        if (refFirstNameController.text != "" &&
            refEmailController.text != "" &&
            refPhoneController.text != "" &&
            yourFirstNameController.text != "" &&
            yourEmailController.text != "" &&
            yourPhoneController.text != "") {
          String data = await aboutAPIRepository.getReferFriendAPIResponse(
              refFirstName: refFirstNameController.text,
              refEmail: refEmailController.text,
              refPhone: "+$countryCode${refPhoneController.text}",
              yourFirstName: yourFirstNameController.text,
              yourEmail: yourEmailController.text,
              yourPhone: "+$countryCode${yourPhoneController.text}");
          String message = data;
          if (message.isNotEmpty) {
            isSuccessfully.value = true;
            responseMsg.value = message;
          }
        }
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }
}
