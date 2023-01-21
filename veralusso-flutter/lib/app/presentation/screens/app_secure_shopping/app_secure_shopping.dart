import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/app_secure_shopping/app_secure_shopping_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../home/home_screen.dart';

class AppSecureShoppingScreen extends GetView<AppSecureShoppingController> {
  @override
  final AppSecureShoppingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldkey,
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          const AppbarWithHeader(),
          Container(
            height: 1.0,
            color: blackColor,
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top + 115),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 271,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAsset.secureShopping),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    LanguageConstants.secureShoppingText.tr,
                    style: AppStyle.commonTextStyleUnderline500(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LanguageConstants.fillYourCartText.tr,
                    textAlign: TextAlign.justify,
                    style: AppStyle.commonTextStyle400(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 271,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAsset.security),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    LanguageConstants.securitySafety100.tr,
                    style: AppStyle.commonTextStyleUnderline500(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LanguageConstants.weAimToSatisfyText.tr,
                    textAlign: TextAlign.justify,
                    style: AppStyle.commonTextStyle400(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 271,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAsset.buyerProtection),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    LanguageConstants.buyerProtection.tr,
                    style: AppStyle.commonTextStyleUnderline500(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LanguageConstants.ifYouPayWithPayPal.tr,
                    textAlign: TextAlign.justify,
                    style: AppStyle.commonTextStyle400(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 271,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAsset.immediateResolution),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    LanguageConstants.immediateResolution.tr,
                    style: AppStyle.commonTextStyleUnderline500(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LanguageConstants.inAdditionAllOtherPaymentsAreProcessed.tr,
                    textAlign: TextAlign.justify,
                    style: AppStyle.commonTextStyle400(),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage(AppAsset.masterCard),
                        ),
                        Image(
                          image: AssetImage(AppAsset.amexCard),
                        ),
                        Image(
                          image: AssetImage(AppAsset.visaCard),
                        ),
                        Image(
                          image: AssetImage(AppAsset.discoverCard),
                        ),
                        Image(
                          image: AssetImage(AppAsset.payPalCard),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
