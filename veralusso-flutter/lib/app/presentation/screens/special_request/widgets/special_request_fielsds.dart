import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/controller/special_request/special_request_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/common_text_phone_field.dart';
import 'package:veralusso/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:veralusso/app/theme/theme_exports.dart';

class NameTextField extends GetView<SpecialRequestController> {
  NameTextField({Key? key}) : super(key: key);

  @override
  final SpecialRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            height: 40,
            child: TextFormFieldWidget(
              controller: controller.nameController,
              hintText: controller.nameController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.firstNameIsRequired.tr
                  : LanguageConstants.firstNameText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }
}

class LastNameField extends GetView<SpecialRequestController> {
  LastNameField({Key? key}) : super(key: key);
  @override
  final SpecialRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            height: 40,
            child: TextFormFieldWidget(
              controller: controller.lastNameController,
              hintText: controller.lastNameController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.lastNameIsRequired.tr
                  : LanguageConstants.lastNameText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }
}

class EmailField extends GetView<SpecialRequestController> {
  EmailField({Key? key}) : super(key: key);

  @override
  final SpecialRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            height: 40,
            child: TextFormFieldWidget(
              controller: controller.emailController,
              hintText: controller.emailController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.emailAddressRequired.tr
                  : LanguageConstants.emailAddressText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }
}

class PhoneNumberField extends GetView<SpecialRequestController> {
  PhoneNumberField({Key? key}) : super(key: key);

  @override
  final SpecialRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            height: 40,
            child: CommonTextPhoneField(
              textController: controller.phoneNumberController,
              cursorColor: regularGrey,
              country: Get.find<CountryController>().country?.value,
              dropdownIconColor: Colors.black,
              borderColor: blackColor,
              focusedColor: blackColor,
              dropdownTextStyle: AppTextStyle.textStyleUtils400(),
              fontStyle: AppTextStyle.textStyleUtils400(),
              hintStyle: AppTextStyle.textStyleUtils400(color: regularGrey),
              hintText: controller.phoneNumberController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.phoneNumberIsRequired.tr
                  : LanguageConstants.phoneNumberText.tr,
              onCountryChanged: (country) {
                controller.countryCode = country.dialCode;
              },
            ),
          );
        });
  }
}

class BrandNameField extends GetView<SpecialRequestController> {
  BrandNameField({Key? key}) : super(key: key);

  @override
  final SpecialRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            height: 40,
            child: TextFormFieldWidget(
              controller: controller.brandNameController,
              hintText: controller.brandNameController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.brandNameIsRequired.tr
                  : LanguageConstants.brandText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }
}

class StyleField extends GetView<SpecialRequestController> {
  StyleField({Key? key}) : super(key: key);
  @override
  final SpecialRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            height: 40,
            child: TextFormFieldWidget(
              controller: controller.styleController,
              hintText: controller.styleController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.styleIsRequired.tr
                  : LanguageConstants.style.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }
}

class KeywordField extends GetView<SpecialRequestController> {
  @override
  final SpecialRequestController controller = Get.find();

  KeywordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            height: 40,
            child: TextFormFieldWidget(
              controller: controller.keywordController,
              hintText: controller.keywordController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.keywordIsRequired.tr
                  : LanguageConstants.keyword.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }
}

class ImageUrlField extends GetView<SpecialRequestController> {
  @override
  final SpecialRequestController controller = Get.find();

  ImageUrlField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            height: 40,
            child: TextFormFieldWidget(
              controller: controller.imageUrlController,
              hintText: controller.imageUrlController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.imageUrlIsRequired.tr
                  : LanguageConstants.imageURL.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }
}

class RemarkField extends GetView<SpecialRequestController> {
  @override
  final SpecialRequestController controller = Get.find();

  RemarkField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            height: 40,
            child: TextFormFieldWidget(
              controller: controller.remarkController,
              hintText: controller.remarkController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.remarkIsRequired.tr
                  : LanguageConstants.remark.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }
}
