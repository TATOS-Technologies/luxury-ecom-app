import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(builder: (controller) {
      return TextFormFieldWidget(
        unFillField: true,
        controller: controller.nameController.value,
        hintText: LanguageConstants.firstNameText.tr,
        isFilled: true,
        hintStyle: AppTextStyle.subTextStyle(),
        inputFormFilledColor: backGroundColor,
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        validator: (value) => Validators.validateName(
          value?.trim(),
        ),
      );
    });
  }
}
