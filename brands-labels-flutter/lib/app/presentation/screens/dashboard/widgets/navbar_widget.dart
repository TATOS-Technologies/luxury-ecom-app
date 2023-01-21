import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:brandslabels/app/controller/dashboard_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NavbarWidget extends GetView<DashboardController> {
  const NavbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 18,
              color: Colors.black.withOpacity(.3),
              offset: const Offset(0, 0))
        ]),
        height: 70.w,
        child: Center(
          child: SizedBox(
            height: 55.w,
            child: BottomNavyBar(
                backgroundColor: Colors.white,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                showElevation: false,
                selectedIndex: controller.tabController!.value.index,
                onItemSelected: (value) {
                  manageAppbarTab(value);
                  controller.tabController!.value.animateTo(value);
                },
                items: [
                  BottomNavyBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: SvgPicture.asset(
                          controller.tabController!.value.index == 0
                              ? AppAsset.homeSelected
                              : AppAsset.homeUnSelected,
                          color: darkBlue,
                        ),
                      ),
                      title: CommonTextPoppins(
                        LanguageConstants.homeText.tr,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                      activeColor: darkBlue,
                      textAlign: TextAlign.center),
                  BottomNavyBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: SvgPicture.asset(
                          controller.tabController!.value.index == 1
                              ? AppAsset.SearchSelected
                              : AppAsset.SearchUnSelected,
    
                          // color: darkBlue,
                        ),
                      ),
                      title: CommonTextPoppins(
                        LanguageConstants.searchText.tr,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                      activeColor: darkBlue,
                      textAlign: TextAlign.center),
                  BottomNavyBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: SvgPicture.asset(
                          controller.tabController!.value.index == 2
                              ? AppAsset.TagSelected
                              : AppAsset.TagUnSelected,
    
                          // color: darkBlue,
                        ),
                      ),
                      title: CommonTextPoppins(
                        LanguageConstants.designersText.tr,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                      activeColor: darkBlue,
                      textAlign: TextAlign.center),
                  BottomNavyBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: SvgPicture.asset(
                          controller.tabController!.value.index == 3
                              ? AppAsset.cartSelected
                              : AppAsset.cartUnSelected,
    
                          // color: darkBlue,
                        ),
                      ),
                      title: CommonTextPoppins(
                        LanguageConstants.cart.tr.toLowerCase().capitalize,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                      activeColor: darkBlue,
                      textAlign: TextAlign.center),
                  BottomNavyBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: SvgPicture.asset(
                          controller.tabController!.value.index == 4
                              ? AppAsset.userSelected
                              : AppAsset.userUnSelected,
    
                          // color: darkBlue,
                        ),
                      ),
                      title: CommonTextPoppins(
                        localStore.customerToken.toString() == ""
                            ? LanguageConstants.loginText.tr
                            : LanguageConstants.meText.tr,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                      activeColor: darkBlue,
                      textAlign: TextAlign.center),
                ]),
          ),
        ),
      ),
    );
  }

  void manageAppbarTab(int index) async {
    switch (index) {
      case 0:
        controller.appbarTitle.value = "";
        break;
      case 1:
        await localStore.getToken();
        controller.appbarTitle.value = LanguageConstants.searchText.tr;
        break;
      case 2:
        controller.appbarTitle.value = LanguageConstants.designersText.tr;

        break;
      case 3:
        controller.appbarTitle.value = LanguageConstants.shippingCart.tr; // LanguageConstants.cart.tr;
        break;
      case 4:
        controller.appbarTitle.value = LanguageConstants.loginText.tr;

        break;
    }
  }
}
