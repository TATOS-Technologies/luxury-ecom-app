import 'package:avoirchic/app/controller/splash_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_asset.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 190, end: 1.sw),
          duration: const Duration(seconds: 4),
          curve: Curves.easeIn,
          builder: (context, value, child) {
            return Center(
              child: Container(
                color: controller.backgroundColorValue.value,
                width: value.w,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  AppAsset.appLogo,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          }),
    );
  }
}
