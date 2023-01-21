import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_routes.dart';

class TrackYourTicketNoDataFound extends StatelessWidget {
  const TrackYourTicketNoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        child: Center(
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
                "${LanguageConstants.pleaseTryWithAnotherEmailAddress.tr} \n${LanguageConstants.orWriteEmail.tr}",
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400(),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(RoutesConstants.dashboardScreen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: appTextColor,
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
          ),
        ),
      ),
    );
  }
}
