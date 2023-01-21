import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/dashboard/dashboard_controller.dart';
import 'package:suvandnat/app/controller/home/home_controller.dart';
import 'package:suvandnat/app/presentation/screens/home/widget/home_screen_widget.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: controller.scaffoldkey,
          backgroundColor: Colors.transparent,
          body: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top + 5.0),
                  child: SingleChildScrollView(
                      controller: dashboardController.scrollController,
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const HomeScreenWidget()),
                ),
              ],
            ),
          ),
        );
  }
}
