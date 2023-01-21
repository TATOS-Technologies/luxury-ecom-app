import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class EmailTextField extends GetView<DashboardController> {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmailWidget(
        controller: controller.emailController.value,
        hintText: LanguageConstants.emailText.tr,
        textAlign: TextAlign.center,
        validator: (value) => Validators.validateEmail(
              value?.trim(),
            ));
  }
}
