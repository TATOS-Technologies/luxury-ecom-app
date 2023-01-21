import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/news_letter/news_lettter_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'widgets/check_box_container.dart';

class NewsLetterScreen extends GetView<NewsLetterController> {
  const NewsLetterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 100), child: NewsLetterScreen()),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                onChanged: (String? value) {},
                icon: Image.asset(
                  AppAsset.downArrow,
                  height: 16,
                  width: 16.0,
                  color: blackColor,
                ),
                hint: Text(
                  LanguageConstants.myAccountText.tr,
                  style: AppTextStyle.textStyleUtils700(),
                ),
                style: AppTextStyle.textStyleUtils400(),
                items:
                    <String>[LanguageConstants.mr.tr, LanguageConstants.mrs.tr]
                        .map(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: HeadlineBodyOneBaseWidget(
                              title: value,
                              fontSize: 14,
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            LanguageConstants.communicationPreference.tr,
            style: AppTextStyle.textStyleUtilsUnderLine14(
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            LanguageConstants.subscribeToBeTheFirstText.tr,
            style: AppTextStyle.textStyleUtils400(size: 13.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LanguageConstants.subscribeToNewsletters.tr,
            style: AppTextStyle.textStyleUtils400_12(
                color: Colors.black.withOpacity(0.7)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CheckBoxContainer(LanguageConstants.email.tr),
                const SizedBox(
                  width: 30,
                ),
                CheckBoxContainer(LanguageConstants.sms.tr),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 35,
            decoration: const BoxDecoration(color: blackColor),
            child: MaterialButton(
              onPressed: () {},
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                LanguageConstants.saveText.tr,
                style: AppTextStyle.textStyleUtils400_18(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
