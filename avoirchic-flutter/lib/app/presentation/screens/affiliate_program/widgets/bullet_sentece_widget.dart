import 'package:avoirchic/app/controller/affiliate_program_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/headline_body_one_base_widget.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: AppTextStyle.textStyleUtils400(),
          ),
        ),
      ],
    );
  }
}
