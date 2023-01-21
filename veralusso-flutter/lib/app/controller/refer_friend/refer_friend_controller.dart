// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/error_dialog.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class ReferFriendController extends GetxController {
  String countryCode = '1';
  String countryFriendCode = '1';

  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  TextEditingController refFirstNameController = TextEditingController();
  TextEditingController refEmailController = TextEditingController();
  TextEditingController refPhoneController = TextEditingController();
  TextEditingController yourFirstNameController = TextEditingController();
  TextEditingController yourEmailController = TextEditingController();
  TextEditingController yourPhoneController = TextEditingController();

  ReferFriendController();

  RxBool isSuccessfully = false.obs;
  RxString responseMsg = "".obs;
  bool isValid = false;

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
    isValid = true;
    update(["refer"]);
    if (validation()) {
      try {
        String data = await aboutAPIRepository.getReferFriendAPIResponse(
            refFirstName: refFirstNameController.text,
            refEmail: refEmailController.text,
            refPhone: "+$countryFriendCode${refPhoneController.text}",
            yourFirstName: yourFirstNameController.text,
            yourEmail: yourEmailController.text,
            yourPhone: "+$countryCode${yourPhoneController.text}");
        if (data.isNotEmpty == true) {
          isSuccessfully.value = true;
          responseMsg.value = data;
        }
      } on ApiException catch (e) {
        Validators.apiExceptionError(e: e);
      } catch (e) {
        debugPrint(e.toString());
        Validators.appCatchError(error: e);
      }
    }
  }
}
