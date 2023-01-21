import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/const/constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/error_dialog.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  bool isValid = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  LoginController();

  RxBool isLoading = false.obs;

  bool validation() {
    if (!GetUtils.isEmail(emailTextController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  Future<void> loginUser() async {
    isValid = true;
    update(["Login"]);
    if (validation() && passwordTextController.text != "") {
      try {
        isLoading.value = true;
        MyAccountDetails? data = (await authAPIRepository.loginWithEmail(
            emailTextController.value.text.trim(),
            passwordTextController.value.text.trim()));
        if (data != null) {
          Get.offAllNamed(RoutesConstants.dashboardScreen);
        }
        isLoading.value = false;
      } on ApiException catch (e) {
        Validators.apiExceptionError(
            e: e,
            showAlert: false,
            callBack: (String errorMessage) {
              bool val = errorMessage.contains('Username');
              Get.toNamed(RoutesConstants.emailPasswordInvalidScreen,
                  arguments: val);
            });
      } catch (e, stackStrace) {
        log(e.toString(), name: "Error");
        log(stackStrace.toString(), name: "stackStrace");
        Validators.appCatchError(error: e);
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
      Validators.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("ERROR----->>$e && st is:->$st");
    }
  }

  Future<void> appleLogin() async {
    try {
      isLoading.value = true;
      await authAPIRepository.loginWithAppleSignIn();
      Get.offAllNamed(RoutesConstants.dashboardScreen);
      isLoading.value = false;
    } catch (e, st) {
      Validators.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("ERROR----->>$e && st is:->$st");
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      isLoading.value = true;
      await authAPIRepository.loginWithFacebook();
      Get.offAllNamed(RoutesConstants.dashboardScreen);
      isLoading.value = false;
    } catch (e, st) {
      Validators.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("ERROR----->> is:->$e && st:->$st");
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
      Validators.appCatchError(error: e);
      Validators.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
  }
}
