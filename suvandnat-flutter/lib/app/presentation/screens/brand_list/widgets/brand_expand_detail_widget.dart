import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';
import 'package:suvandnat/app/controller/brand_list/brand_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../brand_list_detail_screen.dart';

class BrandExpandDetailWidget extends GetView<BrandController> {
  final String text;
  final int value;

  const BrandExpandDetailWidget(
      {Key? key, required this.text, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.zero,
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: Column(
              children: [
                InkWell(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        decoration: BoxDecoration(
                            color: greyF4F4F4,
                            borderRadius: BorderRadius.circular(3)),
                        height: 40.w,
                        width: 40.w,
                        child: Center(
                          child: Text(
                            text,
                            style: AppTextStyle.textStyleUtils600(
                                size: 16.sp, color: primary),
                          ),
                        )),
                  ),
                  onTap: () {
                    debugPrint("onTap");
                    if (controller.index.value == value) {
                      controller.index.value = 0;
                    } else {
                      controller.index.value = value;
                    }
                  },
                ),
                Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            controller.getBrandListlengthForBrandPage(text),
                        itemBuilder: (BuildContext context, int index) {
                          debugPrint("text is character $text");
                          final BrandModel countryInsideList =
                              controller.isSearchEnable.value
                                  ? controller.testDataList2[index]
                                  : controller.listDisplay(text)[index];
                          debugPrint(
                              "list is character ${countryInsideList.name}");
                          return InkWell(
                            onTap: () {
                              debugPrint(
                                  "this is list display ${countryInsideList.attributeId}");
                              Get.toNamed(
                                RoutesConstants.productListScreen,
                                arguments: [
                                  "brand",
                                  countryInsideList.attributeId,
                                  countryInsideList.name,
                                ],
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              decoration: const BoxDecoration(
                                border: Border(),
                              ),
                              child: Text(
                                firstCapitalize(
                                  countryInsideList.name,
                                ),
                                // "${countryInsideList.name}",
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          );
                        },
                      ),
                      if (controller.listDisplay(text).length > 10)
                        InkWell(
                          onTap: () {
                            debugPrint(
                              "${controller.listDisplay(text).length}",
                            );
                            controller.brandDetails.value = text;
                            controller.isSearchEnableForDetail.value = false;
                            controller.update();
                            Get.to(
                              const BrandDetailsPage(),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Text(
                              LanguageConstants.more.tr,
                              style: AppTextStyle.textStyleUtils400_16(
                                  color: primary),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String firstCapitalize(String name) {
    return name.split(" ").map((str) => str.capitalize).join(" ");
  }
}
