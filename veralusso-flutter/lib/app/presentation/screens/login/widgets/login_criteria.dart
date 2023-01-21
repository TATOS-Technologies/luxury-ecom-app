import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

import 'package:veralusso/app/controller/login/login_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class LoginCriteria extends GetView<LoginController> {
  @override
  final LoginController controller = Get.find();

  LoginCriteria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(RoutesConstants.forgotPasswordPage);
            },
            child: HeadlineBodyOneBaseWidget(
              title: LanguageConstants.forgotYourPasswordText.tr,
              fontSize: 14.sp,
              titleColor: regularGrey,
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        SizedBox(
            height: 50.h,
            width: 327.w,
            child: CommonThemeButton(
              title:
                LanguageConstants.loginText.tr,
                
              onTap: () async {
                await controller.loginUser();
              },
            )),
        SizedBox(
          height: 45.h,
        ),
        Text(
          LanguageConstants.orText.tr,
          style:
              AppTextStyle.textStyleUtils600_16(color: const Color(0xffdddddd)),
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
      ],
    );
  }
}
