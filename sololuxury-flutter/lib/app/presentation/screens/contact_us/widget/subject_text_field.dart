import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class SubjectTextField extends StatelessWidget {
  const SubjectTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(builder: (controller) {
      return TextFormFieldWidget(
        unFillField: true,
        isFilled: true,
        inputFormFilledColor: backGroundColor,
        controller: controller.subjectController.value,
        hintText: LanguageConstants.subjectText.tr,
        hintStyle: AppTextStyle.subTextStyle(),
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        validator: (value) => Validators.validateRequired(
            value?.trim() ?? '', LanguageConstants.subjectText.tr),
      );
    });
  }
}
