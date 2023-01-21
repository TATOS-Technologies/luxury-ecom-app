// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/theme/colors.dart';

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
        decoration:
            BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: textFieldBoarderColor, width: 2)),
        child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            alignment: Alignment.centerLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.w),
                      child: CommonTextPoppins(
                        title,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  formFieldWidget!,
                ])));
  }
}
