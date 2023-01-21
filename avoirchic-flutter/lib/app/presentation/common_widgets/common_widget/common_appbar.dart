import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common_text_opensans.dart';
import 'common_text_poppins.dart';

PreferredSizeWidget commonAppbar(
    {String title = "",
    Color? appBarColor,
    Color? textColor,
    Color? iconColor,
    bool centerTitle = true,
    bool useAnotherTextStyle = false}) {
  return AppBar(
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.arrow_back,
        size: 24.0,
      ),
    ),
    elevation: 0,
    centerTitle: centerTitle,
    backgroundColor: appBarColor,
    iconTheme: IconThemeData(color: iconColor ?? Colors.black),
    title: useAnotherTextStyle
        ? Text(
            title,
            style: const TextStyle(
              color: blue367587,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          )
        : CommonTextPoppins(
            title,
            color: textColor ?? Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
  );
}

PreferredSizeWidget commonAppbarDialog(
    {String title = "",
    VoidCallback? onTapRefresh,
    Color? color,
    Color? widgetColor}) {
  return AppBar(
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.arrow_back,
        size: 24.0,
      ),
    ),
    actions: [
      InkWell(
        onTap: onTapRefresh,
        child: const Padding(
          padding: EdgeInsets.only(
            right: 8.0,
          ),
          child: Icon(
            Icons.refresh_sharp,
            size: 24.0,
          ),
        ),
      ),
    ],
    elevation: 0,
    backgroundColor: color ?? Colors.white,
    iconTheme: IconThemeData(
      color: widgetColor ?? Colors.black,
    ),
    title: CommonTextOpenSans(
      title,
      color: widgetColor ?? Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
  );
}
