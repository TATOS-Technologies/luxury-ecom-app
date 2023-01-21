import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class ForgetPasswordMenuScreen extends StatelessWidget {
  const ForgetPasswordMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  style: AppTextStyle.textStyleUtils600(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                LanguageConstants.forgetPasswordContain.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400_16(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.writeAt.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400_16(),
                  ),
                  Text(
                    'care@veralusso.com',
                    style: AppTextStyle.textStyleUtilsUnderLine16(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
                  style: const TextStyle(
                      fontFamily: AppConstants.fontMontserrat,
                      color: blackColor),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  Get.until((route) =>
                      route.settings.name == RoutesConstants.loginScreen);
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
                  LanguageConstants.backToSignInScreen.tr,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontFamily: AppConstants.fontMontserrat,
                      color: blackColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
