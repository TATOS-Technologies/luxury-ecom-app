import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void getXConfirmationSnackBar(
    String title,
    String message,
    Function() onButtonPress,
  ) {
    Get.snackbar(title, message,
        mainButton: TextButton(
          onPressed: onButtonPress,
          child: const Icon(Icons.delete, color: whiteColor),
        ),
        backgroundColor: blue,
        colorText: whiteColor,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 6),
        borderRadius: 0,
        barBlur: 10,
        icon: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close,
              color: whiteColor,
            )));
  }
}
