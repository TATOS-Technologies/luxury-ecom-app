import 'package:avoirchic/app/controller/product_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

class SortByWidget extends GetView<ProductController> {
  const SortByWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.w,
      width: 150.w,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: greyFAFAFA,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: greyC8C8C8, width: 2.w))),
        icon: SvgPicture.asset(AppAsset.svgSort),
        label: Text(
          LanguageConstants.sort.tr,
          style: AppTextStyle.textStyleUtils500_16(color: appBorderColor),
        ),
        onPressed: () {
          showGeneralDialog(
            context: Get.context!,
            barrierColor: Colors.black12.withOpacity(0.6),
            barrierDismissible: false,
            barrierLabel: 'Dialog',
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) {
              return sort();
            },
          );
        },
      ),
    );
  }

  Widget sort() {
    return Scaffold(
      body: Obx(
        () {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: commonAppbarDialog(
                color: primary,
                widgetColor: whiteColor,
                title: LanguageConstants.sortBy.tr,
                onTapRefresh: () {
                  Get.back();
                  controller.onInit();
                }),
            body: Column(
              children: [
                ...List.generate(
                  controller.sortTypeList.length,
                  (index) => InkWell(
                    onTap: () {
                      controller.selectedSortIndex.value = index;
                      controller.selectedSortVal.value =
                          controller.sortTypeList[index];
                      debugPrint(
                          "selected sort type -> ${controller.selectedSortVal.value.name}");
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      height: 48.w,
                      decoration: BoxDecoration(
                          color: greyFAFAFA,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.sortTypeList[index].name ?? '',
                            style: AppTextStyle.textStyleUtils500(
                              size: 14.sp,
                              color: appTextColor,
                            ),
                          ),
                          Container(
                            height: 18.w,
                            width: 18.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: appTextColor,
                                width: 2,
                              ),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(2.2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    controller.selectedSortIndex.value == index
                                        ? appTextColor
                                        : Colors.transparent,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.w,
                ),
                SizedBox(
                  height: 30.w,
                  width: 80.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: controller.onSortingClick,
                    child: CommonTextPoppins(
                      LanguageConstants.applyText.tr,
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
