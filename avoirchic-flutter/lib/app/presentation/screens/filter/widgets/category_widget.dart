import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import '../../../../controller/filter_controller.dart';
import 'filter_category_widget.dart';

class CategoryWidget extends GetView<FilterController> {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xff367587))),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(
            left: 10.0, right: 5.0, top: 12.0, bottom: 10.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: controller.filterModelList?.length ?? 0,
          itemBuilder: (_, index) {
            controller.filterModel?.value =
                controller.filterModelList?[index] ?? FilterModel();
            if (controller.filterModel == null) {
              return Container();
            }
            return FilterCategoryWidget(
                item: controller.filterModel?.value ?? FilterModel(),
                index: index);
          },
        ),
      ),
    );
  }
}
