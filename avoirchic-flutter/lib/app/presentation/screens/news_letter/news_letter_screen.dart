import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/screens/news_letter/widgets/checkbox_container.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/news_lettter_controller.dart';
import '../../../theme/app_asset.dart';
import '../../../theme/colors.dart';
import '../../common_widgets/headline_body_one_base_widget.dart';

class NewsLetterScreen extends GetView<NewsLetterController> {
  const NewsLetterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   children: [
            //     RichText(
            //       text: TextSpan(
            //         children: [
            //           TextSpan(
            //               text: LanguageConstants.policyHomeText.tr,
            //               style: AppTextStyle.textStyleUtils500_16(
            //                   color: textDarkBlue)),
            //           TextSpan(
            //               text: "  >  ",
            //               style: AppTextStyle.textStyleUtils500_16(
            //                   color: textDarkBlue)),
            //           TextSpan(
            //               text: LanguageConstants.improveLivesText.tr
            //                   .toUpperCase(),
            //               style: AppTextStyle.textStyleUtils500_16(
            //                   color: textDarkBlue)),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  onChanged: (String? value) {},
                  icon: Image.asset(
                    AppAsset.downArrow,
                    height: 18,
                    width: 18.0,
                    color: textDarkBlue,
                  ),
                  hint: Text(
                    LanguageConstants.myAccountText.tr,
                    style: AppTextStyle.textStyleUtils700(color: textDarkBlue),
                  ),
                  style: AppTextStyle.textStyleUtils400(color: textDarkBlue),
                  items: <String>["Mr.", "Mrs."]
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
              style:
                  AppTextStyle.textStyleUtils700(color: textDarkBlue).copyWith(
                decoration: TextDecoration.underline,
                letterSpacing: 1.2,
              ),
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
              style: AppTextStyle.textStyleUtils400_12(
                color: Colors.black.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxContainer(
                    text: LanguageConstants.email.tr,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  CheckboxContainer(
                    text: LanguageConstants.sms.tr,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CommonThemeButton(
              onTap: () {},
              title: LanguageConstants.save.tr,
            )
          ],
        ),
      ),
    );
  }
}
