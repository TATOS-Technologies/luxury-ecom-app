import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:solo_luxury/app/theme/app_asset.dart';

class ErrorAnimationWidget extends StatelessWidget {
  const ErrorAnimationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160.w,
        width: double.infinity,
        child:
            Lottie.asset(AppAsset.errorAnimation, repeat: true, animate: true));
  }
}
