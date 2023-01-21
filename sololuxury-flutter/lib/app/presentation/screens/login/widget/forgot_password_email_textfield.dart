import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';

import '../../../../core/const/app_style.dart';

class ForgotPasswordEmailTextField
    extends GetView<ForgotPasswordPageController> {
  const ForgotPasswordEmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.emailController.value,
      maxLines: 1,
      style: AppStyle.textStyleUtils400_12(),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        // filled: true,

        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),

        contentPadding: EdgeInsets.zero,
        hintText: LanguageConstants.enterYourEmailText.tr,
      ),
      validator: (value) => Validators.validateEmail(value),
      inputFormatters: [
        LengthLimitingTextInputFormatter(64),
      ],
    );
  }
}
