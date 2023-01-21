// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonThemeButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? fontSize;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final bool? isOutLined;
  final double? borderRadius;
  final FontWeight? fontWeight;
  const CommonThemeButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.fontSize,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.isOutLined,
    this.borderRadius,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: buttonColor??primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius??10),
          side: isOutLined!=true? BorderSide.none:BorderSide(color: borderColor??primary,width: 2)
        )
      ),
      onPressed: onTap, 
      child: CommonTextPoppins(
        title,
        color: textColor??whiteColor,
        fontSize: fontSize??12.sp,
        fontWeight:fontWeight?? FontWeight.w500,
      ));
  }
}
