import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/core/const/app_constants.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/theme/colors.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';

class PurchaseCodeBannerWidget extends StatelessWidget {
  const PurchaseCodeBannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 30.w),
        width: double.infinity,
        color: homeTileBackground,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: LanguageConstants.getText.tr,
            style: AppStyle.textStyleUtils400(),
            
            children: <TextSpan>[
              TextSpan(
                text: ' ${LanguageConstants.tenPercentOffText.tr}',
                style: AppStyle.textStyleUtils500(),
              ),
              TextSpan(
                text: LanguageConstants.onYourFirstPurchaseUseCouponText.tr,
                style: AppStyle.textStyleUtils400(),
              ),
              TextSpan(
                text: ' ${AppConstants.couponCode} ',
                style: AppStyle.textStyleUtils500(),
              ),
              TextSpan(
                text: LanguageConstants.termsConditionsApply.tr,
                style: AppStyle.textStyleUtils400(),
              ),
            ],
          ),
        ));
  }
}
