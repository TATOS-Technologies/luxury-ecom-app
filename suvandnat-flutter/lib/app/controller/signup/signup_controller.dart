import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/signup_request_model.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/error_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class SignUpController extends GetxController {
  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  SignUpController();

  RxBool isSignUpApiCall = false.obs;

  TextEditingController firstNameTextController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();

  TextEditingController lastNameTextController = TextEditingController();
  FocusNode lastNameFocusNode = FocusNode();

  TextEditingController emailTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController confirmEmailTextController = TextEditingController();
  FocusNode confirmEmailFocusNode = FocusNode();

  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController confirmPasswordTextController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();

  TextEditingController dobTextController = TextEditingController();
  FocusNode dobFocusNode = FocusNode();

  TextEditingController domTextController = TextEditingController();
  FocusNode domFocusNode = FocusNode();
  bool isValid = false;

  Rx<Color> checkBoxFillColor = const Color(0XFF973133).obs;

  RxBool isChecked = false.obs;
  RxBool isSelected = false.obs;

  RxString selectedStatus = "Mr".obs;

  RxList<String> status = ['Mr', 'Mrs'].obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validation() {
    if (!GetUtils.isEmail(emailTextController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    } else if (!GetUtils.isEmail(confirmEmailTextController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    } else if (emailTextController.value.text !=
        confirmEmailTextController.value.text) {
      errorToast(LanguageConstants.confirmEmailNotMatch.tr);
      return false;
    } else if (passwordTextController.value.text !=
        confirmPasswordTextController.value.text) {
      errorToast(LanguageConstants.confirmpasswordshouldbematchwithpassword.tr);
      return false;
    }
    return true;
  }

  Future<void> signUpUser() async {
    isValid = true;
    update(["SignIn"]);
    if (validation()) {
      if (firstNameTextController.text != "" &&
          lastNameTextController.text != "" &&
          emailTextController.text != "" &&
          confirmEmailTextController.text != "" &&
          passwordTextController.text != "" &&
          confirmPasswordTextController.text != "" &&
          dobTextController.text != "" &&
          domTextController.text != "") {
        try {
          if (isChecked.value) {
            isSignUpApiCall.value = true;
            SignUpRequestModel signUpRequestModel = SignUpRequestModel(
              customer: Customer(
                email: emailTextController.value.text.trim(),
                firstname: firstNameTextController.value.text,
                lastname: lastNameTextController.value.text,
                websiteId: int.tryParse(localStore.websiteId),
                addresses: [],
                dob: dobTextController.value.text,
                extensionAttributes: RequestExtensionAttributes(
                  dom: domTextController.value.text,
                ),
              ),
              password: passwordTextController.value.text.trim(),
            );

            /// SignUp Api Call
            MyAccountDetails? signUpData =
                (await authAPIRepository.signUpWithEmail(signUpRequestModel));
            if (signUpData != null) {
              isSignUpApiCall.value = false;
              Get.offAllNamed(RoutesConstants.dashboardScreen);
            }
          } else {
            Get.snackbar(LanguageConstants.alert.tr,
                LanguageConstants.pleaseAgreeForNewsletter.tr);
          }
        } on ApiException catch (e) {
          Validators.apiExceptionError(e: e);
        } catch (e, StackStrace) {
          log(e.toString(), name: "Error");
          log(StackStrace.toString(), name: "StackStrace");
          Validators.appCatchError(error: e);
        } finally {
          isSignUpApiCall.value = false;
        }
      }
    }
  }
}
