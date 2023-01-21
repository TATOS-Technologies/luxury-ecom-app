import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lang_directory/language_constant.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: Column(
          children: [
            Text(
              'Test Donation Two',
              style: AppTextStyle.textStyleUtils600(color: appColor, size: 18)
                  .copyWith(decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                priceWidget(5),
                priceWidget(10),
                priceWidget(15),
                priceWidget(25),
                priceWidget(50),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'Choose Your Own Amount GBP\n(Minimum 1)',
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils500(
                color: Colors.black87,
                size: 13.5,
              ),
            ),
            const SizedBox(height: 15),
            amountTextField(),
            const SizedBox(height: 15),
            Text(
              'The selected Amount will be Added To Your\nShopping cart.',
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils500(
                color: Colors.black87,
                size: 13.5,
              ),
            ),
            const SizedBox(height: 15),
            donateButton()
          ],
        ),
      ),
    );
  }

  Widget priceWidget(int value) {
    return Container(
      height: 27,
      width: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: appColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '£ $value',
        style: AppTextStyle.textStyleUtils400(color: appColor),
      ),
    );
  }

  Widget amountTextField() {
    return Container(
      height: 42.5,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: appColor, width: 1.25),
      ),
      child: Row(
        children: [
          Container(
            height: 42.5,
            width: 60,
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(1),
              border: Border.all(color: appColor, width: 1.25),
            ),
            alignment: Alignment.center,
            child: Text(
              LanguageConstants.bgbp.tr,
              style: AppTextStyle.textStyleUtils400(
                color: Colors.white,
                size: 13.5,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: AppTextStyle.textStyleUtils400(
                    color: Colors.black54, size: 13.5),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }

  Widget donateButton() {
    return SizedBox(
      width: 250,
      height: 41,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          LanguageConstants.iwantToDonateText.tr,
          style: AppTextStyle.textStyleUtils600(
            color: Colors.white,
            size: 12.8,
          ),
        ),
      ),
    );
  }
}
