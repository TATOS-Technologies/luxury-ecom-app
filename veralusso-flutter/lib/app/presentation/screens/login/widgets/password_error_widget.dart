import 'package:flutter/material.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:meta_package/meta_package.dart';
import 'package:get/get.dart';

class PasswordErrorWidget extends StatelessWidget {
  const PasswordErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LanguageConstants.incorrectPassword.tr,
          style: AppTextStyle.textStyleUtils600(),
        ),
        const SizedBox(height: 15),
        Text(
          LanguageConstants.thePasswordYouenteredisincorrectPleasetryagain.tr,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyleUtils16(),
        ),
      ],
    );
  }
}
