import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/login/login_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/behaviour.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(appBarColor: Colors.transparent),
        body: Stack(
          children: [
            ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GetBuilder<LoginController>(
                  id: "Login",
                  builder: (controller) {
                    return Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30.w,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CommonTextPoppins(
                                LanguageConstants.loginText.tr,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 30.w,
                          ),
                          SizedBox(
                            child: EmailWidget(
                              controller: controller.emailController,
                              validator: (value) => null,
                              hintText: controller.isValid &&
                                      controller.emailController.text == ""
                                  ? LanguageConstants.enterEmailAddress.tr
                                  : LanguageConstants.emailAddressText.tr + "*",
                              hintStyle: AppTextStyle.textStyleUtils300_12(
                                  color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          SizedBox(
                            child: PasswordWidget(
                              controller: controller.passwordController,
                              hintText: controller.isValid &&
                                      controller.passwordController.text == ""
                                  ? LanguageConstants.enterPassword.tr
                                  : LanguageConstants.passwordText.tr + "*",
                              validator: (value) =>
                                  Validators.validatePassword(value),
                              maxLength: 8,
                              hintStyle: AppTextStyle.textStyleUtils300_12(
                                  color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutesConstants.forgotPasswordPage);
                              },
                              child: CommonTextPoppins(
                                LanguageConstants.forgotYourPasswordText.tr,
                                textAlign: TextAlign.center,
                                color: Colors.grey.shade500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          SizedBox(
                            height: 45.h,
                            width: 327.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: appColorPrimary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              onPressed: () {
                                controller.loginUser(context: context);
                              },
                              child: CommonTextPoppins(
                                LanguageConstants.loginText.tr,
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Text(LanguageConstants.orText.tr,
                              style: AppTextStyle.textStyleUtils600_16(
                                  color: const Color(0xffdddddd))),
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
                            child: HeadlineBodyOneBaseWidget(
                              titleTextAlign: TextAlign.center,
                              title: LanguageConstants
                                  .logInAndEnjoyAPersonalizedShoppingExperienceText
                                  .tr,
                              fontSize: 14.sp,
                              titleColor: gray6D6D6D,
                            ),
                          ),
                          SizedBox(
                            height: 34.h,
                          ),
                          RichText(
                            text: TextSpan(
                              text:
                                  LanguageConstants.dontHaveAnAccountYetText.tr,
                              style: AppTextStyle.textStyleUtils400(),
                              children: <TextSpan>[
                                TextSpan(
                                    text: LanguageConstants.signUpText.tr,
                                    style:
                                        AppTextStyle.textStyleUtilsUnderLine14(
                                            fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed(
                                            RoutesConstants.signUpScreen);
                                      }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Obx(
              () => controller.isLoginApiCall.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xFF973133),
                      ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
