import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/error_dialog.dart';

class AffiliateProgramController extends GetxController {
  String countryCode = '1';

  RxString screenTitle = "".obs;

  Rx<Color> backColor = Colors.white.obs;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  RxString selectedValue = "Mr.".obs;

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<FocusNode> focusNode = FocusNode().obs;

  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<FocusNode> lastNameFocusNode = FocusNode().obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<FocusNode> emailFocusNode = FocusNode().obs;

  Rx<TextEditingController> contactNoController = TextEditingController().obs;
  Rx<FocusNode> contactNoFocusNode = FocusNode().obs;

  Rx<TextEditingController> websiteController = TextEditingController().obs;
  Rx<FocusNode> websiteNoFocusNode = FocusNode().obs;

  Rx<TextEditingController> addressOneController = TextEditingController().obs;
  Rx<FocusNode> addressOneFocusNode = FocusNode().obs;

  Rx<TextEditingController> addressTwoController = TextEditingController().obs;
  Rx<FocusNode> addressTwoFocusNode = FocusNode().obs;

  Rx<TextEditingController> postCodeController = TextEditingController().obs;
  Rx<FocusNode> postCodeFocusNode = FocusNode().obs;

  RxString cityValue = LanguageConstants.cityHintText.tr.obs;
  RxString countryValue = LanguageConstants.countryHintText.tr.obs;
  bool isValid = false;

  @override
  void onInit() {
    screenTitle.value = LanguageConstants.affiliateProgramTitleText.tr;
    super.onInit();
  }

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);

      return false;
    }
    return true;
  }

  void onTap() {
    isValid = true;
    update(["affi"]);
    if (validation()) {}
  }
}
