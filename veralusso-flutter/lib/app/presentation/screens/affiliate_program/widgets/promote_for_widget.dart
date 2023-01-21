import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:veralusso/app/presentation/screens/affiliate_program/widgets/bullet_sentence.dart';

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
            underline: true,
            fontSize: 16.0,
            fontFamily: AppConstants.fontMontserrat,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                BulletSentence(
                    text: LanguageConstants.promoteSoloAnswerOneText.tr),
                BulletSentence(
                    text: LanguageConstants.promoteSoloAnswerTwoText.tr),
                BulletSentence(
                    text: LanguageConstants.promoteSoloAnswerThreeText.tr),
                BulletSentence(
                    text: LanguageConstants.promoteSoloAnswerFourText.tr),
                BulletSentence(
                    text: LanguageConstants.promoteSoloAnswerFiveText.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
