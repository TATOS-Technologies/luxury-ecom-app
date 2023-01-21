import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../../controller/forget_password_controller.dart';
import '../../../../theme/app_text_style.dart';

class ForgotemailField extends GetView<ForgetPasswordMenuController> {
  const ForgotemailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller.emailController.value,
        maxLines: 1,
        maxLength: 30,
        cursorColor: Colors.black,
        style: AppTextStyle.textStyleUtils400(),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            // filled: true,

            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            counterText: '',
            contentPadding: EdgeInsets.zero,
            hintText: controller.isValidation.value == true &&
                    controller.emailController.value.text == ""
                ? LanguageConstants.enterEmailAddress.tr
                : LanguageConstants.enterEmail.tr,
            hintStyle: AppTextStyle.textStyleUtils400()),
        validator: (value) => Validators.validateEmail(value),
      ),
    );
  }
}
