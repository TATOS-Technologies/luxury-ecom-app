import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageConstants.aboutUsText.tr,
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(color: appBGColor),
          ),
          Column(
            children: [
              // commonAppbar(
              //   appBarColor: Colors.transparent,
              // ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          LanguageConstants.aboutUsTitleavoirchic.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(size: 12.sp),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          LanguageConstants.aboutUsContain.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(size: 12.sp),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          LanguageConstants.aboutUsContain1.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(size: 12.sp),
                        ),
                        // SizedBox(height: 8),
                        const SizedBox(height: 18),
                        Text(
                          LanguageConstants.aboutUsContain2.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(size: 12.sp),
                        ),
                        const SizedBox(height: 18),

                        Text(
                          LanguageConstants.aboutUsContain3.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(size: 12.sp),
                        ),
                        const SizedBox(height: 18),

                        Text(
                          LanguageConstants.aboutUsContain4.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(size: 12.sp),
                        ),
                        const SizedBox(height: 18),

                        Text(
                          LanguageConstants.aboutUsContain5.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(size: 12.sp),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
