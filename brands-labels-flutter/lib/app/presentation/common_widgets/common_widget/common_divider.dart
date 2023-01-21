import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  final double? width;
  final Color? color;

  const CommonDivider({Key? key, this.width, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      color: color ?? appDividerColor,
      height: 1.0,
    );
  }
}
