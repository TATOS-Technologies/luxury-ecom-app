import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AffiliateProgramController extends GetxController {
  String countryCode = '1';

  RxString screenTitle = "".obs;

  Rx<Color> backColor = const Color(0XFFF9EAE3).obs;

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
  bool isValidation = false;

  RxString selectedVisitorValue = LanguageConstants.visitorMonthHintText.tr.obs;
  RxString selectedViewsValue = LanguageConstants.viewsMonthHintText.tr.obs;
  RxString cityValue = LanguageConstants.cityHintText.tr.obs;
  RxString countryValue = LanguageConstants.countryHintText.tr.obs;
  RxString bgImage = "assets/images/avoirchick_background.png".obs;

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
    isValidation = true;
    update(["Affi"]);
    if (validation()) {}
  }
}
