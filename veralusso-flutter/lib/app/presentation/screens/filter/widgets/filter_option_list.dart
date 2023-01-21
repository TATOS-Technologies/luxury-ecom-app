import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:veralusso/app/controller/filter/filter_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_opensans.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'child_filter_option.dart';



class FilterOptionList extends GetView<FilterController> {
  const FilterOptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.filterModelList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.25),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: textFieldBoarderColor,
                width: 1.w,
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
                  controller.filterModelList?[index].isSelected = selected;
                  controller.update();
                },
                trailing: GetBuilder<FilterController>(builder: (c) {
                  return (controller.filterModelList?[index].isSelected ??
                          false)
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
                  "${controller.filterModelList?[index].attrLabel}",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: ChildFilterOption(
                      controller.filterModelList?[index].category,
                      controller.filterModelList?[index].attrCode,
                      controller.filterModelList?[index] ?? FilterModel(),
                    ),
                  )
                ]),
          );
        });
  }
}
