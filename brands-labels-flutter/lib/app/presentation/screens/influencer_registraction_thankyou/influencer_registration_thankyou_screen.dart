import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/lang_directory/language_constant.dart';

class InfluencerRegistrationThankYouScreen extends StatelessWidget {
  const InfluencerRegistrationThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(RoutesConstants.dashboardScreen);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          elevation: 0,
          backgroundColor: whiteColor,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        backgroundColor: whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LanguageConstants.thankYouForYourInterest.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400(
                      size: 18, color: blackColor.withOpacity(0.8)),
                ),
                const SizedBox(height: 15),
                Text(
                  LanguageConstants.oneOfOurTeamMembersWillBeInTouchSoon.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400(
                      size: 18, color: blackColor.withOpacity(0.8)),
                ),
                const SizedBox(height: 15),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: LanguageConstants
                            .forAnyAdditionalQueriesPleaseWriteTo.tr,
                        style: AppTextStyle.textStyleUtils400(
                            size: 18, color: blackColor.withOpacity(0.8)),
                      ),
                      TextSpan(
                        text: 'social@brands-labels.com',
                        style: AppTextStyle.textStyleUtils400(
                            size: 17, color: contentGrey),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse('mailto:social@brands-labels.com'));
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.offAndToNamed(RoutesConstants.dashboardScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: appBarPrimary,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
