import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';
import '../../../common_widget/common_widget/common_text_phone_field.dart';

class NameTextField extends GetView<ReferFriendController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonTextFieldOpenSans(
        hintText: LanguageConstants.firstNameText.tr,
        controller: controller.yourFirstNameController,
        keyboardType: TextInputType.name,
        borderColor: Colors.black,
        textColor: Colors.black,
        validator: (value) => Validators.validateName(
          value?.trim(),
        ),
      ),
    );
  }
}

class EmailTextField extends GetView<ReferFriendController> {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonTextFieldOpenSans(
        hintText: LanguageConstants.emailAddress.tr,
        controller: controller.yourEmailController,
        keyboardType: TextInputType.emailAddress,
        borderColor: Colors.black,
        textColor: Colors.black,
        validator: (value) => Validators.validateEmail(
          value?.trim(),
        ),
      ),
    );
  }
}

class PhoneTextField extends GetView<ReferFriendController> {
  const PhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonTextPhoneField(
        textController: controller.yourPhoneController,
        textColor: Colors.black,
        cursorColor: Colors.black,
        dropdownTextColor: Colors.black,
        dropdownIconColor: Colors.black,
        borderColor: Colors.transparent,
        fillColor: appTileColor,
        filled: true,
        dropdownTextStyle: AppStyle.textStyleUtils400(),
        fontStyle: AppStyle.textStyleUtils400(),
        hintStyle: AppStyle.textStyleUtils400(),
        hintText: LanguageConstants.phoneNumberText.tr,
        hintColor: Colors.black,
        country: Get.find<CountryController>().country?.value,
        onCountryChanged: (country) {
          controller.countryCode = country.dialCode;
        },
        validator: (value) => Validators.validateMobile(
          value?.number ?? '',
        ),
      ),
    );
  }
}

class FriendFirstNameTextField extends GetView<ReferFriendController> {
  const FriendFirstNameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonTextFieldOpenSans(
        controller: controller.refFirstNameController,
        hintText: (controller.isSubmitButtonPressed &&
                controller.refFirstNameController.value.text == "")
            ? LanguageConstants.enterFriendFirstName.tr
            : LanguageConstants.friendFirstName.tr,
        keyboardType: TextInputType.name,
        borderColor: Colors.transparent,
        textColor: Colors.black,
        validator: (value) => Validators.validateName(
          value?.trim(),
        ),
      ),
    );
  }
}

class FriendEmailTextField extends GetView<ReferFriendController> {
  const FriendEmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonTextFieldOpenSans(
        controller: controller.refEmailController,
        keyboardType: TextInputType.emailAddress,
        hintText: (controller.isSubmitButtonPressed &&
                controller.refEmailController.value.text == "")
            ? LanguageConstants.enterFriendEmailAddress.tr
            : LanguageConstants.friendEmailAddress.tr,
        borderColor: Colors.black,
        textColor: Colors.black,
        validator: (value) => Validators.validateEmail(
          value?.trim(),
        ),
      ),
    );
  }
}

class FriendPhoneTextField extends GetView<ReferFriendController> {
  const FriendPhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonTextPhoneField(
        textController: controller.refPhoneController,
        textColor: Colors.black,
        cursorColor: Colors.black,
        dropdownTextColor: Colors.black,
        dropdownIconColor: Colors.black,
        borderColor: Colors.transparent,
        fillColor: appTileColor,
        filled: true,
        errorBorderColor: Colors.transparent,
        dropdownTextStyle: AppStyle.textStyleUtils400(),
        fontStyle: AppStyle.textStyleUtils400(),
        hintStyle: AppStyle.textStyleUtils400(),
        hintText: LanguageConstants.friendPhoneNumber.tr,
        hintColor: Colors.grey,
        country: Get.find<CountryController>().country?.value,
        onCountryChanged: (country) {
          controller.countryFriendCode = country.dialCode;
        },
        validator: (value) => Validators.validateMobile(
          value?.number ?? '',
        ),
      ),
    );
  }
}
