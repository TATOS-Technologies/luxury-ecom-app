import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';

import 'bullet_sentece_widget.dart';

class PromoteForWidget extends StatelessWidget {
  const PromoteForWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstants.promoteSoloQuestionText.tr,
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
                    text: LanguageConstants.promoteSoloAnswerOneText.tr),
                BulletSentenceWidget(
                    text: LanguageConstants.promoteSoloAnswerTwoText.tr),
                BulletSentenceWidget(
                    text: LanguageConstants.promoteSoloAnswerThreeText.tr),
                BulletSentenceWidget(
                    text: LanguageConstants.promoteSoloAnswerFourText.tr),
                BulletSentenceWidget(
                    text: LanguageConstants.promoteSoloAnswerFiveText.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
