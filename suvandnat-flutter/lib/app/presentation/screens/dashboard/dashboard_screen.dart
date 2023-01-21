import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hidable/hidable.dart';
import 'package:suvandnat/app/controller/dashboard/dashboard_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/no_network_widget/no_network_widget.dart';
import 'package:suvandnat/app/presentation/screens/brand_list/brand_list_page.dart';
import 'package:suvandnat/app/presentation/screens/cart/cart_screen.dart';
import 'package:suvandnat/app/presentation/screens/dashboard/widgets/drawer_widget.dart';
import 'package:suvandnat/app/presentation/screens/home/home_screen.dart';
import 'package:suvandnat/app/presentation/screens/search/search_screen.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../my_account/my_account_menu_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({Key? key}) : super(key: key);

  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isConnected.value
        ? CommonBacground(
            child: Scaffold(
              key: controller.scaffoldkey,
              drawer: const DrawerWidget(),
              backgroundColor: Colors.transparent,
              appBar: buildAppbar(),
              resizeToAvoidBottomInset: true,
              body: Stack(
                children: [
                  TabBarView(
                      controller: controller.tabController?.value,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        //TODO: PAGES
                        HomeScreen(),
                        SearchScreen(),
                        BrandListPage(),
                        CartScreen(),
                        MyAccountMenuPage(),
                      ]),
                  Align(
                    alignment: const Alignment(1, .4),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: cartBrownColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        height: 35.w,
                        width: 111.w,
                        child: Center(
                          child: CommonTextPoppins(
                            LanguageConstants.createTicket.tr,
                            color: whiteColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Hidable(
                preferredWidgetSize: Size.fromHeight(90.w),
                controller: controller.scrollController,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Container(
                      width: 327.w,
                      height: 55.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.2),
                                offset: const Offset(0, 5),
                                blurRadius: 20)
                          ]),
                      child: TabBar(
                        onTap: (value) {
                          manageAppbarTab(value);
                        },
                        indicatorColor: Colors.transparent,
                        indicatorWeight: .1,
                        controller: controller.tabController?.value,
                        tabs: [
                          Tab(
                            child: controller.tabController?.value.index == 0
                                ? SvgPicture.asset(AppAsset.homeIconFilled)
                                : SvgPicture.asset(AppAsset.homeIcon),
                          ),
                          Tab(
                            child: controller.tabController?.value.index == 1
                                ? SvgPicture.asset(AppAsset.catogeryIconFilled)
                                : SvgPicture.asset(AppAsset.catogeryIcon),
                          ),
                          Tab(
                            child: controller.tabController?.value.index == 2
                                ? SvgPicture.asset(AppAsset.flowerIconFilled)
                                : SvgPicture.asset(AppAsset.flowerIcon),
                          ),
                          Tab(
                            child: controller.tabController?.value.index == 3
                                ? SvgPicture.asset(AppAsset.starIconFilled)
                                : SvgPicture.asset(AppAsset.starIcon),
                          ),
                          Tab(
                            child: controller.tabController?.value.index == 4
                                ? SvgPicture.asset(AppAsset.babyIconFilled)
                                : SvgPicture.asset(AppAsset.babyIcon),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          )
        : const NoNetworkWidget());
  }

  PreferredSize buildAppbar() {
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
        controller.appbarTitle.value = 'Cart'; // LanguageConstants.cart.tr;
        break;
      case 4:
        controller.appbarTitle.value = LanguageConstants.loginText.tr;

        break;
    }
  }
}
