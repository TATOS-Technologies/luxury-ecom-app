import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/const/app_style.dart';

import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_button.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';

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
        //backgroundColor: appColorAccent,
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
                  LanguageConstants.thankYouInfluencer1.tr,
                  textAlign: TextAlign.center,
                  style: AppStyle.textStyleUtils600(),
                ),
                const SizedBox(height: 15),
                Text(
                  LanguageConstants.thankYouInfluencer2.tr,
                  textAlign: TextAlign.center,
                  style: AppStyle.textStyleUtils600(),
                ),
                const SizedBox(height: 15),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: LanguageConstants
                            .forAnyAdditionalQueriesPleaseWriteTo.tr,
                        style: AppStyle.textStyleUtils600(),
                      ),
                      TextSpan(
                        text: 'social@veralusso.com',
                        style: AppStyle.linkTextStyleUtils600(),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse('mailto:social@veralusso.com'));
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CommonButton(
                  buttonType: ButtonType.OutlinedButton,
                  onPressed: () {
                    Get.offAndToNamed(RoutesConstants.dashboardScreen);
                  },
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),
                  color: Colors.black,
                  child: CommonTextMontserrat(
                    LanguageConstants.continueShopping.tr,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
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
