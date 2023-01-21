import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:suvandnat/app/controller/splash/splash_controller.dart';
// import 'package:suvandnat/app/theme/colors.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: TweenAnimationBuilder<double>(
            duration: const Duration(seconds: 1),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, opacity, childs) {
              return Opacity(
                opacity: opacity,
                child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 190, end: 1.sw),
                    // tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 4),
                    curve: Curves.easeIn,
                    builder: (context, value, child) {
                      return Center(
                        child: Container(
                          color: controller.backgroundColorValue.value,
                          width: value.w,
                          height: 600.h,
                          child: SvgPicture.asset(
                            AppAsset.appLogo,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      );
                    }),
              );
            }),
      ),
    );
  }
}
