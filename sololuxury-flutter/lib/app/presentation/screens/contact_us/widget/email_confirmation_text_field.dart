import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class EmailConfirmationTextField extends StatelessWidget {
  const EmailConfirmationTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(builder: (controller) {
      return TextFormFieldWidget(
        unFillField: true,
        isFilled: true,
        inputFormFilledColor: backGroundColor,
        hintStyle: AppTextStyle.subTextStyle(),
        controller: controller.confirmEmailController.value,
        keyboardType: TextInputType.emailAddress,
        hintText: LanguageConstants.confirmEmailText.tr,
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        validator: (value) => Validators.validateConfirmEmail(
            value?.trim(), controller.emailController.value.text),
      );
    });
  }
}
