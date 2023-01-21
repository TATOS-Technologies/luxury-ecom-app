import 'package:flutter/material.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'package:veralusso/app/theme/static_decoration.dart';

class ErrorDialog {}

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
