import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_routes.dart';

class ForgetPasswordMenuScreen extends StatelessWidget {
  const ForgetPasswordMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(color: appBGColor),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // controller.getForgetPasswordResponse();
                    },
                    child: Text(
                      LanguageConstants.pleaseCheckYourInbox.tr,
                      style: AppTextStyle.textStyleUtilsUnderLine18(
                          color: blue367587),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    LanguageConstants.forgetPasswordContain.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.writeAtText.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400(),
                      ),
                      Text(
                        'care@avoir-chic.com',
                        style: AppTextStyle.textStyleUtilsUnderLine16(
                          color: avoirChickTheme,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(RoutesConstants.dashboardScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: avoirChickTheme,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10),
                      child: Text(
                        LanguageConstants.continueShopping.tr,
                        style: AppTextStyle.textStyleUtils600(
                          color: Colors.white,
                          size: 13.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.until((route) =>
                          route.settings.name == RoutesConstants.loginScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: avoirChickTheme,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10),
                      child: Text(
                        LanguageConstants.backToSignInScreen.tr,
                        style: AppTextStyle.textStyleUtils600(
                          color: Colors.white,
                          size: 13.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
