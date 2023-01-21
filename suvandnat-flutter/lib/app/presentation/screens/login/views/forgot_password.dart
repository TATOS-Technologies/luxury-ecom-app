import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/controller/login/forget_password_controller.dart';
import 'package:suvandnat/app/presentation/screens/login/views/forget_password_menu.dart';

class ForgotPasswordScreen extends GetView<ForgetPasswordMenuController> {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final ForgetPasswordMenuController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Form(
        key: controller.formKey.value,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Get.height / 4),
                Text(
                  LanguageConstants.forgetPassword.tr,
                  style: AppTextStyle.textStyleUtilsUnderLine18(
                      color: red973133, thickness: 1),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 40.0,
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 0.8),
                  ),
                  child: forgotPasswordTextField(),
                ),
                const SizedBox(height: 20),
                resetPasswordButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget forgotPasswordTextField() {
    return TextFormField(
      controller: controller.emailController.value,
      validator: (value) => null,
      maxLines: 1,
      style: AppTextStyle.textStyleUtils300_12(),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        // filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.zero,
        hintText: LanguageConstants.emailAddressText.tr,
        hintStyle: AppTextStyle.textStyleUtils300_12(),
      ),
    );
  }

  Widget resetPasswordButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (controller.validation()) {
          if (controller.formKey.value.currentState?.validate() ?? false) {
            controller.getForgetPasswordResponse(
                email: controller.emailController.value.text);
            Get.to(() => const ForgetPasswordMenuScreen());
          }
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: 1,
        backgroundColor: red973133,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        LanguageConstants.resetPassword.tr,
        style: AppTextStyle.textStyleUtils600(color: Colors.white, size: 13.5),
      ),
    );
  }
}
