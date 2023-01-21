import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/translations/translations.dart';
import '../../../controller/brand_list/brand_controller.dart';
import '../../../theme/app_text_style.dart';
import '../../common_widget/common_message/app_routes.dart';
import 'brand_list_detail_page.dart';

class ExpandDetailWidget extends GetView<BrandController> {
  final String text;
  final int value;

  const ExpandDetailWidget(this.text, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
          Container(
            padding: const EdgeInsets.all(0),
            child: Container(
              // color: appColor.withOpacity(0.1),
              // color: controller.index.value == value ? backGroundColor : appColor.withOpacity(0.1),
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 8,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.w, vertical: 20.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            debugPrint("onTap");
                            if (controller.index.value == value) {
                              controller.index.value = 0;
                            } else {
                              controller.index.value = value;
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            height: 40.w,
                            width: 40.w,
                            child: Center(
                              child: Text(
                                text,
                                style: AppTextStyle.textStyleUtils700(
                                    size: 20.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: controller.getBrandListlengthForBrandPage(
                          text,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          debugPrint("text is character $text");
                          final BrandModel countryInsideList =
                          controller.isSearchEnable.value
                              ? controller.testDataList2[index]
                              : controller.listDisplay(text)[index];
                          debugPrint(
                              "list is character ${countryInsideList.name}");
                          return GestureDetector(
                            onTap: () {
                              debugPrint(
                                  "this is list display ${countryInsideList
                                      .attributeId}");
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
                                vertical: 8,
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
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                            ),
                          );
                        },
                      ),
                      if (controller
                          .listDisplay(text)
                          .length > 10)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              debugPrint("${controller
                                  .listDisplay(text)
                                  .length}");
                              controller.brandDetails.value = text;
                              controller.isSearchEnableForDetail.value = false;
                              Get.to(
                                const BrandDetailsPage(),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Text(
                                LanguageConstants.andMore.tr,
                                style: AppTextStyle.textStyleUtils500_16(),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  String firstCapitalize(String name) {
    return name.split(" ").map((str) => str.capitalize).join(" ");
    // return name.split(" ").map((str) => str[0].toUpperCase() + str.substring(1)).join(" ");
  }
}
