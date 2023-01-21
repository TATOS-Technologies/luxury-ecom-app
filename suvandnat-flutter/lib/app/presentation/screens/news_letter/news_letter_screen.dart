import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/presentation/screens/news_letter/widgets/checkbox_container.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/controller/news_letter/news_lettter_controller.dart';

import '../../../theme/app_asset.dart';

class NewsLetterScreen extends GetView<NewsLetterController> {
  NewsLetterScreen({Key? key}) : super(key: key);

  @override
  final NewsLetterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: controller.scaffoldkey,
        backgroundColor: backGroundColor,
        appBar: buildAppbar(MediaQuery.of(context).size),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  onChanged: (String? value) {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: appColorPrimary,
                  ),
                  hint: Text(
                    LanguageConstants.myAccountText.tr,
                    style:
                        AppTextStyle.textStyleUtils700(color: appColorPrimary),
                  ),
                  style: AppTextStyle.textStyleUtils400(color: appColorPrimary),
                  items: <String>[
                    LanguageConstants.mr.tr,
                    LanguageConstants.mrs.tr
                  ]
                      .map(
                        (String value) => DropdownMenuItem<String>(
                          child: HeadlineBodyOneBaseWidget(
                            title: value,
                            fontSize: 14,
                          ),
                          value: value,
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
                      color: appColorPrimary, fontWeight: FontWeight.w700)
                  .copyWith(letterSpacing: 1.2),
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
              LanguageConstants.subscribeNewsletters.tr,
              style: AppTextStyle.textStyleUtils400_12(
                  color: Colors.black.withOpacity(0.8)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxContainer(LanguageConstants.email.tr),
                  const SizedBox(
                    width: 30,
                  ),
                  CheckboxContainer(LanguageConstants.sms.tr),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 35,
              decoration: const BoxDecoration(color: appColorPrimary),
              child: MaterialButton(
                onPressed: () {},
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  LanguageConstants.save.tr,
                  style: AppTextStyle.textStyleUtils400(
                      size: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PreferredSize buildAppbar(Size size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.11),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: controller.height.value,
                width: size.width,
                color: red,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    LanguageConstants.findItCheaperText.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400_12(color: whiteColor),
                  ),
                ),
              ),
              Container(
                color: backGroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!(controller
                                .scaffoldkey.currentState?.isDrawerOpen ??
                            false)) {
                          controller.scaffoldkey.currentState?.openDrawer();
                        } else {
                          Navigator.pop(Get.context!);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image.asset(
                          AppAsset.drawer,
                          height: 14,
                          width: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.16),
                      child: Image.asset(
                        AppAsset.title,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 10,
            top: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  "https://cdn.countryflags.com/thumbs/india/flag-square-250.png",
                  height: 12,
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                  child: PopupMenuButton(
                    elevation: 0,
                    iconSize: 15,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text(LanguageConstants.indiaTextveralusso.tr),
                        value: 1,
                      ),
                      const PopupMenuItem(
                        child: Text("Usa"),
                        value: 2,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  LanguageConstants.gdpText.tr,
                  style: AppTextStyle.textStyleUtils400(size: 10),
                ),
                SizedBox(
                  width: 8,
                  child: PopupMenuButton(
                    elevation: 0,
                    iconSize: 14,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text(LanguageConstants.gdpText.tr),
                        value: 1,
                      ),
                      const PopupMenuItem(
                        child: Text("UDP"),
                        value: 2,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  LanguageConstants.englishText.tr,
                  style: AppTextStyle.textStyleUtils400(size: 10),
                ),
                SizedBox(
                  width: 8,
                  child: PopupMenuButton(
                    elevation: 0,
                    iconSize: 15,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text(LanguageConstants.englishText.tr),
                        value: 1,
                      ),
                      const PopupMenuItem(
                        child: Text("HINDI"),
                        value: 2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 48,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  child: const Icon(
                    Icons.account_circle_rounded,
                    size: 24,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  child: const Icon(
                    Icons.favorite_border_rounded,
                    size: 24,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
                const SizedBox(width: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 24,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    Text(
                      "0",
                      style: AppTextStyle.textStyleUtils700(),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
