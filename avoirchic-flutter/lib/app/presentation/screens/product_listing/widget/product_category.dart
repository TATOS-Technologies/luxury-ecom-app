import 'package:avoirchic/app/controller/product_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_field_open_sans.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:meta_package/translations/translations.dart';

class ProductCategory extends GetView<ProductController> {
  const ProductCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        alignment: Alignment.centerLeft,
        color: appBorderColor.withOpacity(0.1),
        padding: const EdgeInsets.only(
          left: 5.0,
        ),
        margin: const EdgeInsets.only(
          right: 10.0,
          top: 10.0,
          bottom: 10.0,
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: controller.filterModelList.length,
          itemBuilder: (_, index) {
            controller.filterModel.value = controller.filterModelList[index];
            return categoryWidget(
              controller.filterModel.value,
              index,
            );
          },
        ),
      ),
    );
  }

  Widget categoryWidget(FilterModel item, int index) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.changedData(index);
          controller.selectedCategory.value = item;
        },
        child: Container(
          height: 50.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: controller.currentCategoryIndex.value == index
                ? Colors.white
                : Colors.transparent,
          ),
          width: Get.width,
          child: Align(
            alignment: Alignment.centerLeft,
            child: CommonTextPoppins(
              "${item.attrLabel}",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductSubCategory extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(
          right: 10.0,
          top: 10.0,
          bottom: 10.0,
        ),
        alignment: Alignment.topLeft,
        child: subCategoryWidget(),
      ),
    );
  }

  Widget subCategoryWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 45.0,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: appBorderColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 15.0,
              ),
              Image.asset(
                AppAsset.search1,
                color: appBorderColor,
                height: 18.0,
                width: 18.0,
              ),
              const SizedBox(
                width: 3.0,
              ),
              Expanded(
                child: CommonTextFieldPoppins(
                  hintText: LanguageConstants.searchText.tr,
                  controller: controller.searchEditingController,
                  textFieldBorder: Border.all(
                    color: Colors.transparent,
                  ),
                  textColor: Colors.black,
                  fontWeight: FontWeight.w500,
                  onChanged: (val) {
                    debugPrint("onChanged -> $val");
                    // controller.searchFilter(val);
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(
              top: 5.0,
            ),
            children: [
              Obx(
                () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  // <- add
                  itemCount: controller.subCategoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Category category = controller.subCategoryList[index];
                    return InkWell(
                      onTap: () {
                        category.isSelected.value = !category.isSelected.value;

                        if (category.isSelected.value) {
                          controller.selectedMap.containsKey(
                                  controller.selectedCategory.value.attrCode)
                              ? controller.selectedMap.update(
                                  controller.selectedCategory.value.attrCode!,
                                  (value) {
                                  List tempVal = value;
                                  // debugPrint( value.toString().replaceAll("[", "").replaceAll("]", "").removeAllWhitespace);
                                  value.contains(category.value)
                                      ? tempVal.remove(category.value)
                                      : tempVal.add(category.value);
                                  return tempVal;
                                })
                              : controller.selectedMap.addAll({
                                  controller.selectedCategory.value.attrCode!: [
                                    category.value
                                  ]
                                });
                        } else {
                          controller.selectedMap.containsKey(
                                  controller.selectedCategory.value.attrCode)
                              ? controller.selectedMap.update(
                                  controller.selectedCategory.value.attrCode!,
                                  (value) {
                                  List tempVal = value;
                                  value.contains(category.value)
                                      ? tempVal.remove(category.value)
                                      : tempVal.add(category.value);
                                  return tempVal;
                                })
                              : controller.selectedMap.addAll({
                                  controller.selectedCategory.value.attrCode!: [
                                    category.value
                                  ]
                                });
                        }
                        debugPrint('${controller.selectedMap}');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(
                          10.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(() => Container(
                                  height: 24.0,
                                  width: 24.0,
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    category.isSelected.value
                                        ? Icons.check_box_sharp
                                        : Icons.check_box_outline_blank_sharp,
                                    color: Colors.black54,
                                    size: 24.0,
                                  ),
                                )),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: CommonTextPoppins(
                                category.display,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
