import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'widget/get_drawer_view.dart';
import 'widget/home_appbar.dart';
import 'widget/most_popular_widget.dart';
import 'widget/top_header.dart';
import 'package:veralusso/app/controller/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  final HomeController controller = Get.find();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: const Key('Scaffold'),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black))),
                height: 38.w,
                child: Center(
                    child: Text(LanguageConstants.changeWorldWithPurchase.tr)),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: SizedBox(
                  height: 416.h,
                  width: 327.w,
                  child: Stack(children: [
                    DefaultTabController(
                        length: controller.list.length,
                        child: TabBarView(
                          controller: controller.bannerController,
                          children: List.generate(
                              controller.bannerController.length, (index) {
                            return Container(
                              height: 416.h,
                              width: 327.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(AppAsset.getBanner(index)),
                                fit: BoxFit.cover,
                              )),
                            );
                          }),
                        )),
                    Align(
                      alignment: const Alignment(.9, .9),
                      child: TabPageSelector(
                        controller: controller.bannerController,
                        selectedColor: Colors.black,
                      ),
                    )
                  ]),
                ),
              ),
              // const VerticalBannerList(),
              // const Divider(),
              // const OthersViewedWidget(),
              const Divider(),
              Obx(
                () => controller.isLoading.value
                    ?  SpinKitThreeBounce(
                      size: 18.w,
                        color: blackColor,
                      )
                    : Column(
                        children: List.generate(
                          controller.homeTileModel.length,
                          (index) => controller.menuModel!.value
                                      .childrenData![index].isActive ??
                                  false
                              ? MostPopularWidget(
                                  id: controller
                                      .menuModel!.value.childrenData![index].id
                                      .toString(),
                                  title: controller.menuModel!.value
                                      .childrenData![index].name
                                      .toString(),
                                  productModel: controller.homeTileModel[index],
                                  isEmpty: controller
                                          .homeTileModel[index]!.totalCount ==
                                      0,
                                )
                              : Container(),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalBannerList extends StatelessWidget {
  const VerticalBannerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          3,
          (index) => Container(
                margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                height: 416.h,
                width: 327.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(AppAsset.getBanner(index)),
                  fit: BoxFit.cover,
                )),
              )),
    );
  }
}

class AppbarWithHeader extends StatelessWidget {
  const AppbarWithHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopHeader(),
        HomeAppBar(), /* bottomHeader()*/
      ],
    );
  }
}

class GetDrawer extends GetView<HomeController> {
  const GetDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width,
        child: Drawer(
            child: SizedBox(
          width: Get.width,
          child: const GetDrawerView(),
        )));
  }
}
