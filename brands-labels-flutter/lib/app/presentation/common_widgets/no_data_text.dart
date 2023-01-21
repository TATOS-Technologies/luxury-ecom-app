import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          Text(
            showText ?? LanguageConstants.itSeemsWeHaveNothingToShowFor.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.normalRegular14,
          ),
          Text(
            textForQuery,
            textAlign: TextAlign.center,
            style: AppTextStyle.normalRegular14
                .copyWith(color: darkBlue, fontWeight: FontWeight.bold),
          ),
          Text(
            LanguageConstants.ifYouWouldLikeToHaveMoreInformationAbout.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.normalRegular14,
          ),
          Text(
            textForQuery,
            textAlign: TextAlign.center,
            style: AppTextStyle.normalRegular14
                .copyWith(color: darkBlue, fontWeight: FontWeight.bold),
          ),
          Text(
            LanguageConstants.thenPleaseCreateATicket.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.normalRegular14,
          ),
          const SizedBox(
            height: 30,
          ),
          CommonThemeButton(
            onTap: () async {
              await Get.toNamed(
                RoutesConstants.specialRequestScreen,
                arguments: [textForQuery, "category"],
              );
              onTap.call();
            },
           
            title: 
              LanguageConstants.createTicket.tr,
              
          ),
          const SizedBox(
            height: 10,
          ),
          CommonThemeButton(
            onTap: onTap,
           
            title:
              LanguageConstants.continueShopping.tr,
             
          ),
        ],
      ),
    );
  }
}
