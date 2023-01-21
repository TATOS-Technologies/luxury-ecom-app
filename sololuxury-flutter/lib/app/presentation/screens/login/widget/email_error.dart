import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class EmailError extends StatelessWidget {
  const EmailError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LanguageConstants.accountDoesNotExist.tr,
          style: AppStyle.textStyleUtilsUnderline600(color: buttoncolor),
        ),
        const SizedBox(height: 15),
        Text(
          LanguageConstants.forgotPasswordWrongEmailStart.tr,
          textAlign: TextAlign.center,
          style: AppStyle.textStyleUtils16(),
        ),
        Text(
          LanguageConstants.forgotPasswordWrongEmailEnd.tr,
          textAlign: TextAlign.center,
          style: AppStyle.textStyleUtils16(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${LanguageConstants.writeAtText.tr} ',
              textAlign: TextAlign.center,
              style: AppStyle.textStyleUtils16(),
            ),
            Text(
              'care@sololuxury.com',
              style: AppStyle.textStyleUtils400_16(color: buttoncolor).copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
