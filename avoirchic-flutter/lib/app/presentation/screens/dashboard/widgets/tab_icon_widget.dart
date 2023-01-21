import 'package:avoirchic/app/controller/dashboard_controller.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TabIconWidget extends GetView<DashboardController> {
  final int index;
  const TabIconWidget({Key? key, required this.index}) : super(key: key);

  static List<String> navIcon = [
    AppAsset.navHome,
    AppAsset.navTag,
    AppAsset.navSearch,
    AppAsset.navProfile,
    AppAsset.navCart,
  ];

  @override
  Widget build(BuildContext context) {
    if (controller.tabController.value.index == index) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(18.w),
          height: 56.w,
          width: 56.w,
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 5.w),
                    blurRadius: 12,
                    color: blackColor.withOpacity(.25))
              ]),
          child: SvgPicture.asset(
            navIcon[index],
            color: whiteColor,
          ),
        ),
      );
    } else {
      return SvgPicture.asset(
        navIcon[index],
        color: primary,
      );
    }
  }
}
