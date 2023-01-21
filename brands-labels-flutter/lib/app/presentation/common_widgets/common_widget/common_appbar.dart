import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_asset.dart';
import 'common_text_poppins.dart';

PreferredSizeWidget commonAppbar(
    {String title = "",
    bool centerTitle = true,
    bool useAnotherTextStyle = false,
    bool useAppIcon = false}) {
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
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    title: useAppIcon
        ? Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Image.asset(
              AppAsset.userIcon,
              height: 30,
            ),
          )
        : useAnotherTextStyle
            ? Text(
                title,
                style: const TextStyle(
                  color: darkBlue2A2B9B,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            : CommonTextPoppins(
                title,
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
  );
}

PreferredSizeWidget commonAppbarDialog({String title = "", VoidCallback? onTapRefresh}) {
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
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.refresh_sharp,
            size: 24.0,
          ),
        ),
      ),
    ],
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    title: CommonTextPoppins(
      title,
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
  );
}
