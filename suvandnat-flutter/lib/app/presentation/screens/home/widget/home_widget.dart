// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class HomeCategoryWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String image;
  const HomeCategoryWidget({
    Key? key,
    required this.title,
    required this.color,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    offset: const Offset(1.5, 1.5),
                    blurRadius: 11)
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: EdgeInsets.only(top: 10.w),
              height: 60.w,
              width: 60.w,
              color: Colors.white,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.w),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: color),
                      ),
                    ),
                  ),
                  Center(child: Image.asset(image)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          style: AppTextStyle.textStyleUtils400_12(),
        )
      ],
    );
  }
}
