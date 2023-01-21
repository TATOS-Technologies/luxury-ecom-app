import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnReasonScreen extends StatelessWidget {
  const ReturnReasonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 18,
                  width: 120,
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
                    style: AppTextStyle.textStyleUtils700(
                            color: const Color(0xff367587), size: 18)
                        .copyWith(decoration: TextDecoration.underline),
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
                      LanguageConstants.continueShopping.tr.toUpperCase(),
                      style: AppTextStyle.textStyleUtils700(
                              color: const Color(0xff367587), size: 18)
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
