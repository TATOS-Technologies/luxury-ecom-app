import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/screens/login/widget/forgot_password_button.dart';
import 'package:solo_luxury/app/presentation/screens/login/widget/login/login_email_text_field.dart';
import 'package:solo_luxury/app/presentation/screens/login/widget/login/login_password_text_field.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: backGroundColor,
      body: Stack(
        children: [
          Form(
            key: controller.formKey,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24.w),
                child: GetBuilder<LoginController>(
                  id: "Login",
                  builder: (controller) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.w,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LanguageConstants.loginText.tr,
                            style: AppStyle.textStyleUtils600(
                              size: 30.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        // Text(
                        //   LanguageConstants
                        //       .registeredCustomersDescriptionText.tr,
                        //   textAlign: TextAlign.center,
                        //   style: AppStyle.textStyleUtils400(
                        //           size: 12.5, color: Colors.black54)
                        //       .copyWith(
                        //     height: 1.4,
                        //   ),
                        // ),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     LanguageConstants.usernameText.tr,
                        //     style: AppStyle.textStyleUtils600(size: 12.5),
                        //   ),
                        // ),
                        const LoginEmailTextField(),

                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     LanguageConstants.passwordText.tr,
                        //     style: AppStyle.textStyleUtils600(size: 12.5),
                        //   ),
                        // ),
                        SizedBox(height: 15.h),
                        const LoginPasswordTextField(),
                        SizedBox(height: 10.h),
                        const ForgotPasswordButton(),
                        SizedBox(height: 37.h),
                        SizedBox(
                          child: CommonThemeButton(
                            onTap: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.loginUser();
                              }
                            },
                            title: LanguageConstants.loginText.tr,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        if (Platform.isIOS)
                          SignInButton(
                            Buttons.Apple,
                            text: LanguageConstants.signInWithApple.tr,
                            onPressed: () {
                              controller.appleLogin();
                            },
                          ),
                        const SizedBox(height: 8),
                        SignInButton(
                          Buttons.Google,
                          text: LanguageConstants.signInWithGoogle.tr,
                          onPressed: () {
                            controller.googleLogin();
                          },
                        ),
                        const SizedBox(height: 8),
                        SignInButton(
                          Buttons.Facebook,
                          text: LanguageConstants.loginWithFacebookText.tr,
                          onPressed: () {
                            controller.loginWithFacebook();
                          },
                        ),
                        const SizedBox(height: 8),
                        SignInButton(
                          Buttons.Twitter,
                          text: LanguageConstants.signInWithTwitter.tr,
                          onPressed: () {
                            controller.loginWithTwitter();
                          },
                        ),
                        //const SizedBox(height: 20),
                        //newCustomerButton(),
                        const SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            width: 300.w,
                            child: Text(
                              LanguageConstants
                                  .logInAndEnjoyAPersonalizedShoppingExperienceText
                                  .tr,
                              textAlign: TextAlign.center,
                              style: AppStyle.textStyleUtils400(
                                      size: 14.sp, color: Colors.black54)
                                  .copyWith(
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(height: 20),
                        // CommonThemeButton(
                        //   onTap: () {
                        //     Get.toNamed<dynamic>(RoutesConstants.signUpScreen,
                        //         arguments: [
                        //           0,
                        //           MyAccountDetails(),
                        //         ]);
                        //   },
                        //   title: LanguageConstants.createAccountText.tr,
                        // ),
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
                                  style: AppTextStyle.textStyleUtils700(
                                      color: appColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed<dynamic>(
                                          RoutesConstants.signUpScreen,
                                          arguments: [
                                            0,
                                            MyAccountDetails(),
                                          ]);
                                    }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const SpinKitThreeBounce(
                    color: appColor,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
