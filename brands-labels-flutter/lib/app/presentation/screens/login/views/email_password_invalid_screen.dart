import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailPasswordInvalidScreen extends StatelessWidget {
  const EmailPasswordInvalidScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (Get.arguments is bool && Get.arguments as bool)
                  ? emailErrorWidget()
                  : passwordErrorWidget(),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(RoutesConstants.dashboardScreen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: appBarPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    LanguageConstants.continueShopping.tr.toUpperCase(),
                    style: AppTextStyle.textStyleUtils600(
                      color: Colors.white,
                      size: 13.5,
                    ),
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
                  backgroundColor: appBarPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    LanguageConstants.backToSignInScreen.tr.toUpperCase(),
                    style: AppTextStyle.textStyleUtils600(
                      color: Colors.white,
                      size: 13.5,
                    ),
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
          style: textStyleUtils600(),
        ),
        const SizedBox(height: 15),
        Text(
          LanguageConstants.forgotPasswordWrongEmailStart.tr,
          textAlign: TextAlign.center,
          style: textStyleUtils16(),
        ),
        Text(
          LanguageConstants.forgotPasswordWrongEmailEnd.tr,
          textAlign: TextAlign.center,
          style: textStyleUtils16(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${LanguageConstants.writeAt.tr}  ',
              textAlign: TextAlign.center,
              style: textStyleUtils16(),
            ),
            const Text(
              'care@brands-labels.com',
              style: TextStyle(
                color: blackColor,
                decoration: TextDecoration.underline,
                fontFamily: AppConstants.fontPoppins,
                fontSize: 16,
              ),
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
          style: textStyleUtils600(),
        ),
        const SizedBox(height: 15),
        Text(
          LanguageConstants.thePasswordYouenteredisincorrectPleasetryagain.tr,
          textAlign: TextAlign.center,
          style: textStyleUtils16(),
        ),
      ],
    );
  }

  TextStyle textStyleUtils600() {
    return const TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: blackColor,
      decorationThickness: 1.5,
      color: blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
  }

  TextStyle textStyleUtils16() {
    return const TextStyle(
      color: blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16,
    );
  }
}
