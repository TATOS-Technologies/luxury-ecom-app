import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controller/dashboard/dashboard_controller.dart';
import '../../../../core/const/app_style.dart';
import '../../../../theme/app_asset.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWithHeaderWidget extends GetView<DashboardController> {
  const AppBarWithHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          appBar(),
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      height: const Size.fromHeight(70).height,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (!(controller.scaffoldkey.currentState?.isDrawerOpen ??
                      false)) {
                    controller.scaffoldkey.currentState?.openDrawer();
                  } else {
                    Navigator.pop(Get.context!);
                  }
                },
                child: SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Center(
                    child: SvgPicture.asset(
                      AppAsset.appMenu,
                      height: 14.0,
                      width: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          controller.tabController?.index == 0
              ? SvgPicture.asset(
                  AppAsset.appLogo,
                  height: 32.h,
                )
              : Text(controller.appbarTitle.value,
                  style: AppStyle.commonTextStyle20400(size: 16.sp)
                      .copyWith(fontWeight: FontWeight.w600)),
          const SizedBox()
        ],
      ),
    );
  }
}
