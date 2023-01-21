import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:veralusso/app/controller/home/home_controller.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

import 'text_with_icon.dart';

class GetDrawerView extends GetView<HomeController> {
  const GetDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            padding: EdgeInsets.zero,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  ListView.builder(
                      // Important: Remove any padding from the ListView.
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: 1,
                      //controller.menuModel?.value?.childrenData?.length,
                      itemBuilder: (context, index) {
                        ChildrenData itemLevel1 = ChildrenData();
                        // controller.menuModel?.value?.childrenData?[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWithIcon(
                                name: itemLevel1.name!,
                                style: AppTextStyle.textStyleUtils400_18(),
                                isIcon: (itemLevel1.childrenData?.isEmpty ?? false) ? true : false,
                                isExpand: itemLevel1.isExpand.value ? true : false,
                                onTapExpand: () {
                                  itemLevel1.isExpand.value = true;
                                  // controller.menuModel?.refresh();
                                },
                                onTapCollapse: () {
                                  itemLevel1.isExpand.value = false;
                                },
                              ),
                              SizedBox(
                                // height: 100,
                                width: Get.width,
                                child: itemLevel1.isExpand.value
                                    ? ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: itemLevel1.childrenData?.length,
                                        itemBuilder: (context, index1) {
                                          ChildrenData itemLevel2 = itemLevel1.childrenData![index1];
                                          return Container(
                                            margin: const EdgeInsets.only(left: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextWithIcon(
                                                  name: itemLevel2.name!,
                                                  style: AppTextStyle.textStyleUtils300(size: 15.0)
                                                      .copyWith(decoration: TextDecoration.underline),
                                                  isIcon: (itemLevel2.childrenData?.isEmpty ?? false) ? true : false,
                                                  isExpand: itemLevel2.isExpand.value ? true : false,
                                                  onTapExpand: () {
                                                    itemLevel2.isExpand.value = true;
                                                    // controller.menuModel!
                                                    //     .refresh();
                                                  },
                                                  onTapCollapse: () {
                                                    itemLevel2.isExpand.value = false;
                                                    // controller.menuModel!
                                                    //     .refresh(); // for (var element in itemLevel1.childrenData!) {
                                                  },
                                                ),
                                                Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 8.0,
                                                    ),
                                                    itemLevel2.isExpand.value
                                                        ? ListView.builder(
                                                            padding: EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            physics: const NeverScrollableScrollPhysics(),
                                                            itemCount: itemLevel2.childrenData!.length,
                                                            itemBuilder: (context, index2) {
                                                              ChildrenData itemLevel3 =
                                                                  itemLevel2.childrenData![index2];
                                                              return Container(
                                                                margin: const EdgeInsets.only(
                                                                    left: 10.0, top: 3.0, bottom: 3.0),
                                                                child: Text(
                                                                  itemLevel3.name!,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: AppTextStyle.textStyleUtils400_12(),
                                                                ),
                                                              );
                                                            })
                                                        : Container(),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        })
                                    : Container(),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
