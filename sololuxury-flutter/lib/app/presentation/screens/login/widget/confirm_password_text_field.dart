import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class ConfirmPasswordTextField extends GetView<SignupController> {
  const ConfirmPasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: Center(
        child: PasswordWidget(
          controller: controller.confirmPasswordController.value,
          hintText: LanguageConstants.confirmPasswordText.tr,
          validator: (value) => Validators.validateConfirmPassword(
              value, controller.passwordController.value.text),
          maxLength: 40,
        ),
      ),
    );
  }
}
