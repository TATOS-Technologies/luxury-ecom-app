import 'package:avoirchic/app/controller/login_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';

class EmailTextFormField extends GetView<LoginController> {
  const EmailTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmailWidget(
      controller: controller.emailTextController,
      focusNode: controller.emailFocusNode,
      hintText: LanguageConstants.emailAddressText.tr,
      keyboardType: TextInputType.emailAddress,
      hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
      validator: (value) => Validators.validateEmail(value),
    );
  }
}
