import 'dart:developer';

import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';

import '../core/utils/app_routes.dart';
import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailTextController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  TextEditingController passwordTextController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();

  RxBool isLoading = false.obs;
  bool isValidation = false;

  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  LoginController();

  bool validation() {
    if (!GetUtils.isEmail(emailTextController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  Future<void> loginUser() async {
    isValidation = true;
    update(["Login"]);
    if (formKey.currentState?.validate() ?? false) {
      try {
        isLoading.value = true;
        MyAccountDetails? data = await authAPIRepository.loginWithEmail(
            emailTextController.value.text.trim(),
            passwordTextController.value.text.trim());
        if (data != null) {
          log('${data.toJson()}', name: LanguageConstants.success.tr);
          Get.offAllNamed(RoutesConstants.dashboardScreen);
        }
        isLoading.value = false;
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(
            e: e,
            callBack: (String errorMessage) {
              bool val = errorMessage.contains('Username');
              Get.toNamed(RoutesConstants.emailPasswordInvalidScreen,
                  arguments: val);
            });
      } catch (e, stackStrace) {
        log(e.toString(), name: "Error");
        log(stackStrace.toString(), name: "stackStrace");
        ExceptionHandler.appCatchError(error: e);
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> googleLogin() async {
    try {
      isLoading.value = true;
      MyAccountDetails? data = await authAPIRepository.loginWithGoogleSignIn();
      if (data != null) {
        Get.offAllNamed(RoutesConstants.dashboardScreen);
      }
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      debugPrint("ERROR----->>$e && st is:->$st");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> appleLogin() async {
    try {
      isLoading.value = true;
      await authAPIRepository.loginWithAppleSignIn();
      Get.offAllNamed(RoutesConstants.dashboardScreen);
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      debugPrint("ERROR----->>$e && st is:->$st");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      isLoading.value = true;
      await authAPIRepository.loginWithFacebook();
      Get.offAllNamed(RoutesConstants.dashboardScreen);
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      debugPrint("ERROR----->> is:->$e && st:->$st");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> loginWithTwitter() async {
    try {
      isLoading.value = true;
      MyAccountDetails? data = await authAPIRepository.loginWithTwitter();
      if (data != null) {
        Get.offAllNamed(RoutesConstants.dashboardScreen);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      debugPrint("$e");
      ExceptionHandler.appCatchError(error: e);
    }
  }
}
