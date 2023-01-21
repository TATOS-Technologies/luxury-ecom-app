import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';

class ForgetPasswordMenuScreen extends StatelessWidget {
  const ForgetPasswordMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.formKey.value,
      backgroundColor: greenD1F1FF,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 112),
            InkWell(
              onTap: () {
                // controller.getForgetPasswordResponse();
              },
              child: Text(
                LanguageConstants.forgetPassword.tr,
                style: AppTextStyle.textStyleUtilsUnderLine18(
                  color: red973133,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              LanguageConstants.forgetPasswordContain.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils400(),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: appColorPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                Get.offAllNamed(RoutesConstants.dashboardScreen);
              },
              child: HeadlineBodyOneBaseWidget(
                title: LanguageConstants.continueShopping.tr,
                titleColor: Colors.white,
                fontFamily: AppConstants.fontPoppins,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: appColorPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                Get.back();
              },
              child: HeadlineBodyOneBaseWidget(
                title: LanguageConstants.backToSignInScreen.tr,
                titleColor: Colors.white,
                fontFamily: AppConstants.fontPoppins,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
