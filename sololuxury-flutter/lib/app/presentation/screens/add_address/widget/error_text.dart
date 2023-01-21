import '../../../../../all_imports.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return text.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: CommonTextOpenSans(
              text,
              style: AppTextStyle.textStyleError(),
              textAlign: TextAlign.left,
            ),
          )
        : const SizedBox.shrink();
  }
}
