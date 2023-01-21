import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/my_account/my_account_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/const/app_constants.dart';
import '../../../../theme/colors.dart';

class NameTextField extends GetView<MyAccountController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.w,
      width: 250.w,
      child: TextFormField(
        controller: controller.firstNameController,
        validator: (value) => null,
        cursorHeight: 20,
        cursorColor: appColorPrimary,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: whiteColor,
          filled: true,
          hintText: controller.firstNameController.text == "" && controller.isValidation
              ? LanguageConstants.enterFirstName.tr
              : LanguageConstants.nameChatText.tr,
          hintStyle: const TextStyle(fontSize: 14, fontFamily: AppConstants.fontPoppins),
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0), borderSide: const BorderSide(color: borderGrey)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderGrey, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderGrey, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderGrey, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(12)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderGrey, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}


class EmailTextField extends GetView<MyAccountController> {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.w,
      width: 250.w,
      child: TextFormField(
        controller: controller.emailController,
        validator: (value) => null,
        cursorHeight: 25,
        cursorColor: borderGrey,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: whiteColor,
          filled: true,
          hintText: controller.emailController.text == "" && controller.isValidation
              ? LanguageConstants.enterEmailAddress.tr
              : LanguageConstants.emailAddress.tr,
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          hintStyle: const TextStyle(fontSize: 14, fontFamily: AppConstants.fontPoppins),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0), borderSide: const BorderSide(color: borderGrey)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderGrey, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderGrey, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderGrey, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(12)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderGrey, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}