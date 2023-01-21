import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../theme/app_text_style.dart';

class EmailErrorWidget extends StatelessWidget {
  const EmailErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LanguageConstants.accountDoesNotExist.tr,
          style: AppTextStyle.textStyleUtils500(
            size: 20,
          ).copyWith(
            decoration: TextDecoration.underline,
            decorationThickness: 1.5,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          LanguageConstants.forgotPasswordWrongEmailStart.tr,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyleUtils400_16(),
        ),
        Text(
          LanguageConstants.forgotPasswordWrongEmailEnd.tr,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyleUtils400_16(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageConstants.writeAtText.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils400_16(),
            ),
            Text(
              'care@avoirchic.com',
              style: AppTextStyle.textStyleUtilsUnderLine16(),
            ),
          ],
        ),
      ],
    );
  }
}
