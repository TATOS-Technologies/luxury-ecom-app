import 'package:flutter/material.dart';
import 'package:veralusso/app/core/const/app_constants.dart';

class CommonTextOpenSans extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final double? height;

  const CommonTextOpenSans(this.text,
      {Key? key,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.height,
      this.maxLine,
      this.decoration,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: overflow,
      style: TextStyle(
          fontFamily: AppConstants.fontMontserrat,
          fontSize: fontSize,
          height: height,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration),
      textAlign: textAlign,
      maxLines: maxLine,
    );
  }
}
