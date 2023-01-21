import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class WhatsOnYourMindTextField extends StatelessWidget {
  const WhatsOnYourMindTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(builder: (controller) {
      return SizedBox(
        child: TextFormFieldWidget(
          unFillField: true,
          isFilled: true,
          inputFormFilledColor: backGroundColor,
          controller: controller.onyourmindController.value,
          maxLines: 5,
          hintText: LanguageConstants.whatsonyourmindText.tr,
          hintStyle: AppTextStyle.subTextStyle(),
          contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          validator: (value) => Validators.validateRequired(
            value?.trim() ?? '',
            LanguageConstants.whatsonyourmindText.tr,
          ),
        ),
      );
    });
  }
}
