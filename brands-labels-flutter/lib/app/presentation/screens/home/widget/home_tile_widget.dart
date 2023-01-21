import 'package:brandslabels/app/controller/home_controller.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeTileWidget extends GetView<HomeController> {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;
  const HomeTileWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageUrl), fit: BoxFit.cover)),
        height: 298.h,
        width: 327.w,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 30.h,
            width: 117.w,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.black.withOpacity(.64)),
            child: Center(
              child: Text(title,
                  style: AppTextStyle.normalRegular12
                      .copyWith(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
