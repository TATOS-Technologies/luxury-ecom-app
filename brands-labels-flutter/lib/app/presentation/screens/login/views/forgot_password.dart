import 'package:brandslabels/app/controller/forget_password_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';

class ForgotPasswordScreen extends GetView<ForgetPasswordMenuController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: whiteColor,
        appBar: commonAppbar(title: LanguageConstants.forgetPassword.tr),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: controller.formKey.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 280.w,
                      child: Text(
                        LanguageConstants.forgetPasswordContain1.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400(),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    forgotPasswordTextField(),
                    SizedBox(height: 25.h),
                    resetPasswordButton(context),
                  ],
                ),
              ),
            ),
            controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: Color(0xff000080),
                      // size: 50.0,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget forgotPasswordTextField() {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderGrey, width: 2.0),
      ),
      child: TextFormField(
        controller: controller.emailController.value,
        validator: (value) => Validators.validateEmail(value),
        decoration: InputDecoration(
          hintText: LanguageConstants.enterEmail.tr,
          hintStyle:
              AppTextStyle.textStyleUtils400_16(color: const Color(0xff535353)),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.all(8.0),
        ),
      ),
    );
  }

  Widget resetPasswordButton(BuildContext context) {
    return CommonThemeButton(
      onTap: () {
        if (controller.formKey.value.currentState?.validate() ?? false) {
          controller.getForgetPasswordResponse(
              email: controller.emailController.value.text);
        }
      },
      title: LanguageConstants.resetPassword.tr,
    );
  }
}
