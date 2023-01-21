import 'package:flutter/material.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:get/get.dart';
import '../../../../theme/app_text_style.dart';

class PasswordErrorWidget extends StatelessWidget {
  const PasswordErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LanguageConstants.incorrectPassword.tr,
          style: AppTextStyle.textStyleUtils500(
            size: 20,
          ).copyWith(
            decoration: TextDecoration.underline,
            decorationThickness: 1.5,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          LanguageConstants.thePasswordYouenteredisincorrectPleasetryagain.tr,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyleUtils400_16(),
        ),
      ],
    );
  }
}
