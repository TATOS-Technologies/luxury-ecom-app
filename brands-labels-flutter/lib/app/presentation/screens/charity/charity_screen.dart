import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/charity_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharityScreen extends GetView<CharityController> {
  const CharityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: commonAppbar(title: LanguageConstants.ourSocialInitiativeText.tr),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  LanguageConstants.positiveImpactSustainability.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils500(size: 22.0),
                ),
                const SizedBox(
                  height: 29,
                ),
                Text(
                  LanguageConstants.thereAreStillMoreThanMSG.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.atYellowLeafHammocksMsg.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.insteadOfOrganizingMsg.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 30,
                ),
                commonContainer(
                  height: 315.0,
                  imageUrl: AppAsset.charity1,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  LanguageConstants.toPutItSimplyMsg.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.acrossThreeWeavingCommunitiesMsg.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.creatingJobsForWomenMsg.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 30,
                ),
                commonContainer(
                  height: 117.0,
                  imageUrl: AppAsset.charity2,
                ),
                const SizedBox(
                  height: 15,
                ),
                commonContainer(
                  height: 294.0,
                  imageUrl: AppAsset.charity3,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  LanguageConstants.theFoundationForABrighterFuter.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtilsUnderLine16(fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  LanguageConstants.theSecurityOfAStableMsg.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 30,
                ),
                commonContainer(
                  height: 1545.0,
                  imageUrl: AppAsset.charity4,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  LanguageConstants
                      .spreadingLastingChangeTheHammockRrevolution.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtilsUnderLine16(fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.thisIsAboutWhereMsg.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.corollaryEconomicMsg.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.wWithOurGrowthMsg.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.throughTheEstablishmentMsg.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400(size: 16.0),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commonContainer({double? height, String? imageUrl}) {
    return Container(
      height: height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imageUrl ?? ''), fit: BoxFit.fill),
      ),
    );
  }
}
