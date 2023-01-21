import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';

class AppTextStyle {
  AppTextStyle._();

  static final normalRegular14 = TextStyle(
    fontSize: 14.w,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalRegular15 = TextStyle(
    fontSize: 14.w,
    fontFamily: AppConstants.fontOpenSans,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalSemiBold15 = TextStyle(
    fontSize: 15.w,
    fontFamily: AppConstants.fontOpenSans,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalRegular16 = TextStyle(
    fontSize: 16.w,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.fontOpenSans,
    color: titleBlack,
  );

  static final normalSemiBold16 = TextStyle(
    fontSize: 16.w,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.fontOpenSans,
    color: titleBlack,
  );

  static final normalBold16 = TextStyle(
    fontSize: 16.w,
    fontFamily: AppConstants.fontOpenSans,
    fontWeight: FontWeight.bold,
    color: titleBlack,
  );

  static final normalRegular17 = TextStyle(
    fontSize: 17.w,
    fontFamily: AppConstants.fontOpenSans,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  /// chintan_flutter

  static TextStyle textStyleUtils700(
      {double? size, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils600(
      {double? size, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils500(
      {double? size, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils400({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils300({double? size, FontWeight? fontWeight}) {
    return TextStyle(
      color: blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.w300,
    );
  }

  static TextStyle subTextStyle() {
    return const TextStyle(
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.grey,
    );
  }

  static TextStyle commonTextStyleNormal() {
    return const TextStyle(
      fontFamily: AppConstants.fontOpenSans,
      fontSize: 16,
      color: Colors.black,
    );
  }

  static TextStyle commonTextStyle300() {
    return const TextStyle(
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w300,
      fontSize: 16,
      color: Colors.black,
    );
  }

  static TextStyle commonTextStyle600({required double fontSize}) {
    return TextStyle(
      decoration: TextDecoration.underline,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: Colors.black,
    );
  }

  static TextStyle textStyleUtils({double? height, Color? color}) {
    return TextStyle(
      color: color ?? grey636363,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w400,
      height: height ?? 1.4,
    );
  }

  static TextStyle textStyleError({double? fontSize, Color? color}) {
    return TextStyle(
      color: color ?? Colors.red,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 12,
    );
  }

  static TextStyle textStyleLabel(
      {double? size, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontOpenSans,
      fontSize: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.w300,
    );
  }
}
