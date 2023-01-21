import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';

class ResetPasswordButton extends GetView<ForgetPasswordMenuController> {
  const ResetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     
      child: CommonThemeButton(
        onTap: () {
          controller.isValidation = true;
          controller.update(["Forgot"]);
          if (controller.formKey.value.currentState!.validate()) {
            controller.getForgetPasswordResponse(
              context: context,
              email: controller.emailController.value.text,
            );
          }
        },
        title:
          LanguageConstants.resetMyPasswordText.tr,
          
      ),
    );
  }
}
