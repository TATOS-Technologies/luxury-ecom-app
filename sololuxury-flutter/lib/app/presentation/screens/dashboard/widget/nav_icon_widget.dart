// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/controller/dashboard/dashboard_controller.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class NavIconWidget extends GetView<DashboardController> {
  int index;
  final String sectedIcon;
  final String unSectedIcon;

  NavIconWidget({
    Key? key,
    required this.index,
    required this.sectedIcon,
    required this.unSectedIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 40.w,
        width: 40.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: controller.tabController?.value.index == index
                ? appBarlightColor
                : Colors.transparent),
        child: Center(
          child: SizedBox(
            height: 22.w,
            width: 22.w,
            child: SvgPicture.asset(
              controller.tabController?.value.index == index
                  ? sectedIcon
                  : unSectedIcon,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
