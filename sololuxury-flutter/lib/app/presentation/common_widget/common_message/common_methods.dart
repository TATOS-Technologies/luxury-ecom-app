import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/theme/colors.dart';

void printLog(dynamic log) {
  if (kDebugMode) {
    debugPrint("--------- App logs ---------\n$log");
  }
}

class CommonMethod {
  void showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void printLog(dynamic log) {
    if (kDebugMode) {
      debugPrint("--------- App logs ---------\n$log");
    }
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
