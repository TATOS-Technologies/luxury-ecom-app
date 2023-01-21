import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/dashboard/dashboard_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';

import '../../../../theme/app_asset.dart';

class BuildAppbar extends GetView<DashboardController> {
  const BuildAppbar({Key? key}) : super(key: key);

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset(
                  AppAsset.appMenuIcon,
                  height: 14,
                  width: 14,
                ),
              ),
            ),
            controller.tabController?.value.index == 0
                ? SizedBox(
              height: 30.h,
              child: SvgPicture.asset(
                AppAsset.appLogo,
                color: Colors.black,
              ),
            )
                : CommonTextPoppins(
              controller.appbarTitle.value,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              width: 40.w,
            )
          ],
        ),
      ),
    );
  }
}
