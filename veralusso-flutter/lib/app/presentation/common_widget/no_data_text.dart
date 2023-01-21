import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

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
    return Column(
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
              .copyWith(color: blackColor, fontWeight: FontWeight.bold),
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
              .copyWith(color: blackColor, fontWeight: FontWeight.bold),
        ),
        Text(
          LanguageConstants.thenPleaseCreateTicket.tr,
          textAlign: TextAlign.center,
          style: AppTextStyle.normalRegular14,
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    RoutesConstants.specialRequestScreen,
                    arguments: [textForQuery, "category"],
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: blackColor, width: 2)),
                ),
                child: Text(
                  LanguageConstants.createTicket.tr,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyle.textStyleUtils400(),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: blackColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: blackColor, width: 2)),
                ),
                child: Text(
                  LanguageConstants.continueShopping.tr,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyle.textStyleUtils400(color: whiteColor),
                ),
              ),
            ],
          ),
        ),
       
      ],
    );
  }
}
