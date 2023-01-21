import 'package:flutter/material.dart';
import 'package:solo_luxury/app/theme/colors.dart';

@immutable
class CommonDivider extends StatelessWidget {
  final Color color;
  final double? width, height;

  const CommonDivider(
      {Key? key,
      this.color = appColorDarkLineGrey,
      this.width,
      this.height = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      color: color,
      height: height,
    );
  }
}
