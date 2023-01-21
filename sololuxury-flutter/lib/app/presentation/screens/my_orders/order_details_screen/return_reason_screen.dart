import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/theme/app_asset.dart';
import 'package:solo_luxury/app/theme/colors.dart';
import 'package:solo_luxury/app/core/utils/app_routes.dart';

class ReturnReasonScreen extends StatelessWidget {
  const ReturnReasonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: homeBackground,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 30,
            width: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAsset.logo),
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
              style: AppStyle.textStyleUtils700(color: appColor, size: 18)
                  .copyWith(decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                LanguageConstants.wehaveRecivedText.tr,
                textAlign: TextAlign.center,
                style: AppStyle.textStyleUtils400_12(
                    color: const Color(0xFF6B6B6B)),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              LanguageConstants.teamSoloLuxuryText.tr,
              style:
                  AppStyle.textStyleUtils400_12(color: const Color(0xFF6B6B6B)),
            ),
            const SizedBox(height: 14),
            InkWell(
              onTap: () {
                Get.toNamed<dynamic>(RoutesConstants.dashboardScreen);
              },
              child: Text(
                LanguageConstants.continueShopping.tr.toUpperCase(),
                style: AppStyle.textStyleUtils500(color: appColor, size: 18)
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
