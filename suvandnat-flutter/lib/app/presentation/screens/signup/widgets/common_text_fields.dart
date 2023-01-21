// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suvandnat/app/controller/signup/signup_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class FirstNameTextFormFields extends GetView<SignUpController> {
  const FirstNameTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  padding: const EdgeInsets.all(1),
                  child: DropdownButton<String>(
                    isExpanded: false,
                    style: AppTextStyle.textStyleUtils400(color: Colors.grey),
                    value: controller.selectedStatus.value,
                    iconSize: 15,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: controller.status.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      controller.selectedStatus.value = val!;
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: TextFormField(
                controller: controller.firstNameTextController,
                focusNode: controller.firstNameFocusNode,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: controller.isValid &&
                            controller.firstNameTextController.text == ""
                        ? LanguageConstants.enterFirstName.tr
                        : LanguageConstants.firstNameText.tr,
                    hintStyle:
                        AppTextStyle.textStyleUtils300_12(color: Colors.grey),
                    border: InputBorder.none),
                validator: (value) => null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LastNameTextFormFields extends GetView<SignUpController> {
  const LastNameTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormFieldWidget(
        controller: controller.lastNameTextController,
        focusNode: controller.lastNameFocusNode,
        keyboardType: TextInputType.name,
        hintText:
            controller.isValid && controller.lastNameTextController.text == ""
                ? LanguageConstants.enterLastName.tr
                : LanguageConstants.lastNameText.tr,
        hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
        validator: (value) => null,
      ),
    );
  }
}

class EmailTextFormFields extends GetView<SignUpController> {
  const EmailTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: EmailWidget(
        controller: controller.emailTextController,
        focusNode: controller.emailFocusNode,
        hintText:
            controller.isValid && controller.emailTextController.text == ""
                ? LanguageConstants.enterEmailAddress.tr
                : LanguageConstants.emailAddressText.tr,
        keyboardType: TextInputType.emailAddress,
        hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
        validator: (value) => null,
      ),
    );
  }
}

class ConfirmEmailTextFormFields extends GetView<SignUpController> {
  const ConfirmEmailTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: EmailWidget(
          controller: controller.confirmEmailTextController,
          focusNode: controller.confirmEmailFocusNode,
          hintText: controller.isValid &&
                  controller.confirmEmailTextController.text == ""
              ? LanguageConstants.enterConfirmEmail.tr
              : LanguageConstants.confirmEmailAddressText.tr,
          hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
          validator: (value) => null),
    );
  }
}

class PasswordTextFormFields extends GetView<SignUpController> {
  const PasswordTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PasswordWidget(
        controller: controller.passwordTextController,
        focusNode: controller.passwordFocusNode,
        hintText:
            controller.isValid && controller.passwordTextController.text == ""
                ? LanguageConstants.enterPassword.tr
                : LanguageConstants.passwordText.tr,
        hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
        maxLength: 8,
        validator: (value) => Validators.validatePassword(value),
      ),
    );
  }
}

class ConfirmPasswordTextFormFields extends GetView<SignUpController> {
  const ConfirmPasswordTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PasswordWidget(
          controller: controller.confirmPasswordTextController,
          focusNode: controller.confirmPasswordFocusNode,
          hintText: controller.isValid &&
                  controller.confirmEmailTextController.text == ""
              ? LanguageConstants.enterConfirmPassword.tr
              : LanguageConstants.confirmPasswordText.tr,
          hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
          maxLength: 8,
          validator: (value) => Validators.validateConfirmPassword(
              value, controller.passwordTextController.text)),
    );
  }
}

class DateOfBirthTextFormFields extends GetView<SignUpController> {
  const DateOfBirthTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return SizedBox(
      child: TextFormFieldWidget(
        controller: controller.dobTextController,
        focusNode: controller.dobFocusNode,
        hintText: controller.isValid && controller.dobTextController.text == ""
            ? LanguageConstants.enterDateOfBirth.tr
            : LanguageConstants.dateOfBirthText.tr,
        hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
        onTap: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          controller.dobTextController.text =
              DateFormat.yMMMd().format(selectedDate);

          if (pickedDate != null && pickedDate != selectedDate) {
            debugPrint('hello $pickedDate');
            selectedDate = pickedDate;
          }
        },
        validator: (value) {
          debugPrint('date:: ${selectedDate.toString()}');
          return null;
        },
        // suffixIcon: Image.asset("assets/images/calendar.png", cacheHeight: 16),
      ),
    );
  }
}

class MarriageAnniversaryTextFormFields extends GetView<SignUpController> {
  const MarriageAnniversaryTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return SizedBox(
      child: TextFormFieldWidget(
        controller: controller.domTextController,
        focusNode: controller.domFocusNode,
        keyboardType: TextInputType.name,
        hintText: controller.isValid && controller.domTextController.text == ""
            ? LanguageConstants.enterDateOfMarriage.tr
            : LanguageConstants.marriageAnniversaryText.tr,
        hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
        onTap: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          controller.domTextController.text =
              DateFormat.yMMMd().format(selectedDate);

          if (pickedDate != null && pickedDate != selectedDate) {
            debugPrint('hello $pickedDate');
            selectedDate = pickedDate;
          }
        },
        validator: (value) {
          return null;
        },
      ),
    );
  }
}

class Agreement extends GetView<SignUpController> {
  const Agreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(children: [
        Row(
          children: [
            Checkbox(
                activeColor: controller.checkBoxFillColor.value,
                value: controller.isChecked.value,
                onChanged: (value) {
                  controller.isChecked.value = !controller.isChecked.value;
                }),
            Expanded(
              child: HeadlineBodyOneBaseWidget(
                title: LanguageConstants.marketingPurposeText.tr,
                fontSize: 13,
                titleColor: blackColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Checkbox(
                activeColor: controller.checkBoxFillColor.value,
                checkColor: whiteColor,
                value: controller.isSelected.value,
                onChanged: (value) {
                  controller.isSelected.value = !controller.isSelected.value;
                }),
            Expanded(
              child: HeadlineBodyOneBaseWidget(
                title: LanguageConstants.marketingPurposeText.tr,
                fontSize: 13,
                titleColor: blackColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ]),
    );
  }
}
