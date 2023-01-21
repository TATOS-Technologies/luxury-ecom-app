// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/const/app_style.dart';

class OrderDataWidget extends StatelessWidget {
  final String? text;
  final String? data;
  const OrderDataWidget({
    Key? key,
    this.text,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width / 3,
          child: Text(
            text ?? '',
            style: AppStyle.textStyleUtils400(size: 12.sp),
          ),
        ),
        Expanded(
          child: Text(
            data ?? "",
            style: AppStyle.textStyleUtils400(size: 12.sp),
          ),
        ),
      ],
    );
  }
}
