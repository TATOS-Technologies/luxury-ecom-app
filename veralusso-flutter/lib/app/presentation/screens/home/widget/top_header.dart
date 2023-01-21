import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/home/home_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/colors.dart';

class TopHeader extends GetView<HomeController> {
  const TopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          margin: EdgeInsets.only(
              top: MediaQuery.of(Get.context!).viewPadding.top + 5.0,
              bottom: 5.0),
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1)),
          height: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    if (imgList.length > 1) carouselController.previousPage();
                  },
                  child: Image.asset(AppAsset.leftArrow, height: 10.0)),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 30,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                  ),
                  carouselController: carouselController,
                  items: imgList
                      .map((item) => Center(
                            child: CommonTextMontserrat(
                              item.toUpperCase(),
                              fontSize: 11.0,
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              InkWell(
                  onTap: () {
                    if (imgList.length > 1) carouselController.nextPage();
                  },
                  child: Image.asset(AppAsset.rightArrow1, height: 10.0)),
            ],
          ),
        ),
        Positioned(
          left: 120,
          right: 120,
          child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(Get.context!).viewPadding.top + 4.0,
            ),
            color: appBarDarkRed,
            height: 3.0,
          ),
        ),
        Positioned(
          left: 120.0,
          right: 120.0,
          bottom: 4.0,
          child: Container(
            color: appBarDarkRed,
            height: 3.0,
          ),
        ),
      ],
    );
  }
}
