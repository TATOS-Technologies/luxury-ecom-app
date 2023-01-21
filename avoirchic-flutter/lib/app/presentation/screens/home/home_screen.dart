import 'package:avoirchic/app/controller/home_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widget/brand_list_widget.dart';
import 'widget/home_button_list_widget.dart';
import 'widget/home_scroll_tile.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  static List<String> list1=[
    'assets/images/brands/chloe.png',
    'assets/images/brands/kenzo.png',
    'assets/images/brands/prada.png',
    'assets/images/brands/celine.png',
    'assets/images/brands/moschino.png'
  ];
  static List<String> list2=[
    'assets/images/brands/canada_goose.png',
    'assets/images/brands/diesel.png',
    'assets/images/brands/lanvin.png',
    'assets/images/brands/alexander_mcqueen.png',
    'assets/images/brands/balmain_paris.png'
  ];
  static List<String> list3=[
    'assets/images/brands/birkenstock.png',
    'assets/images/brands/chloe.png',
    'assets/images/brands/CanadaGoose.png',
    'assets/images/brands/converse.png',
    'assets/images/brands/comme_des_garcons.png'
  ];
  static List<String> list4=[
    'assets/images/brands/armani_jeans.png',
    'assets/images/brands/dr_martens.png',
    'assets/images/brands/dsquard.png',
    'assets/images/brands/fred_perry.png',
    'assets/images/brands/golden-goose-logo-directory.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                Container(
                  height: Get.height,
                  margin: const EdgeInsets.only(
                    top: 0,
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    child: //controller.homePageModel.value.content ==null? Container():
                        SafeArea(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60.w,
                          ),
                          Container(
                              color: primary,
                              width: double.infinity,
                              height: 36.w,
                              child: Center(
                                child: CommonTextPoppins(
                                  'Avoir Chic Giving - Improves Lives with every purchase',
                                  fontSize: 12.sp,
                                  color: whiteColor,
                                ),
                              )),
                          SizedBox(
                            height: 6.h,
                          ),
                          SizedBox(
                              width: 327.w,
                              child: Divider(
                                height: 1,
                                color: Colors.grey.shade400,
                              )),
                           BrendListWidget(list: list1),
                          SizedBox(
                              height: 1,
                              width: 327.w,
                              child: Divider(
                                color: Colors.grey.shade400,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          HomeScrollTile(
                              pageController: controller.banner1Controller,
                              imageUrl: AppAsset.brandImage),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          SizedBox(
                              width: 327.w,
                              child: Divider(
                                height: 1,
                                color: Colors.grey.shade400,
                              )),
                           BrendListWidget(list: list2),
                          SizedBox(
                              height: 1,
                              width: 327.w,
                              child: Divider(
                                color: Colors.grey.shade400,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          HomeScrollTile(
                            imageUrl: AppAsset.productImage,
                            pageController: controller.banner2Controller,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const HomwButtonListWidget(),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 327.w,
                            child: Divider(
                              height: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          BrendListWidget(list: list3),
                          SizedBox(
                            height: 1,
                            width: 327.w,
                            child: Divider(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            children: List.generate(4, (index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 30.h),
                                child: SizedBox(
                                  width: 327.w,
                                  child: Image.asset(
                                    'assets/images/homeImage$index.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(
                              width: 327.w,
                              child: Divider(
                                height: 1,
                                color: Colors.grey.shade400,
                              )),
                          BrendListWidget(list:list4),
                          SizedBox(
                              height: 1,
                              width: 327.w,
                              child: Divider(
                                color: Colors.grey.shade400,
                              )),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
