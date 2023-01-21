import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'package:veralusso/app/core/const/app_constants.dart';

class AppTextStyle {
  AppTextStyle._();

  static final normalSemiBold8 = TextStyle(
    fontSize: 8.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalRegular10 = TextStyle(
    fontSize: 10.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalSemiBold10 = TextStyle(
    fontSize: 10.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalSemiBold11 = TextStyle(
    fontSize: 11.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalRegular12 = TextStyle(
    fontSize: 12.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalSemiBold12 = TextStyle(
    fontSize: 12.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalRegular13 = TextStyle(
    fontSize: 13.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalSemiBold13 = TextStyle(
    fontSize: 13.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final regularBold = TextStyle(
    fontSize: 14.w,
    fontWeight: FontWeight.bold,
    color: titleBlack,
  );

  static final normalRegular14 = TextStyle(
    fontSize: 14.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalRegular15 = TextStyle(
    fontSize: 15.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );
  static final normalRegular18 = TextStyle(
    fontSize: 18.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final italicRegular15 = TextStyle(
    fontSize: 15.w,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: titleBlack,
  );

  static final normalSemiBold15 = TextStyle(
    fontSize: 15.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalRegular16 = TextStyle(
    fontSize: 16.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalSemiBold16 = TextStyle(
    fontSize: 16.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalWhiteSemiBold16 = TextStyle(
    fontSize: 16.w,
    fontWeight: FontWeight.w600,
    color: whiteColor,
  );
  static final normalBold16 = TextStyle(
    fontSize: 16.w,
    fontWeight: FontWeight.bold,
    color: titleBlack,
  );
  static final normalSemiBold17 = TextStyle(
    fontSize: 17.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );
  static final normalRegular17 = TextStyle(
    fontSize: 17.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );
  static final normalSemiBold18 = TextStyle(
    fontSize: 18.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );
  static final normalBold18 = TextStyle(
    fontSize: 18.w,
    fontWeight: FontWeight.w700,
    color: titleBlack,
  );
  static final normalSemiBold20 = TextStyle(
    fontSize: 20.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalSemiBold22 = TextStyle(
    fontSize: 22.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalSemiBold26 = TextStyle(
    fontSize: 26.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );
  static final normalBold26 = TextStyle(
    fontSize: 26.w,
    fontWeight: FontWeight.w700,
    color: titleBlack,
  );

  static final normalBold24 = TextStyle(
    fontSize: 24.w,
    fontWeight: FontWeight.w700,
    color: titleBlack,
  );

  static final normalSemiBold14 = TextStyle(
    fontSize: 14.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );
  static final normalSemiBold30 = TextStyle(
    fontSize: 30.w,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );
  static final normalRegular40 = TextStyle(
    fontSize: 40.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalRegular44 = TextStyle(
    fontSize: 44.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static TextStyle textStyleUtils16() {
    return const TextStyle(
      color: blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 16,
    );
  }

  static TextStyle textStyleUtils700({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: size ?? 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils700_20({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils700_18({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils700_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils700_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils600({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils600_20({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils600_18({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils600_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle textStyleUtils600_14({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle textStyleUtils500_14({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils600_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils500({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils500_20({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }


  static TextStyle textStyleUtils500_18({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }


  static TextStyle textStyleUtils500_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils500_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils400({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_20({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
  }


  static TextStyle textStyleUtils400_18({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils300({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: size ?? 14,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils300_20({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 20,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils300_18({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 18,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils300_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils300_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 12,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtilsUnderline600({Color? color}) {
    return TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: blackColor,
      decorationThickness: 1.5,
      color: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
  }

  static TextStyle textStyleUtilsUnderLine20({Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationColor: color ?? blackColor,
      decorationThickness: thickness ?? 1.5,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 20,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }

  static TextStyle textStyleUtilsUnderLine18({Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationColor: color ?? blackColor,
      decorationThickness: thickness ?? 1.5,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 18,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }

  static TextStyle textStyleUtilsUnderLine16({Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color?? blackColor,
      decoration: TextDecoration.underline,
      decorationThickness: thickness ?? 1.5,
      decorationColor: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 16,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }

  static TextStyle textStyleUtilsUnderLine14({Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationThickness: thickness ?? 1.5,
      decorationColor: color ?? blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }
}
