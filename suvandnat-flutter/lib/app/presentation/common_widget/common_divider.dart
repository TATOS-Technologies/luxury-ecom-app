// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:suvandnat/app/theme/colors.dart';

class CommonDivider extends StatelessWidget {
  double? width;
  Color? color;
  double? height;

  CommonDivider({Key? key, this.width, this.color, this.height = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      color: color ?? appDividerColor,
      height: height,
    );
  }
}
