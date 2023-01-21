// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class EmptyDataWidget extends StatelessWidget {
  final Function? backtoShop;
  const EmptyDataWidget({
    Key? key,
    this.backtoShop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          SizedBox(
            height: 30.w,
          ),
          Text(
            LanguageConstants.youHaveNoProductsInYourWishList.tr,
            style: AppTextStyle.textStyleUtils400(),
          ),
          SizedBox(
            height: 30.w,
          ),
          CommonThemeButton(
            onTap: () {
              if (backtoShop != null) {
                backtoShop!("true");
              } else {
                Get.offAndToNamed(RoutesConstants.dashboardScreen);
              }
            },
            isOutLined: true,
            buttonColor: whiteColor,
            textColor: blackColor,
            title: LanguageConstants.continueShopping.tr,
          ),
          SizedBox(
            height: 90.w,
          ),
        ],
      ),
    );
  }
}
