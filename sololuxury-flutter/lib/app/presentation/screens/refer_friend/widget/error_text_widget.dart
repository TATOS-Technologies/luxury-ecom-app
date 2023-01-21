import 'package:solo_luxury/all_imports.dart';

class ErrorTextWidget extends GetView<ReferFriendController> {
  final String text;

  const ErrorTextWidget({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: CommonTextOpenSans(
              text,
              fontSize: 12,
              textAlign: TextAlign.center,
              color: Colors.red,
            ),
          )
        : const SizedBox.shrink();
  }
}
