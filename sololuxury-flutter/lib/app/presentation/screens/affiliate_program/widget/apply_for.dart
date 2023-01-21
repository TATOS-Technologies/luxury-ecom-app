import '../../../../../all_imports.dart';

class ApplyFor extends StatelessWidget {
  const ApplyFor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstants.howApplyTitleText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HeadlineBodyOneBaseWidget(
                  title: LanguageConstants.howApplyAnswerOneText.tr,
                  titleColor: Colors.black,
                  titleTextAlign: TextAlign.start,
                  fontSize: 14.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
