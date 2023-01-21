import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_routes.dart';
import '../../../controller/login_controller.dart';

class LogOutSuccess extends GetView<LoginController> {
  const LogOutSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: () {
          Get.offAllNamed(RoutesConstants.dashboardScreen);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  LanguageConstants.successfullyLoggedOut.tr,
                  style: AppTextStyle.textStyleUtils400_16(),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonThemeButton(
                    onTap: () async {
                      Get.offAllNamed(RoutesConstants.loginScreen);
                    },
                    title:
                      LanguageConstants.loginText.tr,
                    
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CommonThemeButton(
                    onTap: () async {
                      Get.offAllNamed(RoutesConstants.dashboardScreen);
                    },
                    title:
                      LanguageConstants.continueShopping.tr,
                     
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
