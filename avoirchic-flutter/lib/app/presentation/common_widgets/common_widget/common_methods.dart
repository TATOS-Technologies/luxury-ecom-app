import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonMethod {
  void showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void getXSnackBar(String title, String message, Color? color) {
    Get.snackbar(
      title,
      message,
      backgroundColor: color,
      colorText: whiteColor,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      duration: const Duration(seconds: 4),
      borderRadius: 0,
      barBlur: 10,
    );
  }
}

void errorToast(String error, {String? title}) {
  Get.snackbar(
    title ?? LanguageConstants.enterValidText.tr,
    error,
    duration: const Duration(seconds: 1),
    colorText: Colors.white,
    backgroundColor: appTextColor,
  );
}
