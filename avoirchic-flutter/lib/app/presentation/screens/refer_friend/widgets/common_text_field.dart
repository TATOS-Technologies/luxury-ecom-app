import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../controller/country_controller.dart';
import '../../../../controller/refer_friend_controller.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';
import '../../../common_widgets/common_text_phone_field.dart';
import '../../../common_widgets/common_widget/common_button.dart';
import '../../../common_widgets/common_widget/common_text_field.dart';
import '../../../common_widgets/common_widget/common_text_poppins.dart';
import '../../../common_widgets/common_widget/common_theme_button.dart';

class NameTextField extends GetView<ReferFriendController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      height: 35.h,
      hintText: controller.isValidation &&
              controller.yourFirstNameController.text == ""
          ? LanguageConstants.enterFirstName.tr
          : LanguageConstants.firstNameText.tr,
      controller: controller.yourFirstNameController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      validator: (value) {
        return null;
      },
    );
  }
}

class EmailTextField extends GetView<ReferFriendController> {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      height: 35.h,
      hintText:
          controller.isValidation && controller.yourEmailController.text == ""
              ? LanguageConstants.enterEmailAddress.tr
              : LanguageConstants.emailAddress.tr,
      controller: controller.yourEmailController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class PhoneTextField extends GetView<ReferFriendController> {
  const PhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: CommonTextPhoneField(
        textController: controller.yourPhoneController,
        country: Get.find<CountryController>().country?.value,
        cursorColor: blackColor,
        dropdownIconColor: borderGrey,
        borderColor: borderGrey,
        focusedColor: borderGrey,
        errorBorderColor: borderGrey,
        dropdownTextStyle: AppTextStyle.textStyleUtils400(),
        fontStyle: AppTextStyle.textStyleUtils400(),
        hintStyle: AppTextStyle.textStyleUtils300(color: grey636363),
        hintText:
            controller.isValidation && controller.yourPhoneController.text == ""
                ? LanguageConstants.enterPhoneNumber.tr
                : LanguageConstants.phoneNumberText.tr,
        onCountryChanged: (country) {
          controller.countryCode = country.dialCode;
        },
      ),
    );
  }
}

class FriendFirstNameTextField extends GetView<ReferFriendController> {
  const FriendFirstNameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      height: 35.h,
      controller: controller.refFirstNameController,
      hintText: controller.isValidation &&
              controller.refFirstNameController.text == ""
          ? LanguageConstants.enterFriendFirstName.tr
          : LanguageConstants.friendFirstName.tr,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
    );
  }
}

class FriendEmailTextField extends GetView<ReferFriendController> {
  const FriendEmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      height: 35.h,
      controller: controller.refEmailController,
      keyboardType: TextInputType.emailAddress,
      hintText:
          controller.isValidation && controller.refEmailController.text == ""
              ? LanguageConstants.enterFriendEmailAddress.tr
              : LanguageConstants.friendEmailAddress.tr,
      textAlign: TextAlign.start,
    );
  }
}

class FriendPhoneTextField extends GetView<ReferFriendController> {
  const FriendPhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: CommonTextPhoneField(
        textController: controller.refPhoneController,
        country: Get.find<CountryController>().country?.value,
        cursorColor: blackColor,
        dropdownIconColor: borderGrey,
        borderColor: borderGrey,
        focusedColor: borderGrey,
        errorBorderColor: borderGrey,
        dropdownTextStyle: AppTextStyle.textStyleUtils400(),
        fontStyle: AppTextStyle.textStyleUtils400(),
        hintStyle: AppTextStyle.textStyleUtils300(color: grey636363),
        hintText:
            controller.isValidation && controller.refPhoneController.text == ""
                ? LanguageConstants.enterFriendPhoneNumber.tr
                : LanguageConstants.friendPhoneNumber.tr,
        onCountryChanged: (country) {
          controller.countryCode = country.dialCode;
        },
      ),
    );
  }
}

class RegisterButton extends GetView<ReferFriendController> {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260.w,
      height: 35.w,
      child: CommonThemeButton(
          onTap: () {
            controller.postData();
          },
          title: LanguageConstants.registerText.tr),
    );
  }
}

class Successfully extends GetView<ReferFriendController> {
  const Successfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextPoppins(
                controller.responseMsg.value,
                textAlign: TextAlign.center,
                fontSize: 14.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CommonButton(
                color: appBorderColor,
                buttonType: ButtonType.ElevatedButton,
                onPressed: () {
                  FocusScope.of(Get.context!).requestFocus(FocusNode());
                  Get.offAndToNamed(RoutesConstants.dashboardScreen);
                },
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 15.0),
                child: CommonTextPoppins(
                  LanguageConstants.continueShopping.tr,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              )
            ],
          ),
        ));
  }
}
