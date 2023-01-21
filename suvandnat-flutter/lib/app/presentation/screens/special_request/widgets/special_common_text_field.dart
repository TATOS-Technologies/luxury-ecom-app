import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_phone_field.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../../../controller/special_request/special_request_controller.dart';
import '../../../common_widget/input_text_field_widget.dart';


class NameTextField extends GetView<SpecialRequestController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              controller: controller.nameController,
              hintText: controller.nameController.text == "" &&
                  controller.isValidation
                  ? LanguageConstants.firstNameIsRequired.tr
                  : LanguageConstants.firstNameText.tr,
              hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
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
          return SizedBox(
            child: TextFormFieldWidget(
              controller: controller.lastNameController,
              hintText: controller.lastNameController.text == "" &&
                  controller.isValidation
                  ? LanguageConstants.lastNameIsRequired.tr
                  : LanguageConstants.lastNameText.tr,
              hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
              validator: (value) => null,
            ),
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
          return SizedBox(
            child: TextFormFieldWidget(
              controller: controller.emailController,
              hintText: controller.emailController.text == "" &&
                  controller.isValidation
                  ? LanguageConstants.emailAddressRequired.tr
                  : LanguageConstants.emailAddressText.tr,
              hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
              validator: (value) => null,
            ),
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
          return SizedBox(
            child: CommonTextPhoneField(
              filled: true,
              fillColor: whiteColor,
              textController: controller.phoneNumberController,
              cursorColor: regularGrey,
              country: Get.find<CountryController>().country.value,
              dropdownIconColor: Colors.black,
              dropdownTextStyle: AppTextStyle.textStyleUtils400_12(),
              fontStyle: AppTextStyle.textStyleUtils400_12(),
              hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
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
  const BrandNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              controller: controller.brandNameController,
              hintText: controller.brandNameController.text == "" &&
                  controller.isValidation
                  ? LanguageConstants.brandNameIsRequired.tr
                  : LanguageConstants.brandText.tr,
              hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
              validator: (value) => null,
            ),
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
          return SizedBox(
            child: TextFormFieldWidget(
              controller: controller.styleController,
              hintText: controller.styleController.text == "" &&
                  controller.isValidation
                  ? LanguageConstants.styleIsRequired.tr
                  : LanguageConstants.style.tr,
              hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
              validator: (value) => null,
            ),
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
          return SizedBox(
            child: TextFormFieldWidget(
              controller: controller.keywordController,
              hintText: controller.keywordController.text == "" &&
                  controller.isValidation
                  ? LanguageConstants.keywordIsRequired.tr
                  : LanguageConstants.keyword.tr,
              hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
              validator: (value) => null,
            ),
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
          return SizedBox(
            child: TextFormFieldWidget(
              controller: controller.imageUrlController,
              hintText: controller.imageUrlController.text == "" &&
                  controller.isValidation
                  ? LanguageConstants.imageUrlIsRequired.tr
                  : LanguageConstants.imageURL.tr,
              hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
              validator: (value) => null,
            ),
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
          return SizedBox(
            child: TextFormFieldWidget(
              controller: controller.remarkController,
              hintText: controller.remarkController.text == "" &&
                  controller.isValidation
                  ? LanguageConstants.remarkIsRequired.tr
                  : LanguageConstants.remark.tr,
              hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
              validator: (value) => null,
            ),
          );
        });
  }
}

class SubmitAccountButton extends GetView<SpecialRequestController> {
  const SubmitAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: 327.w,
      child: ElevatedButton(
        onPressed: () {
          controller.contactUsPost(
            context,
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appColorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: CommonTextPoppins(
          LanguageConstants.submitText.tr,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
