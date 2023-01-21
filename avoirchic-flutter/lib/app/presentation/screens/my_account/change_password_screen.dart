import 'package:avoirchic/app/controller/change_password_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:meta_package/utils/validator.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(LanguageConstants.changePassword.tr),
      ),
      backgroundColor: appBGColor,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(0xff367587),
                ),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      PasswordWidget(
                        controller: controller.currentPasswordController.value,
                        hintText: LanguageConstants.currentPassword.tr,
                        maxLength: 8,
                        validator: (value) => Validators.validateRequired(
                            value.toString(),
                            '${LanguageConstants.currentPassword.tr} '),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      PasswordWidget(
                        controller: controller.passwordController.value,
                        hintText: LanguageConstants.passwordText.tr,
                        maxLength: 8,
                        validator: (value) =>
                            Validators.validatePassword(value),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      PasswordWidget(
                        controller: controller.confirmPasswordController.value,
                        hintText: LanguageConstants.confirmPasswordText.tr,
                        maxLength: 8,
                        validator: (value) =>
                            Validators.validateConfirmPassword(value,
                                controller.passwordController.value.text),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CommonThemeButton(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.changePassword();
                            }
                          },
                          title: LanguageConstants.commonUpdateText.tr)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
