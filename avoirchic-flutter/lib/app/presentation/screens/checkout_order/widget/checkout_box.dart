import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckOutBox extends StatelessWidget {
  final String? title;
  final Widget? formFieldWidget;

  const CheckOutBox({
    Key? key,
    this.formFieldWidget,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: appBorderColor, width: 1)),
        child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            alignment: Alignment.centerLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CommonTextPoppins(
                      title,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  formFieldWidget!,
                ])));
  }
}
