import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_button.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

//class InfluencerRegistrationThankYouScreen extends GetView<InfluencerRegistrationThankyouController> {
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
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.thankyouAvoirchic.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils400(
                        color: blackColor.withOpacity(0.8),
                        size: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      LanguageConstants.oneOfOurTeamMembersWillBeInTouchSoon.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils400(
                        color: blackColor.withOpacity(0.8),
                        size: 18,
                      ),
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
                              color: blackColor.withOpacity(0.8),
                              size: 18,
                            ),
                          ),
                          TextSpan(
                            text: 'social@avoir-chic.com',
                            style: AppTextStyle.textStyleUtils400(
                                size: 17, color: contentGrey),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(
                                    Uri.parse('mailto:social@avoir-chic.com'));
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CommonButton(
                      color: appBorderColor,
                      buttonType: ButtonType.ElevatedButton,
                      onPressed: () {
                        Get.offAndToNamed(RoutesConstants.dashboardScreen);
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: CommonTextPoppins(
                        LanguageConstants.continueShopping.tr,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
