import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:veralusso/app/theme/app_asset.dart';

import 'package:veralusso/app/controller/select_country/select_country_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

import 'widgets/select_country_appbar.dart';

class SelectCountryScreen extends GetView<SelectCountryController> {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      LanguageConstants.changetheworldwithyourpurchaseText.tr,
    ];
    final CarouselController _controller = CarouselController();
    SelectCountryController controller = Get.find<SelectCountryController>();
    return Obx(() => Scaffold(
        appBar: PreferredSize(
          preferredSize: AppStyle.appBarSize,
          child: SelectCountryAppbar(
              imgList: imgList, carouselController: _controller),
        ),
        drawer: const Drawer(),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(color: Colors.black),
              )
            : ListView(children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    LanguageConstants.chooseCountryText.tr.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtilsUnderLine18(
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 6,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: controller.getcountryList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            controller.getcountryList[index].fullNameEnglish!
                                .toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.textStyleUtils400(),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.companyText.tr.toUpperCase(),
                      style: AppTextStyle.textStyleUtils700_18(),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 26,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black26,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.contactText.tr.toUpperCase(),
                      style: AppTextStyle.textStyleUtils700_18(),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 26,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black26,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.othersText.tr.toUpperCase(),
                      style: AppTextStyle.textStyleUtils700_18(),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 26,
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.subsubcribeText.tr.toUpperCase(),
                      style: AppTextStyle.textStyleUtils700_18(),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          LanguageConstants.getAllTheLatestText.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: null,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  bottom: 12, top: 12, left: 10),
                              hintText: LanguageConstants
                                  .enterYourEmailAddressText.tr,
                              labelStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.black54),
                              errorStyle: AppTextStyle.textStyleUtils400(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: const BorderSide(
                                  color: Colors.black26,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: const BorderSide(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                              ),
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0))),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: MediaQuery.of(context).size.height / 15.6,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: double.infinity,
                        color: Colors.black,
                        alignment: Alignment.center,
                        child: Text(
                          LanguageConstants.subscribeText.tr,
                          style: AppTextStyle.textStyleUtils400(
                              color: Colors.white),
                        ),
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                    height: 1.0, width: double.infinity, color: Colors.black),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.facebookIcon,
                      height: 26,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 14),
                    Image.asset(
                      AppAsset.twitterIcon,
                      height: 26,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 14),
                    Image.asset(
                      AppAsset.linkedInIcon,
                      height: 26,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ])));
  }
}
