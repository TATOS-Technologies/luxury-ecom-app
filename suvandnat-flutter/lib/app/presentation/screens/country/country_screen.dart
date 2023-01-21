import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/controller/my_account/my_account_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:meta_package/api/models/country/store_websites_model.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class CountryScreen extends GetView<CountryController> {
  CountryScreen({Key? key}) : super(key: key);

  final myAccountController = Get.find<MyAccountController>();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        key: controller.scaffoldkey,
        appBar:
            commonAppbar(title: LanguageConstants.changeLanguageAndCurrency.tr),
        backgroundColor: Colors.transparent,
        body: Obx(
          () => SizedBox(
            width: Get.width,
            child: Column(
              children: [
                Obx(
                  () => Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: borderGrey,
                      ),
                      color: whiteColor,
                    ),
                    child: TextFormField(
                      controller: controller.searchController.value,
                      onChanged: (value) {
                        controller.mySearch(value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: grey636363,
                        ),
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: LanguageConstants.searchCountry.tr,
                        contentPadding: const EdgeInsets.only(top: 1),
                        hintStyle:
                            AppTextStyle.textStyleUtils400(color: Colors.grey),
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 15, vertical: 10),
                ),
                Expanded(
                  child: controller.filterList.isNotEmpty &&
                          controller.searchController.value.text.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.filterList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            StoreWebSitesModel item =
                                controller.filterList[index];
                            return InkWell(
                                onTap: () async {
                                  await controller.setLanguageAndCurrency(
                                      item, false);
                                  showDialog(
                                    context: Get.context!,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                          backgroundColor: Colors.transparent,
                                          insetPadding:
                                              const EdgeInsets.all(10),
                                          child: Container(
                                              width: double.infinity,
                                              color: backGroundColor,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 15.0, 20.0, 15.0),
                                              child: dialogContent(item)));
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: CommonTextPoppins(
                                    item.name ?? "",
                                    fontSize: 18.0,
                                  ),
                                ));
                          },
                        )
                      : controller.searchController.value.text.isNotEmpty &&
                              controller.filterList.isEmpty
                          ? Center(
                              child:
                                  Text(LanguageConstants.noCountryMatches.tr),
                            )
                          : ListView.builder(
                              itemCount: controller.storeWebsitesList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                StoreWebSitesModel item =
                                    controller.storeWebsitesList[index];
                                return InkWell(
                                    onTap: () async {
                                      await controller.setLanguageAndCurrency(
                                          item, false);
                                      showDialog(
                                        context: Get.context!,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              insetPadding:
                                                  const EdgeInsets.all(10),
                                              child: Container(
                                                  width: double.infinity,
                                                  color: backGroundColor,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20.0,
                                                          15.0,
                                                          20.0,
                                                          15.0),
                                                  child: dialogContent(item)));
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: CommonTextPoppins(
                                        item.name ?? "",
                                        fontSize: 18.0,
                                      ),
                                    ));
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dialogContent(StoreWebSitesModel item) {
    debugPrint("name ${item.name}");
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextPoppins(
            LanguageConstants.selectLangCurrText.tr,
            fontSize: 15,
            textAlign: TextAlign.center,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 15.0),
          CommonTextPoppins(
            LanguageConstants.selectLangCurrDescText.tr,
            fontSize: 11,
            textAlign: TextAlign.center,
            color: Colors.black,
            height: 1.5,
          ),
          const SizedBox(height: 15.0),
          Container(
            width: Get.width,
            height: 20.0,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextPoppins(
                  "${LanguageConstants.languageText.tr} : ",
                  fontSize: 12,
                  textAlign: TextAlign.center,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 30.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.rxLanguageList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.isChangeLanguage.value = true;
                            controller.languageSelectIndex.value = index;
                            controller.setLanguageSelected(
                                controller.rxLanguageList[index].toString());
                          },
                          child: Obx(() => CommonTextPoppins(
                                controller.rxLanguageList.length - 1 != index
                                    ? "${controller.rxLanguageList[index].toString().toUpperCase()} / "
                                    : controller.rxLanguageList[index]
                                        .toString()
                                        .toUpperCase(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: controller.languageSelectIndex.value ==
                                        index
                                    ? Colors.black
                                    : Colors.black54,
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            width: Get.width,
            height: 20.0,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextPoppins(
                  "${LanguageConstants.currencyText.tr} : ",
                  fontSize: 12,
                  textAlign: TextAlign.center,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 30.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.rxCurrencyList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.isChangeCurrency.value = true;
                            controller.currencySelectIndex.value = index;
                            controller.setCurrencySelected(
                                controller.rxCurrencyList[index].toString());
                          },
                          child: Obx(() => CommonTextPoppins(
                                controller.rxCurrencyList.length - 1 != index
                                    ? "${controller.rxCurrencyList[index].toString()} / "
                                    : controller.rxCurrencyList[index]
                                        .toString(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: controller.currencySelectIndex.value ==
                                        index
                                    ? Colors.black
                                    : Colors.black54,
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: appColorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  debugPrint(
                      "Language -> ${controller.isChangeLanguage.value}");
                  debugPrint(
                      "Currency -> ${controller.isChangeCurrency.value}");
                  if (!controller.isChangeLanguage.value) {
                    controller.langSelected.value =
                        controller.rxLanguageList.first.toString();
                  }
                  if (!controller.isChangeCurrency.value) {
                    controller.currencySelected.value =
                        controller.rxCurrencyList.first.toString();
                  }
                  await controller.changeName(item.name);
                  await controller.changeLanguage();
                  await controller.changeCurrency();
                  await controller.getCurrentLanguageCurrency();
                  myAccountController.countryCurrency.value =
                      "${controller.localStoreModel?.name} (${controller.localStoreModel?.currentCurrency})";
                  controller.languageSelectIndex.value = 0;
                  controller.currencySelectIndex.value = 0;
                  //localStore.currentCurrency = '';
                  //localStore.c
                  Get.back();
                },
                child: HeadlineBodyOneBaseWidget(
                  title: LanguageConstants.saveText.tr,
                  titleColor: Colors.white,
                  fontFamily: AppConstants.fontPoppins,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: appColorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  controller.languageSelectIndex.value = 0;
                  controller.currencySelectIndex.value = 0;
                  controller.isChangeLanguage.value = false;
                  controller.isChangeCurrency.value = false;
                  Get.back();
                },
                child: HeadlineBodyOneBaseWidget(
                  title: LanguageConstants.cancelText.tr,
                  titleColor: Colors.white,
                  fontFamily: AppConstants.fontPoppins,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
