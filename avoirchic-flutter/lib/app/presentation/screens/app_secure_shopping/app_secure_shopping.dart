import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSecureShoppingScreen extends StatelessWidget {
  const AppSecureShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageConstants.secureShoppingText.tr,
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(color: appBGColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // commonAppbar(
                //   appBarColor: Colors.transparent,
                // ),
                const SizedBox(
                  height: 20,
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          LanguageConstants.fillYourCartText.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(
                            size: 15,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: Get.width,
                          height: 199,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppAsset.securePhone),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          LanguageConstants.weAimToSatisfyText.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(
                            size: 15,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          LanguageConstants.ifYouPayWithPayPal.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(
                            size: 15,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: Get.width,
                          height: 199,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppAsset.appSecure),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          LanguageConstants
                              .inAdditionAllOtherPaymentsAreProcessed.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(
                            size: 15,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage(AppAsset.payPal),
                            ),
                            Image(
                              image: AssetImage(AppAsset.moneyBank),
                            ),
                            Image(
                              image: AssetImage(AppAsset.googleStore),
                            ),
                          ],
                        ),
                        const SizedBox(height: 91),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
