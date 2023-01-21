import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/signup_request_model.dart';
import 'package:veralusso/app/core/const/constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/error_dialog.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class SignUpController extends GetxController {
  SignUpController();

  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  TextEditingController emailTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController confirmEmailTextController = TextEditingController();
  FocusNode confirmEmailFocusNode = FocusNode();

  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController confirmPasswordTextController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();

  TextEditingController fNameTextController = TextEditingController();
  FocusNode fNameFocusNode = FocusNode();

  TextEditingController lNameTextController = TextEditingController();
  FocusNode lNameFocusNode = FocusNode();

  TextEditingController telephoneNoTextController = TextEditingController();
  FocusNode telephoneNoFocusNode = FocusNode();

  TextEditingController dobTextController = TextEditingController();
  FocusNode dobFocusNode = FocusNode();

  TextEditingController domTextController = TextEditingController();
  FocusNode domFocusNode = FocusNode();

  RxString selectedStatus = 'Mr'.obs;
  RxList<String> status = ['Mr', 'Mrs'].obs;

  RxString selectedCountry = 'United Kingdom'.obs;
  RxList<String> country = ['United Kingdom', 'India', 'Australia'].obs;

  RxString selectedValue = 'GDP'.obs;
  RxList<String> value = ['GDP'].obs;

  RxString selectedLanguage = 'English'.obs;
  RxList<String> language = ['English'].obs;

  TextEditingController emailAddressTextController = TextEditingController();
  FocusNode emailAddressFocusNode = FocusNode();

  Rx<Color> checkBoxFillColor = const Color(0XFFC4C4c4).obs;

  RxBool isChecked = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSelected = false.obs;
  bool isValid = false;
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
      errorToast(LanguageConstants.emailNotMatched.tr);
      return false;
    } else if (confirmPasswordTextController.value.text !=
        passwordTextController.value.text) {
      errorToast(LanguageConstants.passwordNotMatched.tr);
      return false;
    }
    return true;
  }

  Future<void> signUpUser() async {
    isValid = true;
    update(["SigUp"]);
    if (validation()) {
      if (emailTextController.value.text != "" &&
          confirmEmailTextController.value.text != "" &&
          passwordTextController.value.text != "" &&
          confirmEmailTextController.value.text != "" &&
          dobTextController.value.text != "") {
        if (isChecked.value && isSelected.value) {
          SignUpRequestModel signUpRequestModel = SignUpRequestModel(
            customer: Customer(
              addresses: [],
              firstname: fNameTextController.value.text,
              lastname: lNameTextController.value.text,
              email: emailTextController.value.text.trim(),
              websiteId: int.tryParse(localStore.websiteId) ?? 102,
              dob: dobTextController.value.text,
              extensionAttributes: RequestExtensionAttributes(
                dom: domTextController.value.text,
              ),
            ),
            password: passwordTextController.value.text.trim(),
          );

          isLoading.value = true;
          try {
            MyAccountDetails? data =
                await authAPIRepository.signUpWithEmail(signUpRequestModel);
            if (data != null) {
              Get.offAllNamed(RoutesConstants.dashboardScreen);
            }
            isLoading.value = false;
          } on ApiException catch (e) {
            Validators.apiExceptionError(e: e);
          } catch (e, StackStrace) {
            isLoading.value = false;
            log(e.toString(), name: "Error");
            log(StackStrace.toString(), name: "StackStrace");
            Validators.appCatchError(error: e);
          } finally {
            isLoading.value = false;
          }
        } else {
          Get.snackbar(LanguageConstants.alert.tr,
              LanguageConstants.pleaseAgreeForNewsletter.tr);
        }
      }
    }
  }
}
