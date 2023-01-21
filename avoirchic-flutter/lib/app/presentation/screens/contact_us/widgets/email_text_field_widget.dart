import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../../controller/contact_us_controller.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';
import '../../../common_widgets/input_text_field_widget.dart';

class EmailTextField extends GetView<ContactUsController> {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(
      builder: (c) {
        return EmailWidget(
          controller: controller.emailController.value,
          hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
          hintText: controller.getEmail(),
          validator: (value) => Validators.validateEmail(value),
        );
      },
    );
  }
}
