import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: commonAppbar(title: LanguageConstants.aboutUsText.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(firstCapitalize(LanguageConstants.aboutUsTitle.tr),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtilsUnderLine18(
                      fontWeight: FontWeight.w500, thickness: 1)),
              const SizedBox(height: 10),
              Text(firstCapitalize(LanguageConstants.aboutUsContain.tr),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400_16()),
              const SizedBox(height: 10),
              Text(firstCapitalize(LanguageConstants.aboutUsContain1.tr),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils500_16()),
              const SizedBox(height: 27),
              Text(firstCapitalize(LanguageConstants.aboutUsContain2.tr),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400()),
              const SizedBox(height: 20),
              Text(firstCapitalize(LanguageConstants.aboutUsContain3.tr),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400()),
              const SizedBox(height: 20),
              Text(firstCapitalize(LanguageConstants.aboutUsContain4.tr),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400()),
              const SizedBox(height: 20),
              Text(firstCapitalize(LanguageConstants.aboutUsContain5.tr),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400()),
              const SizedBox(height: 20),
              Text(firstCapitalize(LanguageConstants.aboutUsContain6.tr),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400()),
              const SizedBox(height: 20),
              Text(firstCapitalize(LanguageConstants.aboutUsContain7.tr),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400()),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
  }
}
