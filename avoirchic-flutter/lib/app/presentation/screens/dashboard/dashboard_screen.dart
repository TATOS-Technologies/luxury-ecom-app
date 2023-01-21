import 'package:avoirchic/app/controller/dashboard_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/common_widgets/no_network_widget/no_network_widget.dart';
import 'package:avoirchic/app/presentation/screens/brand_list/brand_list_page.dart';
import 'package:avoirchic/app/presentation/screens/cart/cart_screen.dart';
import 'package:avoirchic/app/presentation/screens/dashboard/widgets/appbar_with_header.dart';
import 'package:avoirchic/app/presentation/screens/dashboard/widgets/drawer_widget.dart';
import 'package:avoirchic/app/presentation/screens/my_account/my_account_menu_screen.dart';
import 'package:avoirchic/app/presentation/screens/search/search_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../main/main.common.dart';
import '../../../theme/colors.dart';
import '../home/home_screen.dart';
import 'widgets/tab_icon_widget.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isConnected.value
        ? Scaffold(
            body: SafeArea(
              child: Scaffold(
                  key: controller.scaffoldkey,
                  drawer: const DrawerWidget(),
                  backgroundColor: Colors.transparent,
                  resizeToAvoidBottomInset: true,
                  body: Stack(children: [
                    TabBarView(
                        controller: controller.tabController.value,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          //TODO: PAGES
                          HomeScreen(),
                          BrandListPage(),
                          SearchScreen(),
                          MyAccountMenuPage(),
                          CartScreen()
                        ]),
                    const AppBarWithHeaderWidget(),
                    Align(
                      alignment: const Alignment(1, .4),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          width: 130.w,
                          height: 35.w,
                          child: Center(
                              child: CommonTextPoppins(
                            LanguageConstants.specialRequest.tr,
                            fontSize: 12.sp,
                            color: whiteColor,
                          )),
                        ),
                      ),
                    ),
                  ]),
                  bottomNavigationBar: ConvexAppBar(
                    backgroundColor: Colors.white,
                    elevation: 1,
                    height: 70.h,
                    top: -20,
                    curve: Curves.easeInOut,
                    style: TabStyle.custom,
                    items: List.generate(5,
                        (index) => TabItem(icon: TabIconWidget(index: index))),
                    onTap: (index) {
                      controller.tabController.value.animateTo(index);
                      manageAppbarTab(index);
                    },
                  )),
            ),
          )
        : const NoNetworkWidget());
  }

  void manageAppbarTab(int index) async {
    switch (index) {
      case 0:
        controller.appbarTitle.value = "";
        break;
      case 1:
        controller.appbarTitle.value = LanguageConstants.designersText.tr;

        break;
      case 2:
        await localStore.getToken();
        controller.appbarTitle.value = LanguageConstants.searchText.tr;

        break;
      case 3:
        controller.appbarTitle.value = LanguageConstants.loginText.tr;

        break;
      case 4:
        controller.appbarTitle.value =
            LanguageConstants.cart.tr.camelCase ?? '';

        break;
    }
  }
}
