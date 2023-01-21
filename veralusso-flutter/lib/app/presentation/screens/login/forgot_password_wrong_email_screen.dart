import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/forgot_password/forget_password_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class ForgetPasswordWrongEmailScreen extends StatelessWidget {
  ForgetPasswordWrongEmailScreen({Key? key}) : super(key: key);

  final ForgetPasswordMenuController forgetPasswordMenuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  LanguageConstants.accountDoesNotExist.tr,
                  style: AppTextStyle.textStyleUtils600(),
                ),
              ),
              const SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.forgotPasswordWrongEmailStart.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils16(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.writeAt.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils16(),
                      ),
                      Text(
                        ' ${forgetPasswordMenuController.emailController.value.text}',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtilsUnderLine16(),
                      ),
                    ],
                  ),
                  Text(
                    LanguageConstants.forgotPasswordWrongEmailEnd.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils16(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.writeAtText.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils16(),
                      ),
                      Text(
                        'care@sololuxury.com',
                        style: AppTextStyle.textStyleUtilsUnderLine16(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(RoutesConstants.dashboardScreen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    LanguageConstants.continueShopping.tr.toUpperCase(),
                    style: AppTextStyle.textStyleUtils600(
                        color: Colors.white, size: 13.5),
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
                  backgroundColor: blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    LanguageConstants.backToSignInScreen.tr.toUpperCase(),
                    style: AppTextStyle.textStyleUtils600(
                        color: Colors.white, size: 13.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
