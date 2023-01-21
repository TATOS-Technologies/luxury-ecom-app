import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/presentation/common_widgets/expandable_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';

class LoginController extends GetxController {
  Color backGroundColor = Colors.white;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isValid = false;

  ExpandableController aboutUsExpandableController = ExpandableController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String loginResponseModel = "";

  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  LoginController();

  RxBool isLoading = false.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> loginUser() async {
    isValid = true;
    update(["LogIn"]);
    if (formKey.currentState?.validate() ?? false) {
      try {
        isLoading.value = true;
        MyAccountDetails? data = (await authAPIRepository.loginWithEmail(
            emailController.value.text.trim(),
            passwordController.value.text.trim()));
        if (data != null) {
          Get.offAllNamed(RoutesConstants.dashboardScreen);
        }
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(
            e: e,
            callBack: (String errorMessage) {
              bool val = errorMessage.contains('Username');
              Get.toNamed(RoutesConstants.emailPasswordInvalidScreen,
                  arguments: val);
            });
      } catch (e) {
        log(e.toString(), name: "Error");
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
