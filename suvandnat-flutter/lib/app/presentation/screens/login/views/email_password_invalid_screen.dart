import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class EmailPasswordInvalidScreen extends StatelessWidget {
  const EmailPasswordInvalidScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Get.arguments as bool
                  ? emailErrorWidget()
                  : passwordErrorWidget(),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(RoutesConstants.dashboardScreen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    LanguageConstants.continueShopping.tr,
                    style: AppTextStyle.textStyleUtils600(
                        color: Colors.white, size: 13.5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    LanguageConstants.backToSignInScreen.tr,
                    style: AppTextStyle.textStyleUtils600(
                        color: Colors.white, size: 13.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailErrorWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LanguageConstants.accountDoesNotExist.tr,
          style: AppTextStyle.textStyleUtilsUnderLine20(
            color: appColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          LanguageConstants.forgotPasswordWrongEmailStart.tr,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyleUtils400_16(),
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
              '${LanguageConstants.writeAt.tr}  ',
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils400_16(),
            ),
            Text(
              'care@sololuxury.com',
              style: AppTextStyle.textStyleUtilsUnderLine16(color: appColor),
            ),
          ],
        ),
      ],
    );
  }

  Widget passwordErrorWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LanguageConstants.incorrectPassword.tr,
          style: AppTextStyle.textStyleUtilsUnderLine20(
            color: appColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          LanguageConstants.thePasswordYouenteredisincorrectPleasetryagain.tr,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyleUtils400_16(),
        ),
      ],
    );
  }
}
