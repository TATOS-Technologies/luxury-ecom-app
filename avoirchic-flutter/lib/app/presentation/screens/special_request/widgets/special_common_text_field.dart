import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/country_controller.dart';
import '../../../../controller/special_request_controller.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';
import '../../../common_widgets/common_text_phone_field.dart';
import '../../../common_widgets/common_widget/common_text_opensans.dart';
import '../../../common_widgets/input_text_field_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameTextField extends GetView<SpecialRequestController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return TextFormFieldWidget(
            controller: controller.nameController,
            hintText:
                controller.nameController.text == "" && controller.isValidation
                    ? LanguageConstants.firstNameIsRequired.tr
                    : LanguageConstants.firstNameText.tr,
            hintStyle: AppTextStyle.textStyleUtils400(),
            validator: (value) => null,
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
              controller: controller.lastNaneController,
              hintText: controller.lastNaneController.text == "" &&
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
              hintStyle: AppTextStyle.textStyleUtils400(),
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
              textController: controller.phoneNumberController,
              cursorColor: regularGrey,
              country: Get.find<CountryController>().country?.value,
              dropdownIconColor: greyC8C8C8,
              borderColor: greyC8C8C8,
              focusedColor: greyC8C8C8,
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
  const BrandNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              controller: controller.brandNameControlletr,
              hintText: controller.brandNameControlletr.text == "" &&
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
              hintStyle: AppTextStyle.textStyleUtils400(),
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
              controller: controller.keywordControlle,
              hintText: controller.keywordControlle.text == "" &&
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
              hintStyle: AppTextStyle.textStyleUtils400(),
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
              hintStyle: AppTextStyle.textStyleUtils400(),
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
      height: 45.w,
      width: 327.w,
      child: ElevatedButton(
        onPressed: () {
          controller.contactUsPost(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: CommonTextOpenSans(
          LanguageConstants.submitText.tr,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
