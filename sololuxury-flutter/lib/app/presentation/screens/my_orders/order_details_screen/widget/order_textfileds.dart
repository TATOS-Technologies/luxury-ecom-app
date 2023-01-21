import 'package:meta_package/utils/validator.dart';

import '../../../../../../all_imports.dart';

class NameTextField extends GetView<MyOrdersController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller.firstNameController.value,
      hintText: LanguageConstants.nameChatText.tr,
      textAlign: TextAlign.center,
      validator: (value) =>
          Validators.validateRequired(value?.trim() ?? '', "Name"),
    );
  }
}

class EmailTextField extends GetView<MyOrdersController> {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmailWidget(
      controller: controller.emailController.value,
      hintText: LanguageConstants.emailText.tr,
      textAlign: TextAlign.center,
      validator: (value) => Validators.validateEmail(
        value?.trim(),
      ),
    );
  }
}
