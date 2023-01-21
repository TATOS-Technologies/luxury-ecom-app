import 'package:flutter/material.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/theme/static_decoration.dart';

class ErrorDialog {}

class SuccessDialog {}

class WarningDialog {}

Widget commonDialog({required Widget child}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: circular8BorderRadius),
    elevation: 1,
    insetPadding: const EdgeInsets.all(25),
    child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: primaryWhite,
          borderRadius: circular8BorderRadius,
        ),
        child: child),
  );
}
