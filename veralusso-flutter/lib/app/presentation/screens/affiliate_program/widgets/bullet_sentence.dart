import 'package:flutter/material.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';

class BulletSentence extends StatelessWidget {
  final String text;
  const BulletSentence({
    Key? key,
    required this.text,
  }) : super(key: key);

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
