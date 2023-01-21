import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/forgot_password/forget_password_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/screens/login/widgets/reset_password_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class ForgotPasswordScreen extends GetView<ForgetPasswordMenuController> {
  @override
  final ForgetPasswordMenuController controller = Get.find();

  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: whiteColor,
          body: Form(
            key: controller.formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        LanguageConstants.forgetPassword.tr,
                        style: AppTextStyle.textStyleUtilsUnderLine20(
                            thickness: 1, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        LanguageConstants.forgotYourPasswordDescriptionText.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400_16(),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 40,
                        width: Get.width,
                        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: blackColor, width: 0),
                        ),
                        child: TextFormField(
                          validator: (value) => null,
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: controller.isValidation.value == true &&
                                    controller.emailController.value.text == ""
                                ? "Enter Email Address"
                                : LanguageConstants.enterYourEmailText.tr,
                            hintStyle: AppTextStyle.textStyleUtils400_16(
                                color: emailaddressColor),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            contentPadding: const EdgeInsets.all(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ResetPasswordButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: blackColor,
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
