import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/forget_password_controller.dart';

class ElevatedButtonWidget extends GetView<ForgetPasswordMenuController> {
  const ElevatedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonThemeButton(
      onTap: () {
        controller.isValidation.value = true;
        if (controller.formKey.value.currentState?.validate() ?? false) {
          controller.getForgetPasswordResponse(
              email: controller.emailController.value.text);
        }
      },
      title: LanguageConstants.resetPassword.tr,
    );
  }
}
