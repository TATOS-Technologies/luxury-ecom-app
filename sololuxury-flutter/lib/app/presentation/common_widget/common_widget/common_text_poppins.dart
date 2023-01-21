import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_constants.dart';

class CommonTextPoppins extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final double? height;
  final TextStyle? style;

  const CommonTextPoppins(this.text,
      {Key? key,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.height,
      this.maxLine,
      this.decoration,
      this.style,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: overflow,
      style: style ??
          TextStyle(
              fontFamily: AppConstants.fontOpenSans,
              fontSize: fontSize??14.sp,
              height: height,
              fontWeight: fontWeight,
              color: color,
              decoration: decoration),
      textAlign: textAlign,
      maxLines: maxLine,
    );
  }
}
