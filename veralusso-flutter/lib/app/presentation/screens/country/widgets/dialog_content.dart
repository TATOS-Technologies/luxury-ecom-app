import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/store_websites_model.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/controller/my_account/my_account_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_button.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';
import 'package:veralusso/app/theme/colors.dart';

class DialogContent extends GetView<CountryController> {
  final StoreWebSitesModel item;
  DialogContent(this.item, {Key? key}) : super(key: key);
  final MyAccountController myAccountController =
      Get.find<MyAccountController>();
  @override
  final CountryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextMontserrat(
            LanguageConstants.selectLangCurrText.tr,
            fontSize: 15,
            textAlign: TextAlign.center,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 15.0),
          CommonTextMontserrat(
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
                CommonTextMontserrat(
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
                          child: Obx(() => CommonTextMontserrat(
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
                                    : grey,
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
                CommonTextMontserrat(
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
                          child: Obx(() => CommonTextMontserrat(
                                controller.rxCurrencyList.length - 1 != index
                                    ? "${controller.rxCurrencyList[index].toString().toUpperCase()} / "
                                    : controller.rxCurrencyList[index]
                                        .toString()
                                        .toUpperCase(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: controller.currencySelectIndex.value ==
                                        index
                                    ? Colors.black
                                    : grey,
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
              SizedBox(
                height: 35.0,
                child: CommonButton(
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () async {
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
                    Get.back();
                  },
                  elevation: 0.0,
                  color: Colors.black,
                  borderRadius: 25.0,
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CommonTextMontserrat(
                      LanguageConstants.saveText.tr,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 35.0,
                child: CommonButton(
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () async {
                    controller.languageSelectIndex.value = 0;
                    controller.currencySelectIndex.value = 0;
                    controller.isChangeLanguage.value = false;
                    controller.isChangeCurrency.value = false;
                    Get.back();
                  },
                  elevation: 0.0,
                  color: Colors.black,
                  borderRadius: 25.0,
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CommonTextMontserrat(
                      LanguageConstants.cancelText.tr,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
