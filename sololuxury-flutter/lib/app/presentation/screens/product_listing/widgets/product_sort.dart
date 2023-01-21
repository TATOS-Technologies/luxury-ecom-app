import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';

class ProductSort extends GetView<ProductController> {
  const ProductSort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbarDialog(
          title: LanguageConstants.sortBy.tr,
          color: appColorPrimary,
          onTapRefresh: () {
            controller.onInit();
            Get.back<dynamic>();
          }),
      backgroundColor: backGroundColor,
      body: Obx(() {
        return Column(
          children: [
            // const Divider(
            //   color: Colors.black,
            //   thickness: 1.5,
            // ),
            ...List.generate(
                controller.sortTypeList.length,
                (index) => InkWell(
                      onTap: () {
                        controller.selectedSortIndex.value = index;
                        controller.selectedSortVal.value =
                            controller.sortTypeList[index];
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.0,
                            right: 30,
                            top: index == 0 ? 25 : 15,
                            bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.sortTypeList[index].name ?? '',
                              style: AppStyle.textStyleUtils500(
                                color: appColorPrimary,
                              ).copyWith(fontSize: 14.sp),
                            ),
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: appColorPrimary, width: 2),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(2.2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.selectedSortIndex.value ==
                                          index
                                      ? appColorPrimary
                                      : Colors.transparent,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
            SizedBox(
              height: 56.h,
            ),
            SizedBox(
              child: CommonThemeButton(
               onTap: () {
                  controller.onSortingClick();
                },
                title: 
                  LanguageConstants.applyText.tr,
                 
              ),
            )
          ],
        );
      }),
    );
  }
}
