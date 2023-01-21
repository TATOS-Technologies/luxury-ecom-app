import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/my_account/my_account_information_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class NewsLettersDesign extends GetView<MyAccountInformationController> {
  const NewsLettersDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: borderGrey, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w),
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: blueTileColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  LanguageConstants.newsLetters.tr,
                  style: AppTextStyle.textStyleUtils500(
                      color: primary, size: 14.sp),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 40),
            child: Text(
              LanguageConstants.newsLettersContain.tr,
              style: AppTextStyle.textStyleUtils300_16(),
            ),
          ),
          Center(
            child: SizedBox(
              height: 35.w,
              width: 200.w,
              child: CommonThemeButton(
                onTap: () {
                  Get.toNamed(RoutesConstants.newsLetterScreen);
                },
                title: LanguageConstants.edit.tr,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
