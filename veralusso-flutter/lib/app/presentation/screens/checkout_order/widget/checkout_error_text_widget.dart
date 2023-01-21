import 'package:flutter/material.dart';

import '../../../common_widget/common_widget/common_text_opensans.dart';

class ErrorTextWidget extends StatelessWidget {
  final String text;

  const ErrorTextWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: CommonTextOpenSans(
              text,
              fontSize: 12,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          )
        : const SizedBox.shrink();

  }
}
