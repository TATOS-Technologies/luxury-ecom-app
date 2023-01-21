import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/error_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class LoginController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isValid = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoginApiCall = false.obs;

  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  LoginController();

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  Future<void> loginUser({required BuildContext context}) async {
    isValid = true;
    update(["Login"]);
    if (validation() && passwordController.text != "") {
      try {
        isLoginApiCall.value = true;
        MyAccountDetails? data = (await authAPIRepository.loginWithEmail(
            emailController.value.text.trim(),
            passwordController.value.text.trim()));
        log(data.toString(), name: "Token");
        if (data != null) {
          isLoginApiCall.value = false;
          Get.offAllNamed(RoutesConstants.dashboardScreen);
        }
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
        isLoginApiCall.value = false;
      }
    }
  }

  Future<void> googleLogin() async {
    try {
      isLoginApiCall.value = true;
      MyAccountDetails? data = await authAPIRepository.loginWithGoogleSignIn();
      if (data != null) {
        Get.offAllNamed(RoutesConstants.dashboardScreen);
      }
      isLoginApiCall.value = false;
    } catch (e, st) {
      isLoginApiCall.value = false;
      debugPrint("ERROR----->>$e && st is:->$st");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> appleLogin() async {
    try {
      isLoginApiCall.value = true;
      await authAPIRepository.loginWithAppleSignIn();
      Get.offAllNamed(RoutesConstants.dashboardScreen);
      isLoginApiCall.value = false;
    } catch (e, st) {
      isLoginApiCall.value = false;
      debugPrint("ERROR----->>$e && st is:->$st");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      isLoginApiCall.value = true;
      await authAPIRepository.loginWithFacebook();
      Get.offAllNamed(RoutesConstants.dashboardScreen);
      isLoginApiCall.value = false;
    } catch (e, st) {
      isLoginApiCall.value = false;
      debugPrint("ERROR----->> is:->$e && st:->$st");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> loginWithTwitter() async {
    try {
      isLoginApiCall.value = true;
      MyAccountDetails? data = await authAPIRepository.loginWithTwitter();
      if (data != null) {
        Get.offAllNamed(RoutesConstants.dashboardScreen);
      }
      isLoginApiCall.value = false;
    } catch (e) {
      isLoginApiCall.value = false;
      debugPrint("$e");
      Validators.appCatchError(error: e);
    }
  }
}
