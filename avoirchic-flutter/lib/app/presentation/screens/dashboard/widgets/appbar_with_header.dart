import 'package:avoirchic/app/controller/dashboard_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../theme/colors.dart';

class AppBarWithHeaderWidget extends GetView<DashboardController> {
  const AppBarWithHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      width: double.infinity,
      height: 50.h,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      child: GetBuilder<DashboardController>(
        builder: (c) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (!(controller.scaffoldkey.currentState?.isDrawerOpen ??
                      false)) {
                    controller.scaffoldkey.currentState?.openDrawer();
                  }
                },
                child: SizedBox(
                  height: 30.w,
                  width: 30.w,
                  child: Center(child: SvgPicture.asset(AppAsset.menuButton)),
                ),
              ),
              controller.tabController.value.index == 0
                  ? SvgPicture.asset(
                AppAsset.appLogo,
                width: 160.w,
              )
                  : CommonTextPoppins(
                controller.appbarTitle.value,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                width: 30.w,
              ),
            ],
          );
        },
      ),
    );
  }
}
