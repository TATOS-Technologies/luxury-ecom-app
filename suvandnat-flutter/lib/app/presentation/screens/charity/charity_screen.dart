import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/screens/charity/widgets/common_container.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/controller/charity/charity_controller.dart';

class CharityScreen extends GetView<CharityController> {
  const CharityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                    style: AppTextStyle.textStyleUtils400(size: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      LanguageConstants.charityContain1.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils400(size: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CommonContainer(
                    height: 220.0,
                    imageUrl: AppAsset.charity1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    LanguageConstants.charityContain2.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400_16(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonContainer(
                    height: 332.0,
                    imageUrl: AppAsset.charity2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    LanguageConstants.charityContain3.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400_16(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonContainer(
                    height: 332.0,
                    imageUrl: AppAsset.charity3,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    LanguageConstants.charityContain4.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400_16(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonContainer(
                    height: 332.0,
                    imageUrl: AppAsset.charity4,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    LanguageConstants.charityContain5.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400_16(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    LanguageConstants.charityContain6.tr,
                    textAlign: TextAlign.center,
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
      ),
    );
  }
}
