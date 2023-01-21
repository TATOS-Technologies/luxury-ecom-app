import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/dashboard/dashboard_controller.dart';
import 'package:veralusso/app/presentation/common_widget/no_network_widget/no_network_widget.dart';
import 'package:veralusso/app/presentation/screens/dashboard/widget/appbar_with_header.dart';
import 'package:veralusso/app/presentation/screens/dashboard/widget/drawer_widget.dart';
import 'package:veralusso/app/presentation/screens/dashboard/widget/navbar_widget.dart';
import 'package:veralusso/app/presentation/screens/search/search_screen.dart';

import '../brand_list/brand_list_page.dart';
import '../cart/cart_screen.dart';
import '../home/home_screen.dart';
import '../my_account/my_account_menu_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  @override
  final DashboardController controller = Get.find();

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isConnected.value
        ? Scaffold(
            key: const Key('Scaffold'),
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                const AppBarWithHeaderWidget(),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top + 80),
                  child: Scaffold(
                    key: controller.scaffoldkey,
                    drawer: const DrawerWidget(),
                    body: TabBarView(
                        controller: controller.tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          //TODO: PAGES
                          HomeScreen(),
                          BrandListPage(),
                          SearchScreen(),
                          MyAccountMenuPage(),
                          CartScreen()
                        ]),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: NavbarWidget())
        : const NoNetworkWidget());
  }
}
