import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/affiliate_program/affiliate_program_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';

class BulletSentenceWidget extends GetView<AffiliateProgramController> {
  final String text;
  const BulletSentenceWidget({required this.text,Key? key}) : super(key: key);

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
