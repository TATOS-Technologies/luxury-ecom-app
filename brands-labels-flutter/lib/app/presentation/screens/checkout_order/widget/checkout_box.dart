// ignore_for_file: must_be_immutable

import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:flutter/material.dart';

import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        decoration:
            BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primary, width: 1)),
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
                      fontWeight: FontWeight.w500,
                      color: primary,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  formFieldWidget!,
                ])));
  }
}
