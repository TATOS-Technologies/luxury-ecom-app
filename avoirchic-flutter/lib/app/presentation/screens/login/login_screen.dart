import 'dart:io';

import 'package:avoirchic/app/controller/login_controller.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/screens/login/widgets/email_textform_field.dart';
import 'package:avoirchic/app/presentation/screens/login/widgets/password_textform_field.dart';
import 'package:avoirchic/app/presentation/screens/login/widgets/signin_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBGColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),

            physics: const BouncingScrollPhysics(),
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.w,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LanguageConstants.loginText.tr,
                    style: AppTextStyle.textStyleUtils600(size: 30.sp),
                  )),
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                child: GetBuilder<LoginController>(
                  id: "Login",
                  builder: (controller) {
                    return Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const EmailTextFormField(),
                          SizedBox(
                            height: 15.h,
                          ),
                          const PasswordTextFormField(),
                          SizedBox(
                            height: 10.h,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                // Get.to(ForgotPasswordPage());
                                Get.toNamed(
                                  RoutesConstants.forgotPasswordPage,
                                );
                              },
                              child: CommonTextPoppins(
                                LanguageConstants.forgotYourPasswordText.tr,
                                fontSize: 14.sp,
                                color: grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          const SignInButtonWidget(),
                          SizedBox(
                            height: 45.h,
                          ),
                          Text(
                            LanguageConstants.orText.tr,
                            style: AppTextStyle.textStyleUtils600_16(
                                color: const Color(0xffdddddd)),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            LanguageConstants.loginWith.tr,
                            style: AppTextStyle.textStyleUtils400(),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          if (Platform.isIOS)
                            SignInButton(
                              Buttons.Apple,
                              onPressed: () {
                                controller.appleLogin();
                              },
                            ),
                          const SizedBox(height: 8),
                          SignInButton(
                            Buttons.Google,
                            onPressed: () {
                              controller.googleLogin();
                            },
                          ),
                          const SizedBox(height: 8),
                          SignInButton(
                            Buttons.Facebook,
                            onPressed: () {
                              controller.loginWithFacebook();
                            },
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          SizedBox(
                            width: 240.w,
                            child: CommonTextPoppins(
                              LanguageConstants
                                  .logInAndEnjoyAPersonalizedShoppingExperienceText
                                  .tr,
                              fontSize: 14.sp,
                              color: grey636363,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 34.h,
                          ),
                          RichText(
                            text: TextSpan(
                              text: LanguageConstants
                                  .dontHaveAnAccountYetText.tr,
                              style: AppTextStyle.textStyleUtils400(),
                              children: <TextSpan>[
                                 TextSpan(
                                  text: '   ',
                                  style: AppTextStyle.textStyleUtils400(),
                                ),
                                TextSpan(
                                    text: LanguageConstants.signUpText.tr,
                                    style: AppTextStyle
                                        .textStyleUtilsUnderLine14(
                                            color: primary,
                                            fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed(
                                          RoutesConstants.signUpScreen,
                                        );
                                      }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.w,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Obx(
            () => controller.isLoading.value
                ? const SpinKitThreeBounce(
                    color: avoirChickTheme,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
