import 'package:avoirchic/app/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import '../../../common_widgets/common_widget/common_text_opensans.dart';

class FilterCategoryWidget extends GetView<FilterController> {
  final FilterModel item;
  final int index;

  const FilterCategoryWidget(
      {Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.changedData(index);
          controller.selectedCategory.value = item;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                  color: controller.currentCategoryIndex.value == index
                      ? const Color(0xff367587)
                      : Colors.transparent)),
          width: Get.width,
          height: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: CommonTextOpenSans("${item.attrLabel}",
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
