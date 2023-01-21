import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';

import 'colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static final normalRegular14 = TextStyle(
    fontSize: 14.w,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalSemiBold15 = TextStyle(
    fontSize: 15.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
    fontFamily: AppConstants.fontPoppins,
  );

  static final normalRegular16 = TextStyle(
    fontSize: 16.w,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.fontPoppins,
    color: titleBlack,
  );

  static final normalSemiBold16 = TextStyle(
    fontSize: 16.w,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalWhiteSemiBold16 = TextStyle(
    fontSize: 16.w,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.fontPoppins,
    color: whiteColor,
  );

  static final  commonTextStyle300 = TextStyle(
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w300,
    fontSize: 16.sp,
    color: Colors.black,
  );

  static final headerTextStyle = TextStyle(
    fontFamily: AppConstants.fontPoppins,
    color: blackColor,
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
  );

  static TextStyle textStyleUtils16() {
    return  TextStyle(
      color: blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
    );
  }

  static TextStyle textStyleUtils700({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils700_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils700_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils600({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils600_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils600_20({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils600_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils500({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils500_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils500_20({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils500_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils400({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils300({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils300_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils300_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtilsUnderline600({Color? color}) {
    return TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: blackColor,
      decorationThickness: 1.5,
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
    );
  }

  static TextStyle textStyleUtilsUnderLine20({Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationColor: color ?? blackColor,
      decorationThickness: thickness ?? 1.5,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 20.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle textStyleUtilsUnderLine18({Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationColor: color ?? blackColor,
      decorationThickness: thickness ?? 1.5,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 18.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle textStyleUtilsUnderLine16({Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color?? blackColor,
      decoration: TextDecoration.underline,
      decorationThickness: thickness ?? 1.5,
      decorationColor: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle textStyleUtilsUnderLine14({Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationThickness: thickness ?? 1.5,
      decorationColor: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
  static TextStyle textStyleUtilsUnderLine({Color? color, FontWeight? fontWeight, double? thickness,double? size}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationThickness: thickness ?? 1.5,
      decorationColor: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size??14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
