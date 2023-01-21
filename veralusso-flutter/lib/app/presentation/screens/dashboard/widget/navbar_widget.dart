import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:veralusso/app/controller/dashboard/dashboard_controller.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class NavbarWidget extends GetView<DashboardController> {
  NavbarWidget({
    Key? key,
  }) : super(key: key);
  @override
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.h,
      child: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: TabBar(
          onTap: (int index) async {
            debugPrint("index: $index");
            if (index == 0) {
              controller.appbarTitle.value = LanguageConstants.homeText.tr;
            } else if (index == 1) {
              controller.appbarTitle.value =  LanguageConstants.designerBrands.tr;
            } else if (index == 2) {
              controller.appbarTitle.value =  LanguageConstants.searchText.tr;
            } else if (index == 3) {
              controller.appbarTitle.value =  LanguageConstants.loginText.tr;
            } else {
              controller.appbarTitle.value = LanguageConstants.cartLabel.tr;
            }
          },
          tabs: [
            Tab(
              iconMargin: EdgeInsets.zero,
              child: SvgPicture.asset(AppAsset.homeNav,
                  alignment: Alignment.center,
                  height: 22.w,
                  width: 22.w,
                  fit: BoxFit.fitWidth),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: SvgPicture.asset(AppAsset.tagNav,
                  alignment: Alignment.center,
                  height: 22.w,
                  width: 22.w,
                  fit: BoxFit.fitWidth),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: SvgPicture.asset(AppAsset.searchNav,
                  alignment: Alignment.center,
                  height: 22.w,
                  width: 22.w,
                  fit: BoxFit.fitWidth),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: SvgPicture.asset(AppAsset.userNav,
                  alignment: Alignment.center,
                  height: 22.w,
                  width: 22.w,
                  fit: BoxFit.fitWidth),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              child: SvgPicture.asset(AppAsset.cartNav,
                  alignment: Alignment.center,
                  height: 22.w,
                  width: 22.w,
                  fit: BoxFit.fitWidth),
            ),
          ],
          labelStyle: AppTextStyle.textStyleUtils400(size: 10),
          physics: const ClampingScrollPhysics(),
          isScrollable: false,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.all(0.0),
          labelPadding: EdgeInsets.zero,
          indicatorColor: Colors.black,
          indicator: UnderlineTabIndicator(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 4.0,
            ),
            insets: EdgeInsets.fromLTRB(17.w, 0.0, 17.w, 74.w),
          ),
          controller: controller.tabController,
        ),
      ),
    );
  }
}
