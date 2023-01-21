import 'package:flutter/material.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_opensans.dart';

class ErrorTextWidget extends StatelessWidget {
  final String? text;
  const ErrorTextWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (text?.isNotEmpty ?? false)
        ? Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: CommonTextOpenSans(
              text,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.left,
              color: Colors.red.shade800,
            ),
          )
        : const SizedBox.shrink();
  }
}
