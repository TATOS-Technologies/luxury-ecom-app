import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';

import '../../../../controller/brand_controller.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../theme/colors.dart';
import '../brand_list_detail_screen.dart';


class BrandExpandDetailWidget extends GetView<BrandController> {
  final String text;
  final int value;
  const BrandExpandDetailWidget({Key? key,required this.text,required this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Obx(
          () => Container(
        padding: const EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.symmetric(
            vertical: 2,
            // horizontal: 8,
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                  border: Border.all(color: greyF4F4F4, width: 1.w),
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: greyF5F5F5,
                            borderRadius: BorderRadius.circular(3)),
                        height: 40.w,
                        width: 40.w,
                        child: Center(
                          child: CommonTextPoppins(
                            text,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                            debugPrint(
                                "text is character $text ${controller.getBrandListlengthForBrandPage(text)}");
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
                                    countryInsideList.name
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
                                child: CommonTextPoppins(
                                  firstCapitalize(countryInsideList.name),
                                  fontSize: 14.sp,
                                ),
                              ),
                            );
                          },
                        ),
                        if (controller.listDisplay(text).length > 10)
                          InkWell(
                            onTap: () {
                              debugPrint(
                                  "${controller.listDisplay(text).length}");
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
                                style: AppTextStyle.textStyleUtils500_16(),
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
      ),
    );
  }
  String firstCapitalize(String name) {
    return name.split(" ").map((str) => str.capitalize).join(" ");
  }
}