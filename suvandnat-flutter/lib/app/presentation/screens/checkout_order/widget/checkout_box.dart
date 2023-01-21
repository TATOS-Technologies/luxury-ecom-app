// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/theme/colors.dart';

class CheckOutBox extends StatelessWidget {
  String? title;
  Widget? formFieldWidget;

  CheckOutBox({
    Key? key,
    this.formFieldWidget,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderGrey, width: 2)),
        child: Container(
            alignment: Alignment.center,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.w),
                    height: 40.w,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(11),
                          topRight: Radius.circular(11),
                        )),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CommonTextPoppins(
                        title,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.w),
                    child: formFieldWidget!,
                  ),
                ])));
  }
}
