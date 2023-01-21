import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/donation/charity_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/screens/donation/widgets/common_container.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class CharityScreen extends GetView<CharityController> {
  const CharityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: commonAppbar(title: LanguageConstants.helpTheNeedyText.tr),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  LanguageConstants.charityTitle.tr,
                  style: AppTextStyle.textStyleUtilsUnderLine18(thickness: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.charityContain1.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400_16(),
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonContainer(
                  height: 296.0,
                  imageUrl: AppAsset.charity1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.charityContain2.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400_16(),
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonContainer(
                  height: 283.0,
                  imageUrl: AppAsset.charity2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.charityContain3.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400_16(),
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonContainer(
                  height: 283.0,
                  imageUrl: AppAsset.charity3,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.charityContain4.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400_16(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.charityContain5.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400_16(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.charityContain6.tr,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.textStyleUtils400_16(),
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
}
