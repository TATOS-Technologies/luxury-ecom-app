import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class PasswordTextField extends GetView<SignupController> {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: Center(
        child: PasswordWidget(
          controller: controller.passwordController.value,
          hintText: LanguageConstants.passwordText.tr,
          maxLength: 40,
          validator: (value) => Validators.validatePassword(
            value?.trim(),
          ),
        ),
      ),
    );
  }
}
