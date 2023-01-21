import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(title: LanguageConstants.aboutUsText.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Text(LanguageConstants.aboutUsTitle.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtilsUnderLine14(thickness: 1)),
                const SizedBox(height: 20),
                Text(LanguageConstants.aboutUsContain.tr,
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 18),
                Text(LanguageConstants.aboutUsContain1.tr,
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 18),
                Text(LanguageConstants.aboutUsContain2.tr,
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 18),
                Text(LanguageConstants.aboutUsContain3.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 18),
                Text(LanguageConstants.aboutUsContain4.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 18),
                Text(LanguageConstants.aboutUsContain5.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
