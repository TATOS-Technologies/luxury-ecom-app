import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class NameTextField extends GetView<ProductDetailController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller.firstNameControllerChat,
      hintText: LanguageConstants.nameChatText.tr,
      textAlign: TextAlign.center,
      validator: (value) => Validators.validateRequired(
          value?.trim() ?? '', LanguageConstants.name.tr),
    );
  }
}

class EmailTextField extends GetView<ProductDetailController> {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmailWidget(
      controller: controller.emailControllerChat,
      hintText: LanguageConstants.emailText.tr,
      textAlign: TextAlign.center,
      validator: (value) => Validators.validateEmail(
        value?.trim(),
      ),
    );
  }
}
