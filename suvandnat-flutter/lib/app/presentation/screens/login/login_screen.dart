import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:suvandnat/app/presentation/screens/home/home_screen.dart';
import 'package:suvandnat/app/presentation/screens/login/views/forgot_password.dart';
import 'package:suvandnat/app/presentation/screens/login/views/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 65),
              Text(
                LanguageConstants.registeredCustomers.tr,
                style:
                    AppTextStyle.textStyleUtils600(color: appColor, size: 18),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants
                    .ifYouHaveAnAccountSignInWithYourEmailAddress.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400(
                        color: Colors.black54, size: 12.5)
                    .copyWith(height: 1.4),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.email.tr,
                  style: AppTextStyle.textStyleUtils600(size: 12.5),
                ),
              ),
              const SizedBox(height: 7.5),
              const EmailWidget(
                controller: null,
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(LanguageConstants.password.tr,
                    style: AppTextStyle.textStyleUtils400(
                        color: Colors.black54, size: 12.5)),
              ),
              const SizedBox(height: 7.5),
              const PasswordWidget(
                controller: null,
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: 160,
                height: 41,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(HomeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(LanguageConstants.signInText.tr),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Get.to(() => ForgotPasswordScreen());
                },
                child: Text(
                  LanguageConstants.forgetPassword.tr,
                  style: AppTextStyle.textStyleUtils500(size: 13),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: Text(
                  LanguageConstants.newCustomersText.tr,
                  style: AppTextStyle.textStyleUtils600(
                      color: appColor, size: 15.8),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${LanguageConstants.loginDescriptionText.tr}\n${LanguageConstants.fasterKeepMoreThanOneaddress.tr}',
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400(
                        color: Colors.black54, size: 12.5)
                    .copyWith(height: 1.4),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                height: 41,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const RegisterScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    LanguageConstants.createAccountText.tr,
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
}
