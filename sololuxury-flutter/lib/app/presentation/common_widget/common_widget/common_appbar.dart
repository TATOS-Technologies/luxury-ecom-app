import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/theme/colors.dart';
import '../../../theme/app_asset.dart';
import 'common_text_opensans.dart';

PreferredSizeWidget commonAppbar(
    {String title = "",
    bool centerTitle = true,
    bool useAnotherTextStyle = false,
    bool useAppIcon = false,
    GestureTapCallback? onTap}) {
  return AppBar(
    leading: InkWell(
      onTap: onTap ??
          () {
            Get.back<dynamic>();
          },
      child:  Icon(
        Icons.arrow_back,
        size: 24.w,
      ),
    ),
    elevation: 0,
    backgroundColor: homeBackground,
    iconTheme: const IconThemeData(color: Colors.black),
    centerTitle: centerTitle,
    title: useAppIcon
        ? Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Image.asset(
              AppAsset.solo1,
              height: 30,
            ),
          )
        : useAnotherTextStyle
            ? Text(
                title,
                style: TextStyle(
                  color: appColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            : CommonTextOpenSans(
                title,
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
  );
}

PreferredSizeWidget commonAppbarDialog(
    {String title = "", VoidCallback? onTapRefresh, Color? color}) {
  return AppBar(
    leading: InkWell(
      onTap: () {
        Get.back<dynamic>();
      },
      child: Icon(
        Icons.arrow_back_rounded,
        size: 24.sp,
        color: Colors.white,
      ),
    ),
    actions: [
      InkWell(
        onTap: onTapRefresh,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.refresh_sharp,
            size: 24.sp,
            color: Colors.white,
          ),
        ),
      ),
    ],
    elevation: 0,
    backgroundColor: color ?? Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    title: CommonTextOpenSans(
      title,
      color: Colors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
  );
}
