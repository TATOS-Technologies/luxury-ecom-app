// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/core/utils/app_routes.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class NoDataProduct extends StatelessWidget {
  NoDataProduct(
      {Key? key,
      required this.child,
      required this.argument,
      required this.title})
      : super(key: key);

  Widget? child;
  String? argument;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          Text(
            title ?? LanguageConstants.noDataFound.tr,
            style: AppStyle.textStyleUtils500(color: appColorButton),
            textAlign: TextAlign.center,
          ),
          if (argument?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CommonTextPoppins(
                argument,
                textAlign: TextAlign.center,
                color: appColorButton,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          if (child != null) child!,
          CommonThemeButton(
            onTap: () {
              Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
            },
           title:
              LanguageConstants.continueShopping.tr,
              
          ),
        ],
      ),
    );
  }
}
