import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/theme/colors.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: appTileBorderColor, width: 1)),
        child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 48.h,
                    decoration: const BoxDecoration(
                        color: appColorButton2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(11),
                          topRight: Radius.circular(11),
                        )),
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 18.w),
                        child: CommonTextPoppins(
                          title,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: appColorPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.all(18.w),
                    child: formFieldWidget!,
                  ),
                ])));
  }
}
