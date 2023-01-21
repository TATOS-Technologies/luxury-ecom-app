// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brandslabels/app/controller/home_controller.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widget/home_banner_widget.dart';
import 'widget/home_brand_list_widget.dart';
import 'widget/home_most_popular_widget.dart';
import 'widget/home_tile_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  static List<String> homeTileIMG = [
    AppAsset.men,
    AppAsset.women,
    AppAsset.kids,
    AppAsset.accessories,
    AppAsset.shoes,
  ];
  static List<String> homeTileTitle = [
    'men',
    'women',
    'kids',
    'accessories',
    'shoes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldkey,
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top + 26.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 10.w, left: 24.w, right: 24.w),
                  // child: homeWidget()
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 60.h),
                        const HomeBrandLIstWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          children: List.generate(homeTileIMG.length, (index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: HomeTileWidget(
                                imageUrl: homeTileIMG[index],
                                title: homeTileTitle[index].toUpperCase(),
                                onTap: () {
                                  ///tile ontap action
                                },
                              ),
                            );
                          }),
                        ),
                        const HomeMostPopularWidget(),
                        HomeBannerWidget(imageUrl: AppAsset.homeBanner),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
