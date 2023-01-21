import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class ForgotPasswordTextField extends StatelessWidget {
  const ForgotPasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordMenuController>(
      id: "Forgot",
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.only(left: 14),
          width: 327.w,
          child: Column(
            children: [
              SizedBox(
                width: 327.w,
                child: Center(
                  child: EmailWidget(
                      controller: controller.emailController.value,
                      hintText: LanguageConstants.enterYourEmailText.tr,
                      style: AppStyle.textStyleUtils400(),
                      validator: (value) => Validators.validateEmail(value)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
