import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../../all_imports.dart';

class LoginEmailTextField extends GetView<LoginController> {
  const LoginEmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: Center(
        child: EmailWidget(
          controller: controller.emailController.value,
          hintText: controller.isValidation.value == true &&
                  controller.emailController.value.text == ""
              ? LanguageConstants.enterEmailAddress.tr
              : LanguageConstants.emailAddreessText.tr,
          style: AppStyle.textStyleUtils400(),
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        ),
      ),
    );
  }
}
