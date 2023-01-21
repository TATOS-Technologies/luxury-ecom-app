import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NoData extends StatelessWidget {
  final String? showText;
  final String textForQuery;

  const NoData({Key? key, this.showText, required this.textForQuery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          Text(
            showText ?? '',
            style: AppTextStyle.normalRegular14.copyWith(color: primary),
          ),
          SizedBox(
            height: 30.w,
          ),
          CommonThemeButton(
            onTap: () {
              Get.toNamed(
                RoutesConstants.specialRequesScreen,
                arguments: [textForQuery, "category"],
              );
            },
            title: LanguageConstants.createTicket.tr,
          ),
          SizedBox(
            height: 15.w,
          ),
          
        ],
      ),
    );
  }
}
