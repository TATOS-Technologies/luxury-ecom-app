import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(builder: (controller) {
      return TextFormFieldWidget(
        unFillField: true,
        isFilled: true,
        inputFormFilledColor: backGroundColor,
        controller: controller.emailController.value,
        keyboardType: TextInputType.emailAddress,
        hintStyle: AppTextStyle.subTextStyle(),
        hintText: LanguageConstants.emailText.tr,
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        validator: (value) => Validators.validateEmail(
          value?.trim(),
        ),
      );
    });
  }
}
