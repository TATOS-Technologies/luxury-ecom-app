import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/product_listing/product_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_opensans.dart';
import 'package:suvandnat/app/theme/colors.dart';

import 'child_filter_option.dart';

class FilterOptionList extends GetView<ProductController> {
  const FilterOptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.filterModelList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                .25,
              ),
              border: Border.all(
                color: Colors.black,
                width: .3,
              ),
            ),
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 10,
            ),
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
                          color: appColor,
                        )
                      : const Icon(
                          Icons.add,
                          color: appColor,
                        );
                }),
                title: CommonTextOpenSans(
                  "${controller.filterModelList[index].attrLabel}",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: appColor,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: ChildFilterOption(
                      controller.filterModelList[index].category,
                      controller.filterModelList[index].attrCode,
                      controller.filterModelList[index],
                    ),
                  )
                ]),
          );
        });
  }
}
