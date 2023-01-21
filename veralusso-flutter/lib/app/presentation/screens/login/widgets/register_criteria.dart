import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class RegisterCriteria extends StatelessWidget {
  const RegisterCriteria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 240.w,
          child: HeadlineBodyOneBaseWidget(
            titleTextAlign: TextAlign.center,
            title: LanguageConstants
                .logInAndEnjoyAPersonalizedShoppingExperienceText.tr,
            fontSize: 14.sp,
            titleColor: grey8B8B8B,
          ),
        ),
        SizedBox(
          height: 34.h,
        ),
        RichText(
          text: TextSpan(
            text: LanguageConstants.dontHaveAnAccountYetText.tr,
            style: AppTextStyle.textStyleUtils400(),
            children: <TextSpan>[
              TextSpan(
                  text: LanguageConstants.signUpText.tr,
                  style: AppTextStyle.textStyleUtilsUnderLine14(
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(RoutesConstants.signupScreen);
                    }),
            ],
          ),
        ),
      ],
    );
  }
}
