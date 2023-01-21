import 'dart:convert';

import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:avoirchic/app/presentation/screens/login/forgot_password_screen.dart';
import 'package:avoirchic/app/presentation/screens/login/forgot_password_worng_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/utils/validator.dart';

class ForgetPasswordMenuController extends GetxController {
  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ForgetPasswordMenuController();

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<bool> forgetPasswordResponseModel = false.obs;
  Rx<bool> isLoading = false.obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  RxBool isValidation = false.obs;

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  Future<void> getForgetPasswordResponse({var email}) async {
    isLoading.value = true;
    try {
      final userData = {
        "email": email,
        "template": "email_reset",
        "websiteId": localStore.websiteId
      };
      final bool data = await authAPIRepository.putForgetPasswordApiResponse(
        forgetPasswordRequestJson: jsonEncode(userData),
      );
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
        Get.to(() => ForgotPasswordWrongEmailScreen());
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
