import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/controller/login/login_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class LogOutSuccess extends GetView<LoginController> {
  const LogOutSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              LanguageConstants.youHaveBeenSuccessfullyLoggedOut.tr,
              style: AppTextStyle.textStyleUtils400(size: 15),
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
                onPressed: () {
                  Get.toNamed(RoutesConstants.loginScreen);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: blackColor.withOpacity(1),
                  side: BorderSide(
                    width: 1.0,
                    color: blackColor.withOpacity(
                      1,
                    ),
                  ),
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  LanguageConstants.loginText.tr,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyle.textStyleUtils400(),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              OutlinedButton(
                onPressed: () {
                  Get.offAllNamed(RoutesConstants.dashboardScreen);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: blackColor.withOpacity(1),
                  side: BorderSide(
                    width: 1.0,
                    color: blackColor.withOpacity(
                      1,
                    ),
                  ),
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  LanguageConstants.continueShopping.tr,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyle.textStyleUtils400(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
