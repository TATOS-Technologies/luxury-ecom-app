import 'package:brandslabels/app/theme/colors.dart';
import 'package:brandslabels/app/theme/static_decoration.dart';
import 'package:flutter/material.dart';

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
