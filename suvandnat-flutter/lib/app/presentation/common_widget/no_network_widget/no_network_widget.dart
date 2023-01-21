import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:get/get.dart';
import '../common_animations/no_internet_animation.dart';

class NoNetworkWidget extends StatelessWidget {
  const NoNetworkWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
            backgroundColor: backGroundColor,
            // elevation: 0,
            title: SizedBox(
                height: 20.h,
                width: 111.w,
                child: Image.asset(
                  AppAsset.logo,
                ))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const NoInternetAnimationWidget(),
            Text(
              LanguageConstants.noInternet.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: grey, fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ));
  }
}
