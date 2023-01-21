import 'package:flutter/material.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';

class CheckboxContainer extends StatelessWidget {
  final String text;

  const CheckboxContainer(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              border: Border.all(color: appColorPrimary, width: 1.5)),
          child: const Icon(
            Icons.check,
            color: appColorPrimary,
            size: 12,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: AppTextStyle.textStyleUtils500_12(color: blackColor),
        )
      ],
    );
  }
}
