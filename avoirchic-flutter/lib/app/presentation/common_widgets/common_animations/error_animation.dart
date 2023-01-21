import 'package:avoirchic/app/core/consts/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ErrorAnimation extends StatelessWidget {
  const ErrorAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160.w,
        width: double.infinity,
        child: Lottie.asset(ImageConstant.errorAnimation,
            repeat: true, animate: true));
  }
}
