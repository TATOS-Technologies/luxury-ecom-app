import 'dart:io';

import 'package:brandslabels/app/controller/login_controller.dart';
import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/behaviour.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/headline_body_one_base_widget.dart';
import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: controller.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 30.h,
                        horizontal: 24.w,
                      ),
                      child: GetBuilder<LoginController>(
                        id: "LogIn",
                        builder: (controller) {
                          return Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      LanguageConstants.loginText.tr,
                                      style: AppTextStyle.textStyleUtils600(
                                          color: buttonColor, size: 30.sp),
                                    )),
                                SizedBox(
                                  height: 40.h,
                                ),
                                SizedBox(
                                  child: EmailWidget(
                                    controller: controller.emailController,
                                    hintText:
                                        "${LanguageConstants.emailAddressText.tr}*",
                                    hintStyle: AppTextStyle.textStyleUtils400(
                                      color: dividerColor,
                                    ),
                                    textAlign: TextAlign.start,
                                    validator: (value) =>
                                        Validators.validateEmail(value),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                  child: PasswordWidget(
                                    controller: controller.passwordController,
                                    hintText:
                                        "${LanguageConstants.passwordText.tr}*",
                                    hintStyle: AppTextStyle.textStyleUtils400(
                                      color: dividerColor,
                                    ),
                                    maxLength: 8,
                                    validator: Validators.validatePassword,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                          RoutesConstants.forgotPasswordPage);
                                    },
                                    child: HeadlineBodyOneBaseWidget(
                                      title: LanguageConstants
                                          .forgotYourPasswordText.tr,
                                      fontSize: 14.0,
                                      titleColor: Colors.black,
                                      fontFamily: AppConstants.fontPoppins,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                SizedBox(
                                    height: 35.h,
                                    width: 327.w,
                                    child: CommonThemeButton(
                                      title: LanguageConstants.loginText.tr,
                                      fontSize: 14.sp,
                                      onTap: () async {
                                        await controller.loginUser();
                                      },
                                    )),
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
                                  child: HeadlineBodyOneBaseWidget(
                                    titleTextAlign: TextAlign.center,
                                    title: LanguageConstants
                                        .logInAndEnjoyAPersonalizedShoppingExperienceText
                                        .tr,
                                    fontSize: 14.sp,
                                    titleColor: grey969290,
                                  ),
                                ),
                                SizedBox(
                                  height: 34.h,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text:
                                        '${LanguageConstants.dontHaveAnAccountYetText.tr} ',
                                    style: AppTextStyle.textStyleUtils400(),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: LanguageConstants.signUpText.tr,
                                          style: AppTextStyle
                                              .textStyleUtilsUnderLine14(
                                                  color: buttonColor),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.toNamed(RoutesConstants
                                                  .registerScreen);
                                            }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const SpinKitThreeBounce(
                    color: appBarPrimary,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget detailsButton(String text, int value) {
    return GestureDetector(
      onTap: () {
        if (value == 1) {
          controller.aboutUsExpandableController.toggle();
        }
      },
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTextStyle.textStyleUtils400(),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
