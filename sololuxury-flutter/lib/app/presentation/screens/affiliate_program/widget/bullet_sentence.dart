import '../../../../../all_imports.dart';

class BulletSentence extends StatelessWidget {
  const BulletSentence({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const HeadlineBodyOneBaseWidget(
          title: "•",
          titleColor: Colors.black,
          titleTextAlign: TextAlign.start,
          fontSize: 14.0,
        ),
        const SizedBox(
          width: 4.0,
        ),
        Expanded(
          child: HeadlineBodyOneBaseWidget(
            title: text,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.start,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
