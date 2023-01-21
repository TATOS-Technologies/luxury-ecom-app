import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_account/my_account_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/input_text_field_widget.dart';

class NameTextField extends GetView<MyAccountController> {
  @override
  final MyAccountController controller = Get.find();

  NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: TextFormFieldWidget(
        controller: controller.firstNameController,
        hintText:
            controller.isValid && controller.firstNameController.text == ""
                ? LanguageConstants.enterFirstName.tr
                : LanguageConstants.nameChatText.tr,
        textAlign: TextAlign.center,
        validator: (value) => null,
      ),
    );
  }
}

class EmailTextField extends GetView<MyAccountController> {
  @override
  final MyAccountController controller = Get.find();

  EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: EmailWidget(
          controller: controller.emailController,
          hintText: controller.isValid && controller.emailController.text == ""
              ? LanguageConstants.enterEmailAddress.tr
              : LanguageConstants.emailText.tr,
          textAlign: TextAlign.center,
          validator: (value) => null),
    );
  }
}
