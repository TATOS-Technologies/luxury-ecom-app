import 'package:brandslabels/app/controller/news_lettter_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/headline_body_one_base_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/colors.dart';

import '../../../core/utils/lang_directory/language_constant.dart';

class NewsLetterScreen extends GetView<NewsLetterController> {
  const NewsLetterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: appBar(),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                onChanged: (String? value) {
                  // controller.selectedValue.value = value.toString();
                },
                icon: Image.asset(
                  AppAsset.downArrow,
                  height: 16,
                  width: 16.0,
                  color: titleColor,
                ),
                //value: controller.selectedValue.value,
                hint: Text(
                  LanguageConstants.myAccount.tr,
                  style: AppTextStyle.textStyleUtils700(color: titleColor),
                ),
                style: AppTextStyle.textStyleUtils400(color: titleColor),
                items: <String>[LanguageConstants.mr.tr, LanguageConstants.mrs.tr]
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
            style: AppTextStyle.textStyleUtilsUnderLine14(color: titleColor, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            LanguageConstants.subscribeOffersAndMore.tr,
            style: AppTextStyle.textStyleUtils400(
              size: 13.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LanguageConstants.subscribeNewsletters.tr,
            style: AppTextStyle.textStyleUtils400_12(color: Colors.black.withOpacity(0.7)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                checkBoxContainer(LanguageConstants.email.tr),
                const SizedBox(
                  width: 30,
                ),
                checkBoxContainer(LanguageConstants.sms.tr),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 35,
            decoration: const BoxDecoration(color: titleColor),
            child: MaterialButton(
              onPressed: () {},
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                LanguageConstants.save.tr,
                style: AppTextStyle.textStyleUtils400(size: 18, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      color: Colors.white,
      height: 60.0,
      margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).viewPadding.top),
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headerLogo(),
              headerMenu(),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }

  Widget headerLogo() {
    return Row(
      children: [
        const SizedBox(
          height: 48,
          child: VerticalDivider(
            color: appBarPrimary,
            thickness: 3,
            indent: 0,
            endIndent: 0,
            width: 20,
          ),
        ),
        const SizedBox(height: 5.0),
        Obx(() {
          return SizedBox(
            height: 48.0,
            child: Image.network(
              controller.logoModel?.value.logoUrl.toString() ?? '',
              height: 48,
            ),
          );
        }),
      ],
    );
  }

  Widget headerMenu() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            // if (!controller.scaffoldkey.currentState?.isDrawerOpen) {
            //   controller.scaffoldkey.currentState?.openDrawer();
            // }
          },
          child: Image.asset(
            AppAsset.menu,
            height: 16.0,
            width: 16.0,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Image.asset(
          AppAsset.searchIcon,
          height: 16.0,
          width: 16.0,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Image.asset(
          AppAsset.userProfile,
          height: 16.0,
          width: 16.0,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Image.asset(
          AppAsset.cart1,
          height: 16.0,
          width: 16.0,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          LanguageConstants.gdpText.tr,
          style: AppTextStyle.textStyleUtils500(size: 13),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 13,
          width: 1.5,
          color: blackColor,
        ),
        Text(
          LanguageConstants.engText,
          style: AppTextStyle.textStyleUtils500(size: 13),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 13,
          width: 1.5,
          color: blackColor,
        ),
        Image.asset(
          AppAsset.flag,
          height: 16.0,
          width: 16.0,
        ),
        const SizedBox(width: 10.0)
      ],
    );
  }

  Row checkBoxContainer(String text) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(border: Border.all(color: titleColor, width: 1.5)),
          child: const Icon(
            Icons.check,
            color: titleColor,
            size: 12,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: AppTextStyle.textStyleUtils500_12(),
        )
      ],
    );
  }
}
