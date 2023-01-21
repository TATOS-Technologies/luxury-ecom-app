import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'common_text_poppins.dart';

PreferredSizeWidget commonAppbar(
    {String title = "",
    List<Widget> actionWidget = const [],
    Color appBarColor = backGroundColor,
    Color titleColor = Colors.black,
    Color iconColor = Colors.black}) {
  return AppBar(
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back,
        size: 24.0,
        color: iconColor,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black),
    title: CommonTextPoppins(
      title,
      color: titleColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    actions: actionWidget,
  );
}
