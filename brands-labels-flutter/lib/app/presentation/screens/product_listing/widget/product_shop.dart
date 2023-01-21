import 'package:brandslabels/app/controller/product_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_field_open_sans.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:meta_package/translations/translations.dart';

class ShopByWidget extends GetView<ProductController> {
  const ShopByWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () async {
          showGeneralDialog(
            context: Get.context!,
            barrierColor: Colors.black12.withOpacity(0.6),
            // Background color
            barrierDismissible: false,
            barrierLabel: 'Dialog',
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) {
              return filter();
            },
          );
        },
        child: Container(
          height: 40.h,
          margin:  EdgeInsets.only(left: 10.w),
          decoration:  BoxDecoration(
            color: profileTileBG,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: textfieldBorderGrey,width: 2),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAsset.svgfilter,
                   width: 20.w,
                height: 20.w,
                ),
                const SizedBox(
                  width: 24,
                ),
                Text(
                  LanguageConstants.filter.tr,
                  style: AppTextStyle.textStyleUtils500_16(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget filter() {
    return Material(
      child: Scaffold(
        appBar: commonAppbarDialog(
            title: LanguageConstants.filter.tr,
            onTapRefresh: () {
              Get.back();
              controller.onInit();
            }),
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // category(),
                      // subCategory(),
                      filterOptionList()
                    ],
                  ),
                ),
                SizedBox(
                    height: 35.w,
                    width: 90.w,
                    child: CommonThemeButton(onTap: controller.onFilterClick, title: LanguageConstants.applyFilterText.tr))

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget filterOptionList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.filterModelList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(.25),
              border: Border.all(
                color:borderGrey,
                width: 1,
              ),
            ),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            // height: 40,
            // width: 60,

            child: ExpansionTile(
                onExpansionChanged: (bool selected) {
                  controller.filterModelList[index].isSelected = selected;
                  controller.update();
                },
                trailing: GetBuilder<ProductController>(builder: (controller) {
                  return controller.filterModelList[index].isSelected
                      ? const Icon(
                    Icons.remove,
                    color: Colors.black,
                  )
                      : const Icon(
                    Icons.add,
                    color: Colors.black,
                  );
                }),
                title: CommonTextOpenSans(
                  "${controller.filterModelList[index].attrLabel}",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: childFilterOption(
                      controller.filterModelList[index].category,
                      controller.filterModelList[index].attrCode,
                      controller.filterModelList[index],
                    ),
                  )
                ]),
          );
        });
  }


  Widget childFilterOption(
      List<Category>? childCategory2,
      String? attrCode,
      FilterModel filter,
      ) {
    return Container(
      // color: Colors.red,
      // height: 100,
      child: (attrCode != 'brands' && attrCode != 'cat' && attrCode != 'price')
          ? GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 5,
          children: List.generate((childCategory2?.length ?? 0), (i) {
            return InkWell(
              onTap: () {
                controller.selectedCategory.value = filter;
                controller.checkUncheckOptions(
                  childCategory2,
                  i,
                );
                debugPrint(controller.selectedMap.toString());
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  children: [
                    Obx(
                          () => Container(
                        height: 24.0,
                        width: 24.0,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          childCategory2![i].isSelected.value
                              ? Icons.check_box_sharp
                              : Icons.check_box_outline_blank_sharp,
                          color: Colors.black,
                          size: 24.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                      ),
                      child: Text(
                        '${childCategory2![i].display}  (${childCategory2![i].count})',
                        style: AppTextStyle.textStyleUtils400(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }))
          : attrCode == 'price'
          ? GetBuilder<ProductController>(builder: (controller) {
        return Column(
          children: [
            RangeSlider(
              inactiveColor: grey.withOpacity(.6),
              activeColor: Colors.black,
              values: controller.currentRangeValues,
              min: filter.minPrice,
              max: filter.maxPrice,
              // divisions: 10,
              labels: RangeLabels(
                controller.currentRangeValues.start
                    .round()
                    .toString(),
                controller.currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                controller.currentRangeValues = values;
                controller.update();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Text(
                  controller.getPriceRangeWithCurrencyForFilter()),
            )
          ],
        );
      })
          : attrCode == 'brands'
          ? GetBuilder<ProductController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 15,
                ),
                child: CommonTextFieldPoppins(
                  hintText: LanguageConstants.searchText.tr,
                  controller: controller.searchEditingController,
                  textFieldBorder: Border.all(
                    color: Colors.black,
                  ),
                  textColor: Colors.black,
                  fontWeight: FontWeight.w600,
                  onChanged: (val) {
                    debugPrint("onChanged -> $val");
                    controller.data = [];
                    controller.data = controller.searchFilter(
                      val,
                      childCategory2,
                    );
                    childCategory2 = controller.data;
                  },
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // physics:const NeverScrollableScrollPhysics(),
                  itemCount: controller.isSearch
                      ? controller.data?.length
                      : childCategory2?.length,
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      onTap: () {
                        if (controller.isSearch) {
                          controller.selectedCategory.value =
                              filter;
                          controller.checkUncheckOptions(
                            controller.data,
                            i,
                          );
                        } else {
                          controller.selectedCategory.value =
                              filter;
                          controller.checkUncheckOptions(
                            childCategory2,
                            i,
                          );
                        }
                      },
                      child: controller.isSearch
                          ? Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        // height: 10,
                        // width: 50,
                        // color: Colors.yellow,
                        child: Row(
                          children: [
                            Obx(
                                  () => Container(
                                height: 24.0,
                                width: 24.0,
                                alignment:
                                Alignment.centerLeft,
                                child: Icon(
                                  controller.data![i]
                                      .isSelected.value
                                      ? Icons
                                      .check_box_sharp
                                      : Icons
                                      .check_box_outline_blank_sharp,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(
                                left: 5,
                                bottom: 5,
                              ),
                              child: Text(
                                '${controller.data![i].display}  (${controller.data![i].count})',
                                style: AppTextStyle
                                    .textStyleUtils400(),
                              ),
                            ),
                          ],
                        ),
                      )
                          : Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        // height: 10,
                        // width: 50,
                        // color: Colors.yellow,
                        child: Row(
                          children: [
                            Obx(
                                  () => Container(
                                height: 24.0,
                                width: 24.0,
                                alignment:
                                Alignment.centerLeft,
                                child: Icon(
                                  childCategory2![i]
                                      .isSelected
                                      .value
                                      ? Icons
                                      .check_box_sharp
                                      : Icons
                                      .check_box_outline_blank_sharp,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(
                                  left: 5, bottom: 5),
                              child: Text(
                                '${childCategory2![i].display}  (${childCategory2![i].count})',
                                style: AppTextStyle
                                    .textStyleUtils400(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        );
      })
          : SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                // physics:const NeverScrollableScrollPhysics(),
                itemCount: childCategory2?.length,
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    onTap: () {
                      controller.selectedCategory.value = filter;
                      controller.checkUncheckOptions(
                        childCategory2,
                        i,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          Obx(
                                () => Container(
                              height: 24.0,
                              width: 24.0,
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                childCategory2![i]
                                    .isSelected
                                    .value
                                    ? Icons.check_box_sharp
                                    : Icons
                                    .check_box_outline_blank_sharp,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              bottom: 5,
                            ),
                            child: Text(
                              '${childCategory2![i].display}  (${childCategory2![i].count})',
                              style: AppTextStyle
                                  .textStyleUtils400(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}