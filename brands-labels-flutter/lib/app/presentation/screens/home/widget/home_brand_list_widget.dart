import 'package:brandslabels/app/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeBrandLIstWidget extends GetView<HomeController> {
  const HomeBrandLIstWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.grey.shade200, width: 1.w),
              bottom: BorderSide(color: Colors.grey.shade200, width: 1.w))),
      height: 50.h,
      width: double.infinity,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_rounded,
            size: 15.sp,
          ),
          Expanded(
              child: SizedBox(
          height: 120.w,
            width: double.infinity,
            child: CarouselSlider.builder(
                itemCount: controller.brandListIMG.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: SizedBox(
                      width: 90.w,
                      child: Center(
                        child: SizedBox(
                            height: 20.w,
                            child: Image.asset(
                             controller.brandListIMG[index],
                              fit: BoxFit.contain,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1 / 4,
                    enableInfiniteScroll: true,
                    autoPlayCurve: Curves.easeInOut,
                    pauseAutoPlayInFiniteScroll: false)))),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15.sp,
          )
        ],
      ),
    );
  }
}
