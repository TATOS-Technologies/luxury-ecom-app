import 'package:flutter/material.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class CheckBoxContainer extends StatelessWidget {
  final String text;

  const CheckBoxContainer(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration:
              BoxDecoration(border: Border.all(color: blackColor, width: 1.5)),
          child: const Icon(
            Icons.check,
            color: blackColor,
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
