import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/forgot_password/forget_password_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class ResetPasswordButton extends GetView<ForgetPasswordMenuController> {
  @override
  final ForgetPasswordMenuController controller = Get.find();
  ResetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        controller.isValidation.value = true;
        if (controller.validation()) {
          if (controller.emailController.value.text != "") {
            controller.getForgetPasswordResponse(
                email: controller.emailController.value.text);
          }
        }
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: blackColor.withOpacity(1),
        side: BorderSide(
          width: 1.0,
          color: blackColor.withOpacity(
            1,
          ),
        ),
        shape: const StadiumBorder(),
      ),
      child: Text(
        LanguageConstants.submitText.tr,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppTextStyle.textStyleUtils400(),
      ),
    );
  }
}
