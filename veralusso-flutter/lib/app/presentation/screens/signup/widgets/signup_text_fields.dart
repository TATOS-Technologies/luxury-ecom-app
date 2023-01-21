import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:veralusso/app/controller/signup/signup_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';
import 'package:veralusso/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:veralusso/app/theme/theme_exports.dart';

class EmailTextFormFields extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  EmailTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmailWidget(
        controller: controller.emailTextController,
        focusNode: controller.emailFocusNode,
        hintText:
            controller.isValid && controller.emailTextController.text == ""
                ? LanguageConstants.enterEmailAddress.tr
                : LanguageConstants.emailText.tr,
        keyboardType: TextInputType.emailAddress,
        hintStyle: AppTextStyle.textStyleUtils400(),
        validator: (value) => null);
  }
}

class ConfirmEmailTextFormFields extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  ConfirmEmailTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
        controller: controller.confirmEmailTextController,
        focusNode: controller.confirmEmailFocusNode,
        hintText: controller.isValid &&
                controller.confirmEmailTextController.text == ""
            ? LanguageConstants.enterConfirmEmailAddress.tr
            : LanguageConstants.confirmEmailText.tr,
        hintStyle: AppTextStyle.textStyleUtils400(),
        validator: (value) => null);
  }
}

class PasswordTextFormFields extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  PasswordTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PasswordWidget(
        controller: controller.passwordTextController,
        focusNode: controller.passwordFocusNode,
        hintText:
            controller.isValid && controller.passwordTextController.text == ""
                ? LanguageConstants.enterPassword.tr
                : LanguageConstants.passwordText.tr,
        hintStyle: AppTextStyle.textStyleUtils400(),
        maxLength: 8,
        validator: (value) => Validators.validatePassword(value.toString()));
  }
}

class ConfirmPasswordTextFormFields extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  ConfirmPasswordTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PasswordWidget(
        controller: controller.confirmPasswordTextController,
        focusNode: controller.confirmPasswordFocusNode,
        hintText: controller.isValid &&
                controller.confirmEmailTextController.text == ""
            ? LanguageConstants.enterConfirmPassword.tr
            : LanguageConstants.confirmPasswordText.tr,
        hintStyle: AppTextStyle.textStyleUtils400(),
        maxLength: 8,
        validator: (value) =>
            Validators.validateConfirmPassword(value, controller.passwordTextController.text));
  }
}

class FirstNameTextFormFields extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  FirstNameTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 2,
            color: textFieldBoarderColor,
          )),
      child: Row(
        children: [
          Obx(() => DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    value: controller.selectedStatus.value,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: controller.status.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    itemHeight: 49,
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? val) {
                      controller.selectedStatus.value = val!;
                    },
                  ),
                ),
              )),
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                width: 2,
                color: textFieldBoarderColor,
              ))),
              child: TextFormField(
                controller: controller.fNameTextController,
                focusNode: controller.fNameFocusNode,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10.w),
                  hintText: controller.isValid &&
                          controller.fNameTextController.text == ""
                      ? LanguageConstants.enterFirstName.tr
                      : LanguageConstants.firstNameText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LastNameTextFormFields extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  LastNameTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller.lNameTextController,
      focusNode: controller.lNameFocusNode,
      keyboardType: TextInputType.name,
      hintText:
          controller.isValid && controller.lNameTextController.value.text == ""
              ? LanguageConstants.enterLastName.tr
              : LanguageConstants.lastNameText.tr,
      hintStyle: AppTextStyle.textStyleUtils400(),
      validator: (value) => null,
    );
  }
}

class DateOfBirthTextFormFields extends GetView<SignUpController> {
  DateOfBirthTextFormFields({Key? key}) : super(key: key);
  @override
  final SignUpController controller = Get.find();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller.dobTextController,
      focusNode: controller.dobFocusNode,
      hintText: controller.isValid && controller.dobTextController.text == ""
          ? LanguageConstants.enterDateOfBirth.tr
          : LanguageConstants.dateOfBirthText.tr,
      hintStyle: AppTextStyle.textStyleUtils400(),
      readOnly: true,
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        /*controller.dobTextController.value.text =
            DateFormat("yyyy-MM-dd").format(selectedDate);*/

        if (pickedDate != null && pickedDate != selectedDate) {
          debugPrint('hello $pickedDate');
          selectedDate = pickedDate;
          controller.dobTextController.text =
              DateFormat("yyyy-MM-dd").format(selectedDate);
        }
      },
      validator: (value) => null,
    );
  }
}

class DateOfMarriageTextFormFields extends GetView<SignUpController> {
  DateOfMarriageTextFormFields({Key? key}) : super(key: key);

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller.domTextController,
      focusNode: controller.domFocusNode,
      keyboardType: TextInputType.name,
      hintText: controller.isValid && controller.domTextController.text == ""
          ? LanguageConstants.enterDateOfMarriage.tr
          : LanguageConstants.dateOfMarriageText.tr,
      hintStyle: AppTextStyle.textStyleUtils400(),
      readOnly: true,
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        /*controller.domTextController.value.text =
            DateFormat.yMMMd().format(selectedDate);*/

        if (pickedDate != null && pickedDate != selectedDate) {
          debugPrint('hello $pickedDate');
          selectedDate = pickedDate;
          controller.domTextController.text =
              DateFormat("yyyy-MM-dd").format(selectedDate);
        }
      },
      validator: (value) {
        debugPrint('date:: ${selectedDate.toString()}');
        if (value?.isEmpty ?? false) {
          return LanguageConstants.dateOfBirthIsRequiredveralusso.tr;
        }
        return null;
      },
    );
  }
}

class CountryFormFields extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  CountryFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(
                color: Colors.black,
              ))),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: controller.selectedCountry.value,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: controller.country.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? value) {
              controller.selectedCountry.value = value!;
            },
          ),
        ),
      ),
    );
  }
}

class TelephoneNoTextFormFields extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  TelephoneNoTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
        controller: controller.telephoneNoTextController,
        focusNode: controller.telephoneNoFocusNode,
        hintText: LanguageConstants.telephoneNoText.tr,
        keyboardType: TextInputType.phone,
        hintStyle: AppTextStyle.textStyleUtils400(),
        validator: (value) => Validators.validateMobile(
              value?.trim() ?? '',
            ));
  }
}
