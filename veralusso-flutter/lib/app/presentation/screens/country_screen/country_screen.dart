import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/country_screen/country_screen_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class CountryPopUpScreen extends GetView<CountryPopUpScreenController> {
  const CountryPopUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CountryPopUpScreenController());

    return Scaffold(
      key: controller.scaffoldKey.value,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          LanguageConstants.myAccountText.tr,
          style: AppTextStyle.textStyleUtils400(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
              height: 1.0, width: double.infinity, color: Colors.black),
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
                  LanguageConstants.myOrdersText.tr.toUpperCase(),
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
                  LanguageConstants.myWidhListText.tr.toUpperCase(),
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
                  LanguageConstants.addressBookText.tr.toUpperCase(),
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
                  LanguageConstants.accountInfoText.tr.toUpperCase(),
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
                  LanguageConstants.storePaymentText.tr.toUpperCase(),
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
                  LanguageConstants.newsletterSubText.tr.toUpperCase(),
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
