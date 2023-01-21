import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/product_listing/product_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class SortWidget extends GetView<ProductController> {
  @override
  final ProductController controller = Get.find();
  SortWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        elevation: 0,
        title: CommonTextPoppins(
          LanguageConstants.sortBy.tr,
          color: whiteColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        return Column(
          children: [
            SizedBox(height: 20.w,),
            ...List.generate(
                controller.sortTypeList.length,
                (index) => GestureDetector(
                      onTap: () {
                        controller.selectedSortIndex.value = index;
                        controller.selectedSortVal.value =
                            controller.sortTypeList[index];
                        debugPrint(
                            "selected sort type -> ${controller.selectedSortVal.value.name}");
                      },
                      child: Container(
                        height: 48.w,
                        margin: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 17.w
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w
                        ),
                        decoration: BoxDecoration(
                          color: greyF6F6F6,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.sortTypeList[index].name ?? '',
                              style: AppTextStyle.textStyleUtils500(),
                            ),
                            Container(
                              height: 20.w,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: Container(
                                margin: const EdgeInsets.all(2.2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.selectedSortIndex.value ==
                                            index
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
            SizedBox(
              height: 30.w,
            ),
            SizedBox(
              height: 30.w,
              width: 150.w,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9))),
                  onPressed: () {
                    controller.getSortedProducts();
                    Get.back();
                  },
                  child: Text(
                    LanguageConstants.applyFilterText.tr,
                    style:
                        AppTextStyle.textStyleUtils400_18(color: Colors.white),
                  )),
            ),
          ],
        );
      }),
    );
  }
}
