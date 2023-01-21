import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/product_detail/product_detail_controller.dart';

import '../../../../theme/colors.dart';
import '../../../common_widget/common_text_poppins.dart';

class ExpandDetailWidget extends GetView<ProductDetailController> {
  final String? text;
  final Widget? child;

  const ExpandDetailWidget({this.text, this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(color: borderGrey),
          color: whiteColor,
          borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        iconColor: appColorPrimary,
        title: CommonTextPoppins(
          text,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: appColorPrimary,
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w), child: child),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
