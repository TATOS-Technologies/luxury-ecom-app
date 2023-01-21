import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordMenuScreen extends StatelessWidget {
  const ForgetPasswordMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:CommonTextPoppins( LanguageConstants.forgetPassword.tr),
        leading: IconButton(onPressed: () {
          Get.until((route) =>
                      route.settings.name == RoutesConstants.loginScreen);
        }, icon: const Icon(Icons.arrow_back)),
        ),
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Text(
                LanguageConstants.forgetPasswordContain.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${LanguageConstants.writeAt.tr}  ',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400(),
                  ),
                  Text(
                    'care@brandslabls.com',
                    style: AppTextStyle.textStyleUtils400_16(color: darkBlue)
                        .copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              CommonThemeButton(
                onTap: () {
                  Get.offAllNamed(RoutesConstants.dashboardScreen);
                },
                title: LanguageConstants.continueShopping.tr,
                // style: textStyleUtils18(),
              ),
              const SizedBox(height: 20),
              CommonThemeButton(
                onTap: () {
                  Get.until((route) =>
                      route.settings.name == RoutesConstants.loginScreen);
                },
                title:
                    LanguageConstants.backToSignInScreen.tr,
                  
              ),
            ],
          ),
        ),
      ),
    );
  }
}
