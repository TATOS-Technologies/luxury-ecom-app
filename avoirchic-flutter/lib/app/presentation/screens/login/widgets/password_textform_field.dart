import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../../controller/login_controller.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';
import '../../../common_widgets/input_text_field_widget.dart';

class PasswordTextFormField extends GetView<LoginController> {
  const PasswordTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PasswordWidget(
      controller: controller.passwordTextController,
      focusNode: controller.passwordFocusNode,
      hintText: LanguageConstants.passwordText.tr,
      hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
      maxLength: 8,
      validator: (value) => Validators.validatePassword(value),
    );
  }
}
