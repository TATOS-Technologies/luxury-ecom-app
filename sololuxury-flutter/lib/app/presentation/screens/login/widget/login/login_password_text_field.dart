import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../all_imports.dart';

class LoginPasswordTextField extends GetView<LoginController> {
  const LoginPasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: Center(
        child: PasswordWidget(
          controller: controller.passwordController.value,
          hintText: LanguageConstants.passwordText.tr,
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          maxLength:30,
        ),
      ),
    );
  }
}
