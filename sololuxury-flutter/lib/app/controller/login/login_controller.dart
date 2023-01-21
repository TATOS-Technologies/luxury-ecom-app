import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:solo_luxury/all_imports.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  RxBool isLoading = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<String> loginResponseModel = "".obs;

  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  LoginController();

  RxBool isValidation = false.obs;

  Future<void> googleLogin() async {
    try {
      isLoading.value = true;
      MyAccountDetails? data = await authAPIRepository.loginWithGoogleSignIn();
      if (data != null) {
        loginResponseModel.value = localStore.customerToken;
        Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
      }
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      debugPrint("ERROR----->>$e && st is:->$st");
    }
  }

  Future<void> appleLogin() async {
    try {
      isLoading.value = true;
      await authAPIRepository.loginWithAppleSignIn();
      loginResponseModel.value = localStore.customerToken;
      Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      debugPrint("ERROR----->>$e && st is:->$st");
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      isLoading.value = true;
      await authAPIRepository.loginWithFacebook();
      loginResponseModel.value = localStore.customerToken;
      Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      debugPrint("ERROR----->> is:->$e && st:->$st");
    }
  }

  Future<void> loginWithTwitter() async {
    try {
      isLoading.value = true;
      MyAccountDetails? data = await authAPIRepository.loginWithTwitter();
      if (data != null) {
        loginResponseModel.value = localStore.customerToken;
        Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
      }
      isLoading.value = false;
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
  }

  Future<void> loginUser() async {
    isValidation.value = true;
    update(["Login"]);
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        MyAccountDetails? data = await authAPIRepository.loginWithEmail(
            emailController.value.text.trim(),
            passwordController.value.text.trim());
        if (data != null) {
          loginResponseModel.value = localStore.customerToken;
          Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
        }
        isLoading.value = false;
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(
            e: e,
            showAlert: false,
            callBack: (String errorMessage) {
              bool val = errorMessage.contains('Username');
              Get.toNamed<dynamic>(RoutesConstants.emailPasswordInvalidScreen,
                  arguments: val);
            });
      } catch (e) {
        log(e.toString(), name: "Error");
        ExceptionHandler.appCatchError(error: e);
      } finally {
        isLoading.value = false;
      }
      log("loginResponseModel : $loginResponseModel");
    }
  }

  void handleLoginError(ApiException e) {
    DioError? error;
    if (e.error is ApiException &&
        (e.error as ApiException).error is DioError) {
      error = (e.error as ApiException).error as DioError;
    } else if (e.error is DioError) {
      error = e.error as DioError;
    }
    if (error?.response != null && error?.response?.data != null) {
      var data = json.decode(error?.response?.data.toString() ?? '');
      bool val = data['message'].toString().contains('Username');
      Get.toNamed<dynamic>(RoutesConstants.emailPasswordInvalidScreen,
          arguments: val);
    } else {
      ExceptionHandler.apiExceptionError(e: e);
    }
  }
}
