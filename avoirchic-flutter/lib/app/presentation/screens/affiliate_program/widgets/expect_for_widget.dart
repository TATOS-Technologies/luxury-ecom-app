import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/headline_body_one_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bullet_sentece_widget.dart';

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
                BulletSentenceWidget(
                    text: LanguageConstants.expectRuleOneText.tr),
                BulletSentenceWidget(
                    text: LanguageConstants.expectRuleTwoText.tr),
                BulletSentenceWidget(
                    text: LanguageConstants.expectRuleThreeText.tr),
                BulletSentenceWidget(
                    text: LanguageConstants.expectRuleFourText.tr),
                BulletSentenceWidget(
                    text: LanguageConstants.expectRuleFiveText.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
