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
              fontSize: 12,
              textAlign: TextAlign.center,
              color: Colors.red.shade800,
            ),
          )
        : const SizedBox.shrink();
  }
}
