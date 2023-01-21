import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class TrackYourTicketNoDataFound extends StatelessWidget {
  const TrackYourTicketNoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageConstants
                  .weCannotFindAnyRequestAssociatedWithThisEmail.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils400(),

            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              LanguageConstants.pleaseTryWithAnotherEmailAddress.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils400(),

            ),
            OutlinedButton(
              onPressed: () {
                Get.offAllNamed(RoutesConstants.dashboardScreen);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: blackColor.withOpacity(1),
                side: BorderSide(
                  width: 1.0,
                  color: blackColor.withOpacity(
                    1,
                  ),
                ),
                shape: const StadiumBorder(),
              ),
              child: Text(
                LanguageConstants.continueShopping.tr,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyle.textStyleUtils400(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
