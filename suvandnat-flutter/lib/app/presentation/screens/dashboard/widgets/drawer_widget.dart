import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:suvandnat/app/controller/dashboard/dashboard_controller.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/screens/dashboard/widgets/text_with_icon.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class DrawerWidget extends GetView<DashboardController> {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Drawer(
            child: SizedBox(
              width: Get.width - 40.0,
              child: getDrawerView(),
            )));
  }


  Widget getDrawerView() {
    if (controller.menuModel?.value.childrenData == null) {
      return Container();
    }
    return CommonBacground(
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: ListView(
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
                    itemCount:
                    controller.menuModel?.value.childrenData?.length ?? 0,
                    itemBuilder: (context, index) {
                      ChildrenData? itemLevel1 =
                      controller.menuModel?.value.childrenData?[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5.0, right: 10.0),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWithIcon(
                              name: itemLevel1?.name,
                              style: AppTextStyle.textStyleUtils400_16(
                                  color: itemLevel1?.isExpand.value ?? false
                                      ? appColorPrimary
                                      : appColorPrimary),
                              isIcon: itemLevel1?.childrenData?.isEmpty ?? false
                                  ? true
                                  : false,
                              isExpand: (itemLevel1?.isExpand.value ?? false)
                                  ? true
                                  : false,
                              onTapExpand: () {
                                itemLevel1?.isExpand.value = true;
                                controller.menuModel?.refresh();
                                if (itemLevel1?.childrenData?.isEmpty ??
                                    false) {
                                  Get.toNamed(RoutesConstants.productListScreen,
                                      arguments: [
                                        "dash",
                                        itemLevel1?.id,
                                        itemLevel1?.name
                                      ]);
                                }
                              },
                              onTapCollapse: () {
                                itemLevel1?.isExpand.value = false;
                                controller.menuModel
                                    ?.refresh(); // for (var element in itemLevel1.childrenData!) {
                              },
                            ),
                            SizedBox(
                              // height: 100,
                              width: Get.width / 1.3,
                              child: itemLevel1?.isExpand.value ?? false
                                  ? ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  itemCount:
                                  itemLevel1?.childrenData?.length,
                                  itemBuilder: (context, index1) {
                                    ChildrenData? itemLevel2 =
                                    itemLevel1?.childrenData?[index1];
                                    return Container(
                                      margin:
                                      const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          TextWithIcon(
                                            name: itemLevel2?.name ?? '',
                                            style: AppTextStyle
                                                .textStyleUtils400(
                                                size: 15.0,
                                                color: itemLevel2
                                                    ?.isExpand
                                                    .value ??
                                                    false
                                                    ? appColorPrimary
                                                    : Colors.black)
                                                .copyWith(
                                                decoration:
                                                TextDecoration
                                                    .underline),
                                            isIcon: itemLevel2?.childrenData
                                                ?.isEmpty ??
                                                false
                                                ? true
                                                : false,
                                            isExpand: itemLevel2
                                                ?.isExpand.value ??
                                                false
                                                ? true
                                                : false,
                                            onTapExpand: () {
                                              if (itemLevel2?.childrenData
                                                  ?.isEmpty ??
                                                  false) {
                                                Get.toNamed(
                                                    RoutesConstants
                                                        .productListScreen,
                                                    arguments: [
                                                      "dash",
                                                      itemLevel2?.id,
                                                      itemLevel1?.name
                                                    ]);
                                              }
                                              itemLevel2?.isExpand.value =
                                              true;
                                              controller.menuModel
                                                  ?.refresh();
                                            },
                                            onTapCollapse: () {
                                              itemLevel2?.isExpand.value =
                                              false;
                                              controller.menuModel!
                                                  .refresh(); // for (var element in itemLevel1.childrenData!) {
                                            },
                                          ),
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 8.0,
                                              ),
                                              itemLevel2?.isExpand.value ??
                                                  false
                                                  ? ListView.builder(
                                                  padding:
                                                  EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics:
                                                  const NeverScrollableScrollPhysics(),
                                                  itemCount: itemLevel2
                                                      ?.childrenData
                                                      ?.length,
                                                  itemBuilder: (context,
                                                      index2) {
                                                    ChildrenData?
                                                    itemLevel3 =
                                                    itemLevel2
                                                        ?.childrenData?[
                                                    index2];
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(
                                                            RoutesConstants
                                                                .productListScreen,
                                                            arguments: [
                                                              "dash",
                                                              itemLevel3
                                                                  ?.id,
                                                              itemLevel3
                                                                  ?.name
                                                            ]);
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .only(
                                                            left: 10.0,
                                                            top: 3.0,
                                                            bottom:
                                                            3.0),
                                                        child: Text(
                                                          itemLevel3
                                                              ?.name ??
                                                              '',
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                          style: AppTextStyle
                                                              .textStyleUtils400_12(),
                                                        ),
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
      ),
    );
  }
}
