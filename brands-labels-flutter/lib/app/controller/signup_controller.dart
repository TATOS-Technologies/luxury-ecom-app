import 'dart:convert';
import 'dart:developer';

import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/signup_request_model.dart';
import 'package:meta_package/api/models/signup_response_model.dart';

import '../core/utils/app_routes.dart';

class SignUpController extends GetxController {
  Rx<Color> backgroundColor = whiteColor.obs;

  Rx<Color> borderColor = blackColor.obs;

  Rx<Color> textHintColor = hintGrey.obs;

  Rx<Color> buttonColor = borderBlue.obs;
  Rx<String> loginResponseModel = "".obs;

  Rx<Color> textFieldBorderColor = borderGrey.obs;

  TextEditingController nameTextController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();

  TextEditingController surNameTextController = TextEditingController();
  FocusNode surNameFocusNode = FocusNode();
  RxBool check1 = false.obs;
  TextEditingController dateOfBirthTextController = TextEditingController();
  FocusNode dateOfBirthFocusNode = FocusNode();
  // TextEditingController marriageTextController = TextEditingController();
  // FocusNode marriageFocusNode = FocusNode();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController confirmEmailTextController = TextEditingController();
  FocusNode confirmEmailFocusNode = FocusNode();
  TextEditingController confirmPasswordTextController = TextEditingController();

  FocusNode describeFocusNode = FocusNode();

  FocusNode confirmPasswordFocusNode = FocusNode();

  RxString selectedStatus = "Mr".obs;

  RxList<String> status = ['Mr', 'Mrs'].obs;

  RxString selectedCountry = 'Australia'.obs;

  RxList<String> country = ['Australia', 'India'].obs;

  RxString selectedEnquiry = 'brands'.obs;

  RxList<String> enquiry = ['brands', '---'].obs;

  RxBool isSelected = false.obs;
  RxBool isChecked = false.obs;

  Rx<Color> checkBoxFillColor = const Color(0XFFC4C4c4).obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSubmitButtonPressed = false;
  Rx<SignUpResponseModel> signUpResponseModel = SignUpResponseModel().obs;
  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  SignUpController();

  Future<void> signUpUser() async {
    debugPrint(
        "empty -> ${nameTextController.value.text.trim()}${passwordTextController.value.text.trim()} ${dateOfBirthTextController.value.text} ");
    isSubmitButtonPressed = true;
    update(["signUp"]);
    if ((formKey.currentState?.validate() ?? false)) {
      if (isChecked.value && isSelected.value) {
        try {
          SignUpRequestModel signUpRequest = SignUpRequestModel(
            customer: Customer(
              addresses: [],
              firstname: nameTextController.value.text,
              lastname: surNameTextController.value.text,
              email: emailTextController.value.text.trim(),
              websiteId: int.tryParse(localStore.websiteId) ?? 102,
              dob: dateOfBirthTextController.value.text,
              // extensionAttributes: RequestExtensionAttributes(
              //   dom: marriageTextController.value.text,
              // ),
            ),
            password: passwordTextController.value.text.trim(),
          );
          MyAccountDetails? data =
              await authAPIRepository.signUpWithEmail(signUpRequest);
          if (data != null) {
            Get.offAllNamed(RoutesConstants.dashboardScreen);
          }
          log("signUpResponseModel : ${json.encode(signUpResponseModel.value.toJson())}");
        } on ApiException catch (e) {
          ExceptionHandler.apiExceptionError(e: e);
        } catch (e) {
          debugPrint(e.toString());
          ExceptionHandler.appCatchError(error: e);
        } finally {}
      } else {
        Get.snackbar(LanguageConstants.alert.tr,
            LanguageConstants.pleaseAgreeForNewsletter.tr);
      }
    }
  }
}
