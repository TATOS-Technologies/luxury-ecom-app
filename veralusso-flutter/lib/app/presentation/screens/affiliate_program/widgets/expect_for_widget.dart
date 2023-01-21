import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:veralusso/app/presentation/screens/affiliate_program/widgets/bullet_sentence.dart';

class ExpectForWidget extends StatelessWidget {
  const ExpectForWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstants.whatCanYouExpectTitleText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                BulletSentence(text: LanguageConstants.expectRuleOneText.tr),
                BulletSentence(text: LanguageConstants.expectRuleTwoText.tr),
                BulletSentence(text: LanguageConstants.expectRuleThreeText.tr),
                BulletSentence(text: LanguageConstants.expectRuleFourText.tr),
                BulletSentence(text: LanguageConstants.expectRuleFiveText.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
