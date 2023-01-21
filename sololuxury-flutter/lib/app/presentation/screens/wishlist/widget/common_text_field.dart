import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class NameTextField extends GetView<WishlistController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller.firstNameController,
      hintText: LanguageConstants.nameChatText.tr,
      textAlign: TextAlign.center,
      validator: (value) => Validators.validateRequired(
          value?.trim() ?? '', LanguageConstants.name.tr),
    );
  }
}

class EmailTextField extends GetView<WishlistController> {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmailWidget(
      controller: controller.emailController,
      hintText: LanguageConstants.emailText.tr,
      textAlign: TextAlign.center,
      validator: (value) => Validators.validateEmail(
        value?.trim(),
      ),
    );
  }
}
