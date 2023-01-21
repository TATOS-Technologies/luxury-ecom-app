import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/no_network_widget/no_network_widget.dart';
import 'package:solo_luxury/app/presentation/screens/cart/cart_screen.dart';
import 'package:solo_luxury/app/presentation/screens/dashboard/widget/app_bar.dart';
import 'package:solo_luxury/app/presentation/screens/dashboard/widget/get_drawer.dart';
import 'package:solo_luxury/app/presentation/screens/dashboard/widget/show_title_dialog.dart';

import 'widget/nav_icon_widget.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isConnected.value
        ? Scaffold(
            key: controller.scaffoldKey.value,
            backgroundColor: appColorAccent,
            drawer: const GetDrawer(),
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                TabBarView(
                    controller: controller.tabController?.value,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //TODO: PAGES
                      const HomeScreen(),
                      const BrandListPage(),
                      const SearchScreen(),
                      const MyAccountMenuPage(),
                      CartScreen(),
                    ]),
                const CommonAppBar(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: appColorPrimary,
              // extendedPadding: const EdgeInsets.symmetric(horizontal: 10),
              onPressed: () {
                if (localStore.customerToken.toString() == "") {
                  showTitleDialog(context);
                } else {
                  controller.clickChatEvent(context: context);
                }
              },
              child: SvgPicture.asset(AppAsset.svgLiveChat),
            ),
            bottomNavigationBar: Material(
              // elevation: 0.0,
              shadowColor: appSubscribeButtonColor,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: SizedBox(
                  height: 70.w,
                  child: BottomAppBar(
                    notchMargin: 0,
                    color: whiteColor,
                    shape: const CircularNotchedRectangle(),
                    child: TabBar(
                      onTap: (int index) async {
                        debugPrint("index: $index");

                        if (index == 2) {
                          Get.find<BrandController>().getBrandList();
                        }
                        manageAppbarTab(index);
                      },
                      tabs: [
                        Tab(
                          iconMargin: EdgeInsets.zero,
                          icon: NavIconWidget(
                            index: 0,
                            sectedIcon: AppAsset.homeSelected,
                            unSectedIcon: AppAsset.homeUnselcted,
                          ),
                        ),
                        Tab(
                          iconMargin: EdgeInsets.zero,
                          icon: NavIconWidget(
                            index: 1,
                            sectedIcon: AppAsset.tagSelected,
                            unSectedIcon: AppAsset.tagUnselected,
                          ),
                        ),
                        Tab(
                          iconMargin: EdgeInsets.zero,
                          icon: NavIconWidget(
                            index: 2,
                            sectedIcon: AppAsset.searchSelected,
                            unSectedIcon: AppAsset.searchUnselected,
                          ),
                        ),
                        Tab(
                          iconMargin: EdgeInsets.zero,
                          icon: NavIconWidget(
                            index: 3,
                            sectedIcon: AppAsset.userSelected,
                            unSectedIcon: AppAsset.userUnselected,
                          ),
                        ),
                        Tab(
                          iconMargin: EdgeInsets.zero,
                          icon: NavIconWidget(
                            index: 4,
                            sectedIcon: AppAsset.cartSelected,
                            unSectedIcon: AppAsset.cartUnselected,
                          ),
                        ),
                      ],
                      physics: const ClampingScrollPhysics(),
                      isScrollable: false,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.all(0.0),
                      labelPadding: EdgeInsets.zero,
                      indicatorColor: Colors.transparent,
                      controller: controller.tabController?.value,
                    ),
                  ),
                ),
              ),
            ))
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
        controller.appbarTitle.value = LanguageConstants.search1Text.tr;
        break;
      case 3:
        controller.appbarTitle.value = LanguageConstants.loginText.tr;
        break;
      case 4:
        controller.appbarTitle.value = LanguageConstants.cart.tr;

        break;
    }
  }
}
