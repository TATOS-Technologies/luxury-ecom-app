import 'package:brandslabels/app/controller/signup_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/presentation/screens/signup/widgets/agreement_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';

import '../../common_widgets/common_widget/date_picker_widget.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.backgroundColor.value,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: GetBuilder<SignUpController>(
              id: "signUp",
              builder: (controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LanguageConstants.signUpText.tr,
                            style: AppTextStyle.textStyleUtils600(size: 30),
                          )),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: emailTextFormFields(
                              context: context,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        child: confirmEmailTextFormFields(
                          context: context,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      passwordTextFormFields(
                        context: context,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      confirmPasswordTextFormFields(
                        context: context,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 2,
                                color: Colors.grey.shade400,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  padding: const EdgeInsets.all(1),
                                  child: DropdownButton<String>(
                                    isExpanded: false,
                                    style: AppTextStyle.textStyleUtils400(
                                      color: Colors.grey,
                                    ),
                                    value: controller.selectedStatus.value,
                                    iconSize: 15,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items:
                                        controller.status.map((String items) {
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
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                              width: 2,
                                              color: Colors.grey.shade400))),
                                  child: TextFormField(
                                    controller: controller.nameTextController,
                                    focusNode: controller.nameFocusNode,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(left: 10.w),
                                      hintText: LanguageConstants.nameText.tr,
                                      hintStyle: AppTextStyle.textStyleUtils400(
                                          color:
                                              controller.textHintColor.value),
                                    ),
                                    validator: (value) =>
                                        Validators.validateName(value),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        child: surNameTextFormFields(
                          context: context,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        child: DatePickerWidget(
                          enabled: true,
                          controller: controller.dateOfBirthTextController,
                          labelText: controller.isSubmitButtonPressed &&
                                  controller.dateOfBirthTextController.value
                                          .text ==
                                      ""
                              ? LanguageConstants.dateOfBirthIsRequired.tr
                              : LanguageConstants.dateOfBirth.tr,
                          validator: /*(date) => (date == null && controller.dateOfBirthTextController.value.text == '') ? 'Please select date' :*/ null,
                        ),
                      ),
                      // SizedBox(
                      //   height: 15.h,
                      // ),
                      // SizedBox(
                      //   child: DatePickerWidget(
                      //     enabled: true,
                      //     controller: controller.marriageTextController,
                      //     labelText: controller.isSubmitButtonPressed &&
                      //             controller
                      //                     .marriageTextController.value.text ==
                      //                 ""
                      //         ? LanguageConstants
                      //             .marriageAnniversaryIsRequired.tr
                      //         : LanguageConstants.marriage.tr,
                      //     validator: /*(date) => (date == null && controller.dateOfBirthTextController.value.text == '') ? 'Please select date' :*/ null,
                      //   ),
                      // ),
                      SizedBox(
                        height: 30.h,
                      ),
                      AgreementWidget(),
                      SizedBox(
                        height: 30.h,
                      ),
                      submitButton(
                        context: context,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget nameTextFormFields({required BuildContext context}) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      )),
      child: Expanded(
        child: SizedBox(
          child: TextFormFieldWidget(
            controller: controller.nameTextController,
            focusNode: controller.nameFocusNode,
            keyboardType: TextInputType.name,
            hintText: LanguageConstants.nameText.tr,
            hintStyle: AppTextStyle.textStyleUtils400(
                color: controller.textHintColor.value),
            validator: (value) => Validators.validateName(value),
          ),
        ),
      ),
    );
  }

  Widget surNameTextFormFields({required BuildContext context}) {
    return SizedBox(
      child: TextFormFieldWidget(
        controller: controller.surNameTextController,
        focusNode: controller.surNameFocusNode,
        keyboardType: TextInputType.name,
        hintText: LanguageConstants.surNameText.tr,
        hintStyle: AppTextStyle.textStyleUtils400(
            color: controller.textHintColor.value),
        validator: (value) => Validators.validateName(value),
      ),
    );
  }

  Widget dateOfBirthTextFormFields({required BuildContext context}) {
    return SizedBox(
      child: TextFormFieldWidget(
        controller: controller.dateOfBirthTextController,
        focusNode: controller.dateOfBirthFocusNode,
        keyboardType: TextInputType.datetime,
        suffixIcon: const Icon(Icons.calendar_month),
        hintText: LanguageConstants.dateOfBirth.tr,
        hintStyle: AppTextStyle.textStyleUtils400(
            color: controller.textHintColor.value),
        validator: (value) => null,
      ),
    );
  }

  // Widget marriageTextFormFields({required BuildContext context}) {
  //   return TextFormFieldWidget(
  //     controller: controller.marriageTextController,
  //     focusNode: controller.marriageFocusNode,
  //     keyboardType: TextInputType.datetime,
  //     suffixIcon: const Icon(Icons.calendar_month),
  //     hintText: LanguageConstants.marriage.tr,
  //     hintStyle: AppTextStyle.textStyleUtils400(
  //       color: controller.textHintColor.value,
  //     ),
  //     validator: (value) => Validators.validateDigits(
  //       value?.trim() ?? '',
  //       LanguageConstants.date.tr,
  //       10,
  //     ),
  //   );
  // }

  Widget emailTextFormFields({required BuildContext context}) {
    return SizedBox(
      child: EmailWidget(
        controller: controller.emailTextController,
        focusNode: controller.emailFocusNode,
        hintText: LanguageConstants.emailAddressText.tr,
        keyboardType: TextInputType.emailAddress,
        hintStyle: AppTextStyle.textStyleUtils400(
            color: controller.textHintColor.value),
        validator: (value) => Validators.validateEmail(value),
      ),
    );
  }

  Widget confirmEmailTextFormFields({required BuildContext context}) {
    return SizedBox(
      child: EmailWidget(
        controller: controller.confirmEmailTextController,
        focusNode: controller.confirmEmailFocusNode,
        hintText: LanguageConstants.confirmEmailAddressText.tr,
        hintStyle: AppTextStyle.textStyleUtils400(
            color: controller.textHintColor.value),
        validator: (value) => Validators.validateConfirmEmail(
            value, controller.emailTextController.text),
      ),
    );
  }

  Widget confirmPasswordTextFormFields({required BuildContext context}) {
    return SizedBox(
      child: PasswordWidget(
        controller: controller.confirmPasswordTextController,
        focusNode: controller.confirmPasswordFocusNode,
        hintText: LanguageConstants.confirmPasswordAddressText.tr,
        hintStyle: AppTextStyle.textStyleUtils400(
            color: controller.textHintColor.value),
        maxLength: 8,
        validator: (value) => Validators.validateConfirmPassword(
          value?.trim(),
          controller.confirmPasswordTextController.value.text,
        ),
      ),
    );
  }

  Widget passwordTextFormFields({required BuildContext context}) {
    return SizedBox(
      child: PasswordWidget(
        controller: controller.passwordTextController,
        focusNode: controller.passwordFocusNode,
        hintText: LanguageConstants.passwordText.tr,
        hintStyle: AppTextStyle.textStyleUtils400(
            color: controller.textHintColor.value),
        maxLength: 8,
        validator: (value) => Validators.validatePassword(
          value?.trim(),
        ),
      ),
    );
  }

  Widget enquiryFormFields({required BuildContext context}) {
    return Container(
      width: 360,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                color: controller.textFieldBorderColor.value,
              ))),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            style: AppTextStyle.textStyleUtils400(
                color: controller.textHintColor.value),
            hint: Text(LanguageConstants.typesOfEnquiry.tr),
            value: controller.selectedEnquiry.value,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: controller.enquiry.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? value) {
              controller.selectedEnquiry.value = value!;
            },
          ),
        ),
      ),
    );
  }

  Widget countryFormFields({required BuildContext context}) {
    return Container(
      width: 360,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                color: controller.textFieldBorderColor.value,
              ))),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            style: AppTextStyle.textStyleUtils400(
                color: controller.textHintColor.value),
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

  Widget submitButton({required BuildContext context}) {
    return SizedBox(
      height: 35.h,
      width: 327.w,
      child: CommonThemeButton(
        onTap: () {
          controller.signUpUser();
        },
        title: LanguageConstants.signUpText.tr,
      ),
    );
  }
}
