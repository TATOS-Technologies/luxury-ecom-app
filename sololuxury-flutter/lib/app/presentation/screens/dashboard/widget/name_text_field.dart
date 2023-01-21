import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class NameTextField extends GetView<DashboardController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller.firstNameController.value,
      hintText: LanguageConstants.nameChatText.tr,
      textAlign: TextAlign.center,
      validator: (value) => Validators.validateName(value?.trim() ?? ''),
    );
  }
}
