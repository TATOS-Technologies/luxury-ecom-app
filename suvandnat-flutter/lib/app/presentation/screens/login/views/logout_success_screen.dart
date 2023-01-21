import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/controller/login/login_controller.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import '../../../../theme/colors.dart';

class LogOutSuccess extends GetView<LoginController> {
  const LogOutSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                LanguageConstants.youHaveBeenSuccessfullyLoggedOut.tr,
                style: AppTextStyle.textStyleUtils500_16(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: appColorPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    Get.offAllNamed(RoutesConstants.loginScreen);
                  },
                  child: HeadlineBodyOneBaseWidget(
                    title: LanguageConstants.loginText.tr,
                    titleColor: Colors.white,
                    fontFamily: AppConstants.fontPoppins,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
