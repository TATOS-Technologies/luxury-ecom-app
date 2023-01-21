// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:avoirchic/app/controller/home_controller.dart';

class BrendListWidget extends GetView<HomeController> {
  final List<String> list;
  const BrendListWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 45.h,
        child: CarouselSlider.builder(
          itemCount: list.length,
          itemBuilder: (context, index, realIndex) {
            return Center(
                child: SizedBox(
                    height: 23.w,
                    width: 80.w,
                    child: Image.asset(
                      list[index],
                      fit: BoxFit.contain,
                    )));
          },
          options: CarouselOptions(
            
            autoPlay: true, 
            viewportFraction: 1 / 4),
        ));
  }
}
