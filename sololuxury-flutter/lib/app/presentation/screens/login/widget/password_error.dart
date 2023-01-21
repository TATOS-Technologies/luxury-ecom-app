import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class PasswordError extends StatelessWidget {
  const PasswordError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LanguageConstants.incorrectPassword.tr,
          style: AppStyle.textStyleUtilsUnderline600(),
        ),
        const SizedBox(height: 15),
        Text(
          LanguageConstants.thePasswordYouEnteredIsIncorrectText.tr,
          textAlign: TextAlign.center,
          style: AppStyle.textStyleUtils16(),
        ),
      ],
    );
  }
}
