import '../../../../../all_imports.dart';
import 'bullet_sentence.dart';

class PromoteFor extends StatelessWidget {
  const PromoteFor({Key? key}) : super(key: key);

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
