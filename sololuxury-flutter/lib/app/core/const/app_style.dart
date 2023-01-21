import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';
import 'app_constants.dart';

class AppStyle {
  static TextStyle commonTextStyle400({double? size}) {
    return TextStyle(
      color: blackColor,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppConstants.fontOpenSans,
    );
  }

  static TextStyle commonTextStyle500({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 14.sp,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle commonTextStyle600(
      {double? size, Color? color, FontWeight? weight}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 14.sp,
      fontWeight: weight ?? FontWeight.w600,
      fontFamily: AppConstants.fontOpenSans,
    );
  }

  static TextStyle commonTextStyle16400() {
    return  TextStyle(
      color: blackColor,
      fontSize: 16.sp,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle commonTextStyle20400({double? size}) {
    return TextStyle(
      color: blackColor,
      fontSize: size ?? 20.sp,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle commonTextStyle20500({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 20.sp,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle commonTextStyle20600({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 14.sp,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle commonTextStyleOpen400({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 14.sp,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle commonTextStyle16500() {
    return  TextStyle(
      color: blackColor,
      fontSize: 16.sp,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils16() {
    return  TextStyle(
      color: blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 16.sp,
    );
  }

  static TextStyle textStyleUtils700({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils700_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils700_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils600({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils600_14({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils600_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils500({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils500_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils500_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils400({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_14({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils300({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils300_14({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils300_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtilsUnderline600({Color? color}) {
    return TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: color ?? buttoncolor,
      decorationThickness: 1.5,
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
    );
  }

  static TextStyle textStyleUtilsUnderLine18({Color? color}) {
    return TextStyle(
      color: blackColor,
      decoration: TextDecoration.underline,
      decorationColor: color ?? blackColor,
      decorationThickness: 1.5,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 16.sp,
    );
  }


  static TextStyle textStyleUtilsUnderLine14() {
    return  TextStyle(
      color: blackColor,
      decoration: TextDecoration.underline,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 14.sp,
    );
  }
}
