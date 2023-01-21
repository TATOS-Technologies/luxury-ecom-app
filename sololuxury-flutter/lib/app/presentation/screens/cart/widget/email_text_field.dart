import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return EmailWidget(
          controller: controller.emailController,
          hintText: (controller.emailController.value.text == "" &&
                  controller.isSubmitButtonPressed)
              ? LanguageConstants.emailIsRequired.tr
              : LanguageConstants.emailText.tr,
          textAlign: TextAlign.center,
          validator: (value) => Validators.validateEmail(
                value?.trim(),
              ));
    });
  }
}
