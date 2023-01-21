import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:solo_luxury/app/core/utils/app_routes.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/theme/app_text_style.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class NoData extends StatelessWidget {
  final String? showText;
  final String textForQuery;
  final GestureTapCallback? onTap;

  const NoData(
      {Key? key,
      this.showText,
      required this.textForQuery,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          showText ?? LanguageConstants.itSeemsWeHaveNothingToShowFor.tr,
          textAlign: TextAlign.center,
          style: AppTextStyle.normalRegular14,
        ),
        Text(
          textForQuery,
          textAlign: TextAlign.center,
          style: AppTextStyle.normalRegular14
              .copyWith(color: appColor, fontWeight: FontWeight.bold),
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
              .copyWith(color: appColor, fontWeight: FontWeight.bold),
        ),
        Text(
          LanguageConstants.thenPleaseCreateTicket.tr,
          textAlign: TextAlign.center,
          style: AppTextStyle.normalRegular14,
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            Get.toNamed<dynamic>(
              RoutesConstants.specialRequesScreen,
              arguments: [textForQuery, "category"],
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: appColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: CommonTextOpenSans(
            LanguageConstants.createTicket.tr,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13.5,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: appColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: CommonTextOpenSans(
            LanguageConstants.continueShopping.tr,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13.5,
          ),
        ),
      ],
    );
  }
}
