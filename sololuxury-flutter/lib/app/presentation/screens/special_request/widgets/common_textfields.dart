import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../common_widget/common_widget/common_text_phone_field.dart';

class NameTextField extends GetView<SpecialRequestController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: TextFormFieldWidget(
              controller: controller.nameController,
              hintText: controller.nameController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.firstNameIsRequired.tr
                  : LanguageConstants.firstNameText.tr,
              hintStyle: AppStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }
}

class LastNameField extends GetView<SpecialRequestController> {
  const LastNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return TextFormFieldWidget(
            controller: controller.lastNaneController,
            hintText: controller.lastNaneController.text == "" &&
                    controller.isValidation
                ? LanguageConstants.lastNameIsRequired.tr
                : LanguageConstants.lastNameText.tr,
            hintStyle: const TextStyle(
                fontSize: 14, fontFamily: AppConstants.fontOpenSans),
            validator: (value) => null,
          );
        });
  }
}

class EmailField extends GetView<SpecialRequestController> {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return TextFormFieldWidget(
            controller: controller.emailController,
            hintText:
                controller.emailController.text == "" && controller.isValidation
                    ? LanguageConstants.emailAddressRequired.tr
                    : LanguageConstants.emailText.tr,
            hintStyle: const TextStyle(
                fontSize: 14, fontFamily: AppConstants.fontOpenSans),
            validator: (value) => null,
          );
        });
  }
}

class PhoneNumberField extends GetView<SpecialRequestController> {
  const PhoneNumberField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return CommonTextPhoneField(
              textController: controller.phoneNumberController,
              cursorColor: regularGrey,
              dropdownIconColor: Colors.black,
              country: Get.find<CountryController>().country?.value,
              borderColor: Colors.transparent,
              fillColor: appTileBGcolor,
              filled: true,
              dropdownTextStyle:
                  const TextStyle(color: Colors.black, fontSize: 14),
              fontStyle: const TextStyle(color: Colors.black, fontSize: 14),
              hintStyle: const TextStyle(
                  color: regularGrey,
                  fontSize: 14,
                  fontFamily: AppConstants.fontOpenSans),
              hintText: controller.phoneNumberController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.phoneNumberIsRequired.tr
                  : LanguageConstants.phoneNumberText.tr,
              onCountryChanged: (country) {
                controller.countryCode = country.dialCode;
              },
              validator: (value) {
                return Validators.validateMobile(value.toString());
              });
        });
  }
}

class BrandNameField extends GetView<SpecialRequestController> {
  const BrandNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return TextFormFieldWidget(
            controller: controller.brandNameControlletr,
            hintText: controller.brandNameControlletr.text == "" &&
                    controller.isValidation
                ? LanguageConstants.brandNameIsRequired.tr
                : LanguageConstants.brandText.tr,
            hintStyle: const TextStyle(
                fontSize: 14, fontFamily: AppConstants.fontOpenSans),
            validator: (value) => null,
          );
        });
  }
}

class StyleField extends GetView<SpecialRequestController> {
  const StyleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return TextFormFieldWidget(
            controller: controller.styleController,
            hintText:
                controller.styleController.text == "" && controller.isValidation
                    ? LanguageConstants.styleIsRequired.tr
                    : LanguageConstants.style.tr,
            hintStyle: const TextStyle(
                fontSize: 14, fontFamily: AppConstants.fontOpenSans),
            validator: (value) => null,
          );
        });
  }
}

class KeywordField extends GetView<SpecialRequestController> {
  const KeywordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return TextFormFieldWidget(
            controller: controller.keywordControlle,
            hintText: controller.keywordControlle.text == "" &&
                    controller.isValidation
                ? LanguageConstants.keywordIsRequired.tr
                : LanguageConstants.keyword.tr,
            hintStyle: const TextStyle(
                fontSize: 14, fontFamily: AppConstants.fontOpenSans),
            validator: (value) => null,
          );
        });
  }
}

class ImageUrlField extends GetView<SpecialRequestController> {
  const ImageUrlField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return TextFormFieldWidget(
            controller: controller.imageUrlController,
            hintText: controller.imageUrlController.text == "" &&
                    controller.isValidation
                ? LanguageConstants.imageUrlIsRequired.tr
                : LanguageConstants.imageUrl.tr,
            hintStyle: const TextStyle(
                fontSize: 14, fontFamily: AppConstants.fontOpenSans),
            validator: (value) => null,
          );
        });
  }
}

class RemarkField extends GetView<SpecialRequestController> {
  const RemarkField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return TextFormFieldWidget(
            controller: controller.remarkController,
            hintText: controller.remarkController.text == "" &&
                    controller.isValidation
                ? LanguageConstants.remarkIsRequired.tr
                : LanguageConstants.remarks.tr,
            hintStyle: const TextStyle(
                fontSize: 14, fontFamily: AppConstants.fontOpenSans),
            validator: (value) => null,
          );
        });
  }
}
