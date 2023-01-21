import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/const/app_style.dart';

import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'package:veralusso/app/controller/home/home_controller.dart';
import 'package:veralusso/app/controller/special_size_request/special_size_request_controller.dart';
import 'package:meta_package/meta_package.dart';

import 'widgets/custom_appbar.dart';

class SpecialSizeRequestScreen extends GetView<SpecialSizeRequestController> {
  SpecialSizeRequestScreen({Key? key}) : super(key: key);
  @override
  final SpecialSizeRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        appBar: PreferredSize(
            preferredSize: AppStyle.appBarSize,
            child: CustomAppBarSpecialSize(
                imgList: imgList, caController: _controller)),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 220,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.showDialogBoxOpen(context);
                      },
                      child: Text(LanguageConstants.popupBox.tr),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LanguageConstants.specialSizeCompanyText.tr,
                            style: AppTextStyle.textStyleUtils700(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.add,
                            color: blackColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    color: const Color(0xFFE4DAC9),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LanguageConstants.specialSizeContactText.tr,
                            style: AppTextStyle.textStyleUtils700(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.add,
                            color: blackColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    color: const Color(0xFFE4DAC9),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LanguageConstants.specialSizeOtherText.tr,
                            style: AppTextStyle.textStyleUtils700(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.add,
                            color: blackColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        LanguageConstants
                            .specialSizeSubscribeToNewsletterText.tr,
                        style: AppTextStyle.textStyleUtils700(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Text(
                          LanguageConstants.specialSizeGetInformationOneText.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils500_12(),
                        ),
                        Text(
                          LanguageConstants.specialSizeGetInformationTwoText.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils500_12(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 30.0,
                      bottom: 10.0,
                    ),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: null,
                        autofocus: false,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText:
                              LanguageConstants.specialSizeEmailAddressText.tr,
                          hintStyle: AppTextStyle.textStyleUtils400_12(),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 110,
                              color: blackColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Center(
                                  child: Text(
                                    LanguageConstants
                                        .specialSizeSubscribeText.tr,
                                    style: AppTextStyle.textStyleUtils400(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide: BorderSide(color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: 1.0, width: double.infinity, color: Colors.black),
                  const SizedBox(height: 20),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
