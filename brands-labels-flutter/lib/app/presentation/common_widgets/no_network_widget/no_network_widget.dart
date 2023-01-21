import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_animations/no_internet_animation.dart';

class NoNetworkWidget extends StatelessWidget {
  const NoNetworkWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            // elevation: 0,
            title: SizedBox(
                height: 30.h,
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
              'No Internet Connection Found\nCheck Your Connection',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ));
  }
}
