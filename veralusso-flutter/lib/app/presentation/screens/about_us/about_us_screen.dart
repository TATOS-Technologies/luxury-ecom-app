import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(title: LanguageConstants.aboutUsText.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                LanguageConstants.aboutUsContain.tr,
                textAlign: TextAlign.justify,
                style: AppTextStyle.textStyleUtils400(size: 13),
              ),
              const SizedBox(height: 16),
              Text(
                LanguageConstants.aboutUsContain1.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 13),
              ),
              const SizedBox(height: 16),
              Text(
                LanguageConstants.aboutUsContain2.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 13),
              ),
              const SizedBox(height: 16),
              Text(
                LanguageConstants.aboutUsContain3.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 13),
              ),
              const SizedBox(height: 16),
              Text(
                LanguageConstants.aboutUsContain4.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 13),
              ),
              const SizedBox(height: 16),
              Text(
                LanguageConstants.aboutUsContain5.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 13),
              ),
              const SizedBox(height: 16),
              Text(
                LanguageConstants.aboutUsContain6.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 13),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
