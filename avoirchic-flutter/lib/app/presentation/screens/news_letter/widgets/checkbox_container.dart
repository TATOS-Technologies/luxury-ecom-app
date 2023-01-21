import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/news_lettter_controller.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';

class CheckboxContainer extends GetView<NewsLetterController> {
  final String text;

  const CheckboxContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            border: Border.all(
              color: textDarkBlue,
              width: 1.5,
            ),
          ),
          child: const Icon(
            Icons.check,
            color: textDarkBlue,
            size: 12,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: AppTextStyle.textStyleUtils500_12(),
        )
      ],
    );
  }
}
