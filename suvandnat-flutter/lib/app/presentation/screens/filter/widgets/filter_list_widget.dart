import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:suvandnat/app/controller/filter/filter_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_opensans.dart';
import 'package:suvandnat/app/theme/app_asset.dart';

class FilterListWidget extends GetView<FilterController> {
  const FilterListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          // <- add
          itemCount: controller.subCategoryList?.length,
          itemBuilder: (BuildContext context, int index) {
            Category? category = controller.subCategoryList?[index];
            return InkWell(
              onTap: () {
                category?.isSelected.value = !category.isSelected.value;

                if (category?.isSelected.value ?? false) {
                  controller.selectedMap.containsKey(controller.selectedCategory.value.attrCode)
                      ? controller.selectedMap.update(controller.selectedCategory.value.attrCode!, (value) {
                    List tempVal = value;
                    // debugPrint( value.toString().replaceAll("[", "").replaceAll("]", "").removeAllWhitespace);
                    value.contains(category?.value) ? tempVal.remove(category?.value) : tempVal.add(category?.value);
                    return tempVal;
                  })
                      : controller.selectedMap.addAll({
                    controller.selectedCategory.value.attrCode!: [category?.value]
                  });
                } else {
                  controller.selectedMap.containsKey(controller.selectedCategory.value.attrCode)
                      ? controller.selectedMap.update(controller.selectedCategory.value.attrCode!, (value) {
                    List tempVal = value;
                    value.contains(category?.value) ? tempVal.remove(category?.value) : tempVal.add(category?.value);
                    return tempVal;
                  })
                      : controller.selectedMap.addAll({
                    controller.selectedCategory.value.attrCode!: [category?.value]
                  });
                }
                debugPrint(controller.selectedMap.toString());
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => Container(
                      height: 24.0,
                      width: 24.0,
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: [
                          Image.asset(
                            category?.isSelected.value ?? false ? AppAsset.checkIcon : AppAsset.unCheckIcon,
                            height: 18.0,
                            width: 18.0,
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                      child: CommonTextOpenSans(
                        category?.display,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
