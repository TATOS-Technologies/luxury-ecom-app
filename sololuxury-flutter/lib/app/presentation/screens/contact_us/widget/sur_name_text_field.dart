import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class SurNameTextField extends StatelessWidget {
  const SurNameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(builder: (controller) {
      return TextFormFieldWidget(
        unFillField: true,
        isFilled: true,
        inputFormFilledColor: backGroundColor,
        hintStyle: AppTextStyle.subTextStyle(),
        controller: controller.surnameController.value,
        hintText: LanguageConstants.surNameText.tr,
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        validator: (value) => Validators.validateName(
          value?.trim(),
        ),
      );
    });
  }
}
