import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  TermsAndConditionScreenState createState() => TermsAndConditionScreenState();
}

class TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: commonAppbar(title: LanguageConstants.termsConditionsText.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: Column(
          children: [
            Text(
              LanguageConstants.tearmsAndCondition.tr,
              style: AppTextStyle.textStyleUtils600(
                color: appColor,
                size: 18,
              ),
            ),
            const SizedBox(height: 20),
            expandDetailWidget(LanguageConstants.aboutUs.tr, 1),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 1 ? true : false,
              child: Text(
                LanguageConstants.nylonMessengerBackpackMsg.tr,
                style: AppTextStyle.textStyleUtils500(
                  size: 13,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget(LanguageConstants.ourServices.tr, 2),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 2 ? true : false,
              child: Text(
                LanguageConstants.nylonMessengerBackpackMsg.tr,
                style: AppTextStyle.textStyleUtils500(
                  size: 13,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget(LanguageConstants.delivery.tr, 3),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 3 ? true : false,
              child: Text(
                LanguageConstants.nylonMessengerBackpackMsg.tr,
                style: AppTextStyle.textStyleUtils500(
                  size: 13,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget(LanguageConstants.ourWebsite.tr, 4),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 4 ? true : false,
              child: Text(
                LanguageConstants.nylonMessengerBackpackMsg.tr,
                style: AppTextStyle.textStyleUtils500(
                  size: 13,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget('Final Sale', 5),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 5 ? true : false,
              child: Text(
                LanguageConstants.nylonMessengerBackpackMsg.tr,
                style: AppTextStyle.textStyleUtils500(
                  size: 13,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget expandDetailWidget(String text, int value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (index == value) {
            index = 0;
          } else {
            index = value;
          }
        });
      },
      child: Container(
        color: secondaryColor,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppTextStyle.textStyleUtils400(),
            ),
            index == value
                ? const Icon(Icons.remove, color: appColor)
                : const Icon(Icons.add, color: appColor),
          ],
        ),
      ),
    );
  }
}
