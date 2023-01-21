import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/controller/country_screen/country_screen_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class CountryPopUpScreen extends GetView<CountryPopUpScreenController> {
  const CountryPopUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CountryPopUpScreenController());

    return Scaffold(
      key: controller.scaffoldKey.value,
      backgroundColor: const Color(0xffd1f2ff),
      appBar: AppBar(
        backgroundColor: const Color(0xffd1f2ff),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          LanguageConstants.myAccountText.tr,
          style: AppTextStyle.textStyleUtils400(),
        ),
        bottom: PreferredSize(
          child: Container(
              height: 1.0, width: double.infinity, color: Colors.black),
          preferredSize: const Size.fromHeight(1.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                controller.showCountry(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LanguageConstants.myAccountText.tr.toUpperCase(),
                    style: AppTextStyle.textStyleUtils400(),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.myOrdersText.tr,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.myWidhListText.tr,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.addressBookText.tr,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.accountInfoText.tr,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.storePaymentText.tr,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.newsletterSubText.tr,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
