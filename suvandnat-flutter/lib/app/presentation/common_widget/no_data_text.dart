import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class NoData extends StatelessWidget {
  final String? showText;
  final String textForQuery;
  final Function() onTap;

  const NoData(
      {Key? key,
      this.showText,
      required this.textForQuery,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          Text(
            showText ?? LanguageConstants.itSeemsWeHaveNothingToShowFor.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils400(size: 12.sp),
          ),
          Text(
            textForQuery,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils500(size: 12.sp)
                .copyWith(color: appColorPrimary, ),
          ),
          Text(
            LanguageConstants.ifYouWouldLikeToHaveMoreInformationAbout.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils400(size: 12.sp),
          ),
          Text(
            textForQuery,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils500(size: 12.sp)
                .copyWith(color: appColorPrimary, ),
          ),
          Text(
            LanguageConstants.thenPleaseCreateTicket.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils400(size: 12.sp),
          ),
          const SizedBox(
            height: 15,
          ),
          CommonThemeButton(
           onTap: () {
              Get.toNamed(
                RoutesConstants.specialRequestScreen,
                arguments: [textForQuery, "category"],
              );
            },

            title:   LanguageConstants.createTicket.tr,

          ),
          const SizedBox(
            height: 10,
          ),
          CommonThemeButton(
            onTap: onTap,
            title:LanguageConstants.continueShopping.tr,

          ),
          const SizedBox(height: 60,)
        ],
      ),
    );
  }
}
