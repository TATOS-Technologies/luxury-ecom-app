import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/custom_expansion_tile.dart'
    as custom;

import '../../../../../all_imports.dart';

class GetDrawerView extends GetView<DashboardController> {
  const GetDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.menuModel?.value.childrenData == null) {
      return Container();
    }
    return Container(
      height: Get.height,
      width: Get.width,
      color: homeBackground,
      child: Stack(
        children: [
          Container(
            height: 50.h,
            margin: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).viewPadding.top),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50.h,
                    color: appColorPrimary,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back<dynamic>();
                            },
                            child: SvgPicture.asset(AppAsset.svgMenuIcon,
                                color: appColorAccent,
                                height: 18.0,
                                width: 18.0)),
                        Row(
                          children: [
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              LanguageConstants.menuText.tr,
                              style: AppStyle.textStyleUtils400_16(
                                  color: appColorAccent),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 75),
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
                        SizedBox(
                          height: 50.h,
                        ),
                        ListView.builder(
                            // Important: Remove any padding from the ListView.
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: controller
                                .menuModel?.value.childrenData?.length,
                            itemBuilder: (context, index) {
                              ChildrenData? itemLevel1 = controller
                                  .menuModel?.value.childrenData?[index];
                              return (itemLevel1?.isActive ?? false)
                                  ? Column(
                                      children: [
                                        custom.ExpansionTile(
                                          tileHeight: 40,
                                          verticalVisualDensity: -1,
                                          contentPadding: const EdgeInsets.only(
                                              left: 10, right: 20),
                                          title: Text(itemLevel1?.name ?? '',
                                              style:
                                                  AppStyle.textStyleUtils500_16(
                                                      color: appColorPrimary)),
                                          isIcon: (itemLevel1
                                                      ?.childrenData?.isEmpty ??
                                                  false)
                                              ? true
                                              : false,
                                          onExpansionChanged: (val) {
                                            if (itemLevel1
                                                    ?.childrenData?.isEmpty ??
                                                false) {
                                              Get.toNamed<dynamic>(
                                                  RoutesConstants
                                                      .productListScreen,
                                                  arguments: [
                                                    "dash",
                                                    itemLevel1?.id,
                                                    itemLevel1?.name
                                                  ]);
                                            }
                                          },
                                          children: [
                                            ListView.builder(
                                              padding: const EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 0,
                                                  bottom: 10),
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: itemLevel1
                                                  ?.childrenData?.length,
                                              itemBuilder: (context, index1) {
                                                ChildrenData itemLevel2 =
                                                    itemLevel1?.childrenData?[
                                                            index1] ??
                                                        ChildrenData();
                                                return custom.ExpansionTile(
                                                  title: Text(itemLevel2.name!,
                                                      style: AppStyle
                                                          .textStyleUtils400(
                                                        size: 15,
                                                        color: appColorPrimary,
                                                      )),
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 25, right: 20),
                                                  tileHeight: 35,
                                                  verticalVisualDensity: -1,
                                                  isIcon: (itemLevel2
                                                              .childrenData
                                                              ?.isEmpty ??
                                                          false)
                                                      ? true
                                                      : false,
                                                  onExpansionChanged: (a) {
                                                    if (itemLevel2.childrenData
                                                            ?.isEmpty ??
                                                        false) {
                                                      Get.toNamed<dynamic>(
                                                          RoutesConstants
                                                              .productListScreen,
                                                          arguments: [
                                                            "dash",
                                                            itemLevel2.id,
                                                            itemLevel1?.name
                                                          ]);
                                                    }
                                                  },
                                                  children: [
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        itemCount: itemLevel2
                                                            .childrenData
                                                            ?.length,
                                                        itemBuilder:
                                                            (context, index2) {
                                                          ChildrenData
                                                              itemLevel3 =
                                                              itemLevel2
                                                                      .childrenData![
                                                                  index2];
                                                          return GestureDetector(
                                                            onTap: () {
                                                              Get.toNamed<
                                                                      dynamic>(
                                                                  RoutesConstants
                                                                      .productListScreen,
                                                                  arguments: [
                                                                    "dash",
                                                                    itemLevel3
                                                                        .id,
                                                                    "${itemLevel1?.name} ${itemLevel3.name}"
                                                                  ]);
                                                            },
                                                            child: Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          40.0,
                                                                      top: 3.0,
                                                                      bottom:
                                                                          3.0),
                                                              child: Text(
                                                                itemLevel3
                                                                        .name ??
                                                                    '',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: AppStyle
                                                                    .textStyleUtils400_12(
                                                                        color:
                                                                            appColorPrimary),
                                                              ),
                                                            ),
                                                          );
                                                        })
                                                  ],
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                        const Divider(
                                          height: 2.0,
                                          color: whiteColor,
                                        )
                                      ],
                                    )
                                  : Container();
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
