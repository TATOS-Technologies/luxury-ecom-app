import 'package:avoirchic/app/controller/forget_password_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/lang_directory/language_constant.dart';

class ForgotPasswordWrongEmailScreen extends StatelessWidget {
  ForgotPasswordWrongEmailScreen({Key? key}) : super(key: key);

  final ForgetPasswordMenuController forgetPasswordMenuController = Get.find();

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
                    onTap: () {},
                    child: Text(
                      LanguageConstants.accountDoesNotExist.tr,
                      style: AppTextStyle.textStyleUtilsUnderLine18(
                        color: avoirChickTheme,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.forgotPasswordWrongEmailStart.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400_16(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LanguageConstants.withText.tr,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.textStyleUtils400_16(),
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
                        style: AppTextStyle.textStyleUtils400_16(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LanguageConstants.writeAtText.tr,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.textStyleUtils400_16(),
                          ),
                          Text(
                            'care@avoir-chic.com',
                            style: AppTextStyle.textStyleUtilsUnderLine16(
                              color: avoirChickTheme,
                            ),
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.until((route) =>
                          route.settings.name == RoutesConstants.loginScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: appTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: CommonTextOpenSans(
                      LanguageConstants.backToSignInScreen.tr,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
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
