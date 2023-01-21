import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/controller/forget_password_controller.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';

class ForgotPasswordWrongEmailScreen extends StatelessWidget {
  ForgotPasswordWrongEmailScreen({Key? key}) : super(key: key);

  final ForgetPasswordMenuController forgetPasswordMenuController = Get.find();

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
                  LanguageConstants.accountDoesNotExist.tr,
                  style: AppTextStyle.textStyleUtilsUnderLine18(
                      color: darkBlue, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.forgotPasswordWrongEmailStart.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.withText.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400(),
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
                    style: AppTextStyle.textStyleUtils400(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${LanguageConstants.writeAt.tr}  ',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400(),
                      ),
                      Text(
                        'care@sololuxury.com',
                        style: AppTextStyle.textStyleUtilsUnderLine16(color: darkBlue),
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
                  backgroundColor: darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    LanguageConstants.continueShopping.tr.toUpperCase(),
                    // style: textStyleUtils18(),
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
                  backgroundColor: darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    LanguageConstants.backToSignInScreen.tr.toUpperCase(),
                    // style: textStyleUtils18(),
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
    );
  }

}
