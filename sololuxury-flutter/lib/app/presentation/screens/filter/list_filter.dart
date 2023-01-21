import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/screens/filter/widget/price_filter.dart';

class ListFilterPage extends GetView<FilterController> {
  const ListFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(
                AppAsset.logo,
                height: 50,
                width: 150,
              ),
              const SizedBox(height: 40),
              Container(
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: brownColor)),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      decoration: const BoxDecoration(color: lightBrownColor),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    LanguageConstants.filtersText.tr,
                                    style: AppStyle.textStyleUtils500(
                                        size: 20, color: appColor),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.close,
                                  size: 25.0,
                                  color: appColor,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: brownColor)),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: brownColor)),
                                    width: Get.width * .42,
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.sizeClicked.value =
                                                false;
                                            controller.brandClicked.value =
                                                false;
                                            controller.colorClicked.value =
                                                false;
                                            controller.priceClicked.value =
                                                true;
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: controller
                                                        .priceClicked.value
                                                    ? backGroundColor
                                                    : lightBrownColor),
                                            width: Get.width,
                                            height: 40,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                  LanguageConstants
                                                      .priceText.tr,
                                                  style: AppStyle
                                                      .textStyleUtils400(
                                                          size: 18,
                                                          color: appColor)),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.sizeClicked.value =
                                                false;
                                            controller.brandClicked.value =
                                                false;
                                            controller.colorClicked.value =
                                                true;
                                            controller.priceClicked.value =
                                                false;
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: controller
                                                        .colorClicked.value
                                                    ? backGroundColor
                                                    : lightBrownColor),
                                            width: Get.width,
                                            height: 40,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                LanguageConstants.colorText.tr,
                                                style:
                                                    AppStyle.textStyleUtils400(
                                                        size: 18,
                                                        color: appColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.sizeClicked.value =
                                                false;
                                            controller.brandClicked.value =
                                                true;
                                            controller.colorClicked.value =
                                                false;
                                            controller.priceClicked.value =
                                                false;
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: controller
                                                          .brandClicked.value
                                                      ? backGroundColor
                                                      : lightBrownColor),
                                              width: Get.width,
                                              height: 40,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                    LanguageConstants
                                                        .brandText.tr,
                                                    style: AppStyle
                                                        .textStyleUtils400(
                                                            size: 18,
                                                            color: appColor)),
                                              )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.sizeClicked.value = true;
                                            controller.brandClicked.value =
                                                false;
                                            controller.colorClicked.value =
                                                false;
                                            controller.priceClicked.value =
                                                false;
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    controller.sizeClicked.value
                                                        ? backGroundColor
                                                        : lightBrownColor),
                                            width: Get.width,
                                            height: 40,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                  LanguageConstants.sizeText.tr,
                                                  style: AppStyle
                                                      .textStyleUtils400(
                                                          size: 18,
                                                          color: appColor)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: brownColor)),
                                      width: Get.width * .42,
                                      child: const PriceFilter()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: appColor,
                    border: Border.all(width: 1, color: brownColor)),
                width: Get.width * .9,
                child: Center(
                  child: Text(
                    LanguageConstants.applyText.tr,
                    style: AppStyle.textStyleUtils600(
                        size: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
