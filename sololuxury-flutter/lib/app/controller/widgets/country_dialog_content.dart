import '../../../all_imports.dart';

class DialogContent extends GetView<CountryController> {
  final StoreWebSitesModel item;

  const DialogContent(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextOpenSans(
            LanguageConstants.selectLangCurrText.tr,
            fontSize: 14,
            textAlign: TextAlign.center,
            color: appColorPrimary,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 15.0),
          CommonTextOpenSans(
            LanguageConstants.selectLangCurrDescText.tr,
            fontSize: 12,
            textAlign: TextAlign.center,
            color: Colors.black,
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
                CommonTextOpenSans(
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
                          child: Obx(() => CommonTextOpenSans(
                                controller.rxLanguageList.length - 1 != index
                                    ? "${controller.rxLanguageList[index].toString().toUpperCase()} / "
                                    : controller.rxLanguageList[index]
                                        .toString()
                                        .toUpperCase(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: controller.languageSelectIndex.value ==
                                        index
                                    ? appColorPrimary
                                    : Colors.black,
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
                CommonTextOpenSans(
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
                          child: Obx(() => CommonTextOpenSans(
                                controller.rxCurrencyList.length - 1 != index
                                    ? "${controller.rxCurrencyList[index].toString().toUpperCase()} / "
                                    : controller.rxCurrencyList[index]
                                        .toString()
                                        .toUpperCase(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: controller.currencySelectIndex.value ==
                                        index
                                    ? appColorPrimary
                                    : Colors.black,
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
                  buttonType: ButtonType.elevatedButton,
                  onPressed: () async {
                    debugPrint(
                        "Language -> ${controller.isChangeLanguage.value}");
                    debugPrint(
                        "Currency -> ${controller.isChangeCurrency.value}");
                    if (!controller.isChangeLanguage.value &&
                        controller.rxLanguageList.isNotEmpty) {
                      controller.langSelected.value =
                          controller.rxLanguageList.first.toString();
                    }
                    if (!controller.isChangeCurrency.value &&
                        controller.rxCurrencyList.isNotEmpty) {
                      controller.currencySelected.value =
                          controller.rxCurrencyList.first.toString();
                    }
                    await controller.changeName(item.name);
                    await controller.changeLanguage();
                    await controller.changeCurrency();
                    await controller.getCurrentLanguageCurrency();
                    controller.languageSelectIndex.value = 0;
                    controller.currencySelectIndex.value = 0;
                    controller.isChangeLanguage.value = false;
                    controller.isChangeCurrency.value = false;
                    Get.back<dynamic>();
                  },
                  elevation: 0.0,
                  color: appColorPrimary,
                  borderRadius: 25.0,
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CommonTextOpenSans(
                      LanguageConstants.saveText.tr,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
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
                  buttonType: ButtonType.elevatedButton,
                  onPressed: () async {
                    controller.languageSelectIndex.value = 0;
                    controller.currencySelectIndex.value = 0;
                    controller.isChangeLanguage.value = false;
                    controller.isChangeCurrency.value = false;
                    Get.back<dynamic>();
                  },
                  elevation: 0.0,
                  color: appColorPrimary,
                  borderRadius: 25.0,
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CommonTextOpenSans(
                      LanguageConstants.cancelText.tr,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
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
