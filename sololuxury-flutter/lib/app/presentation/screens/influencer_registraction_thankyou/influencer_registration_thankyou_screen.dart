import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

//class InfluencerRegistrationThankYouScreen extends GetView<InfluencerRegistrationThankyouController> {
class InfluencerRegistrationThankYouScreen extends StatelessWidget {
  const InfluencerRegistrationThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          elevation: 0,
          backgroundColor: backGroundColor,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        backgroundColor: appColorAccent,
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
                  LanguageConstants.thankYouForYourInterestText.tr,
                  textAlign: TextAlign.center,
                  style: AppStyle.textStyleUtils600(
                      size: 18, color: blackColor.withOpacity(0.8)),
                ),
                const SizedBox(height: 15),
                Text(
                  LanguageConstants.oneOfOurTeamMembersWillBeInTouchSoon.tr,
                  textAlign: TextAlign.center,
                  style: AppStyle.textStyleUtils600(
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
                        style: AppStyle.textStyleUtils600(
                            size: 18, color: blackColor.withOpacity(0.8)),
                      ),
                      TextSpan(
                        text: 'social@sololuxury.com',
                        style: AppStyle.textStyleUtils600(size: 17),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse('mailto:social@sololuxury.com'));
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
                  },
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
