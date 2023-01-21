import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/contact_us_controller.dart';
import '../../../common_widgets/common_widget/common_theme_button.dart';

class SubmitAccountButton extends GetView<ContactUsController> {
  const SubmitAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.w,
      width: 250.w,
      child: CommonThemeButton(
        onTap: () {
          controller.isValidation = true;
          controller.update(["Contact"]);
          if (controller.formKey.currentState?.validate() ?? false) {
            controller.contactUsPost(context);
          }
        },
        title: LanguageConstants.submitText.tr,
      ),
    );
  }
}
