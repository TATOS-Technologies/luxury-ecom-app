import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';

class ReturnReasonScreen extends StatelessWidget {
  const ReturnReasonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenD1F1FF,
      appBar: AppBar(
        backgroundColor: greenD1F1FF,
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 60,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAsset.suvandnetLogo),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageConstants.returnRequestText.tr,
              style: AppTextStyle.textStyleUtilsUnderLine18(
                  color: const Color(0xFF973133), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                LanguageConstants.wehaveRecivedText.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400_12(
                    color: const Color(0xFF6B6B6B)),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              LanguageConstants.teamSoloLuxuryText.tr,
              style: AppTextStyle.textStyleUtils400_12(
                  color: const Color(0xFF6B6B6B)),
            ),
            const SizedBox(height: 14),
            InkWell(
              onTap: () {
                Get.toNamed(RoutesConstants.dashboardScreen);
              },
              child: Text(
                LanguageConstants.continueShopping.tr,
                style: AppTextStyle.textStyleUtilsUnderLine18(
                    color: const Color(0xFF973133),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
