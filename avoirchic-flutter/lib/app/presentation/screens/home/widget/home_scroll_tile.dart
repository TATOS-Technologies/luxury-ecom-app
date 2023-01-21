// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:avoirchic/app/controller/home_controller.dart';
import 'package:avoirchic/app/theme/colors.dart';

class HomeScrollTile extends GetView<HomeController> {
  final String imageUrl;
  final PageController pageController;
  const HomeScrollTile({
    Key? key,
    required this.imageUrl,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 166.w,
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: 2,
              itemBuilder: (context, index) {
                return SizedBox(
                    height: 166.w,
                    width: 327.w,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.fitHeight,
                    ));
              },
            ),
            Align(
              alignment: const Alignment(0, .8),
              child: SmoothPageIndicator(
                effect: WormEffect(
                    dotHeight: 7.w, dotWidth: 7.w, activeDotColor: whiteColor),
                count: 2,
                controller: pageController,
              ),
            )
          ],
        ));
  }
}
