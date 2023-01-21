import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/theme/colors.dart';

class CommonMethod {
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
