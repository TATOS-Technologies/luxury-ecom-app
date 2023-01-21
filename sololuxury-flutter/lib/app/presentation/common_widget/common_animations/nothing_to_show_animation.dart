import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:solo_luxury/app/theme/app_asset.dart';

class NothigToShowAnimationWidget extends StatelessWidget {
  const NothigToShowAnimationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160.w,
        width: double.infinity,
        child: Lottie.asset(AppAsset.nothigToShowAnimation,
            repeat: true, animate: true));
  }
}
