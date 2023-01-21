import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/error_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';
import 'package:veralusso/app/presentation/screens/login/forgot_password_design.dart';
import 'package:veralusso/app/presentation/screens/login/forgot_password_wrong_email_screen.dart';

class ForgetPasswordMenuController extends GetxController {
  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ForgetPasswordMenuController();

  Rx<bool> forgetPasswordResponseModel = false.obs;
  TextEditingController emailController = TextEditingController();
  RxBool isValidation = false.obs;
  Rx<bool> isLoading = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);

      return false;
    }
    return true;
  }

  Future<void> getForgetPasswordResponse({required String email}) async {
    isLoading.value = true;
    try {
      final userData = {
        "email": email,
        "template": "email_reset",
        "websiteId": localStore.websiteId
      };
      final bool data = (await authAPIRepository.putForgetPasswordApiResponse(
          forgetPasswordRequestJson: jsonEncode(userData)));
      isLoading.value = false;
      Get.to(() => const ForgetPasswordMenuScreen());
      forgetPasswordResponseModel.value = data;
      if (forgetPasswordResponseModel.value) {
        Validators.apiResponseMessage(
          body: data.toString(),
          message: LanguageConstants
              .forgotPasswordRequestSendedOnYourMailPleaseCheck.tr,
        );
      } else {
        Get.to(() => ForgetPasswordWrongEmailScreen());
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      Validators.appCatchError(error: e);
    }
  }
}
