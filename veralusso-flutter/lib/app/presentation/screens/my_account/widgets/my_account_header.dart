import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/theme/colors.dart';

class MyAccountHeader extends StatelessWidget {
  const MyAccountHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      color: profileTileBG,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: CommonTextPoppins(
            LanguageConstants.myAccountText.tr,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
      ),
    );
  }
}
