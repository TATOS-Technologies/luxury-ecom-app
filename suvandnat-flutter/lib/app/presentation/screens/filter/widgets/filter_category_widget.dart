import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:suvandnat/app/controller/filter/filter_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_opensans.dart';

class FilterCategoryWidget extends GetView<FilterController> {
  const FilterCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xff82D9FF))),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(
            left: 10.0, right: 5.0, top: 12.0, bottom: 10.0),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: controller.filterList.length,
            itemBuilder: (_, index) {
              controller.filterModel?.value = FilterModel.fromJson(
                  controller.filterList[index] as Map<String, dynamic>);
              if (controller.filterModel == null) {
                return Container();
              }
              return Obx(() => GestureDetector(
                    onTap: () {
                      controller.changedData(index);
                      controller.selectedCategory.value =
                          controller.filterModel?.value ?? FilterModel();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: controller.currentCategoryIndex.value == index
                              ? const Color(0xffB6E9FF)
                              : Colors.transparent),
                      width: Get.width,
                      height: 40,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CommonTextOpenSans(
                            "${controller.filterModel?.value.attrLabel}",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
