import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../theme/app_asset.dart';
import 'home_text_banner.dart';
import 'home_widget.dart';


class HomeScreenWidget extends GetView<HomeController> {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.w),
          child: const Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeCategoryWidget(
              image: AppAsset.all,
              color: const Color(0xffEFD1C5),
              title: LanguageConstants.allText.tr,
            ),
            HomeCategoryWidget(
              image: AppAsset.boys,
              color: const Color(0xffB7C7F0),
              title: LanguageConstants.boysText.tr,
            ),
            HomeCategoryWidget(
              image: AppAsset.girls,
              color: const Color(0xffE5D5F0),
              title: LanguageConstants.girlsText.tr,
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 327.w,
          height: 318.w,
          child: Image.asset(AppAsset.home1),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 327.w,
          height: 336.w,
          child: Image.asset(
            AppAsset.home2,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 327.w,
          height: 318.w,
          child: Image.asset(
            AppAsset.home3,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 327.w,
          height: 180.w,
          child: Image.asset(
            AppAsset.brands,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 327.w,
          height: 318.w,
          child: Image.asset(
            AppAsset.home4,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        HomeTextBanner(
            holeIsLeft: false,
            text:
            '${LanguageConstants.weBeatAnyPriceText.tr} ${LanguageConstants.weAimtoBringYouBest.tr}'),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 327.w,
          height: 256.w,
          child: Image.asset(
            AppAsset.home5,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        HomeTextBanner(
            holeIsLeft: true,
            text:
            '${LanguageConstants.weBeatAnyPriceText.tr} ${LanguageConstants.weAimtoBringYouBest.tr}'),
        SizedBox(
          height: 90.h,
        ),
      ],
    );
  }
}