import 'package:brandslabels/app/controller/dashboard_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/no_network_widget/no_network_widget.dart';
import 'package:brandslabels/app/presentation/screens/brand_list/brand_list_page.dart';
import 'package:brandslabels/app/presentation/screens/my_account/my_account_menu_screen.dart';
import 'package:brandslabels/app/presentation/screens/search/search_screen.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:meta_package/api/models/home/menu_model.dart';
import '../../../core/utils/app_routes.dart';
import 'package:brandslabels/app/theme/colors.dart';
import '../cart/cart_screen.dart';
import '../home/home_screen.dart';
import 'widgets/navbar_widget.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isConnected.value
        ? Scaffold(
            body: SafeArea(
              child: Scaffold(
                  key: controller.scaffoldkey,
                  backgroundColor: Colors.transparent,
                  drawer: getDrawer(),
                  resizeToAvoidBottomInset: true,
                  body: Stack(
                    children: [
                      TabBarView(
                        controller: controller.tabController?.value,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const HomeScreen(),
                          const SearchScreen(),
                          BrandListPage(),
                          const CartScreen(),
                          const MyAccountMenuPage(),
                        ],
                      ),
                      Obx(
                        () => appBar(),
                      ),
                    ],
                  ),
                  bottomNavigationBar: const NavbarWidget()),
            ),
          )
        : const NoNetworkWidget());
  }

  Widget appBar() {
    return AnimatedContainer(
        height: 60.w,
        duration: const Duration(milliseconds: 500),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                if (!(controller.scaffoldkey.currentState?.isDrawerOpen ??
                    false)) {
                  controller.scaffoldkey.currentState?.openDrawer();
                }
              },
              icon: SvgPicture.asset(AppAsset.appMenuIcon),
            ),
            controller.tabController?.value.index == 0
                ? SizedBox(
                    height: 36.w,
                    child: SvgPicture.asset(AppAsset.appLogoSvg),
                  )
                : Text(
                    controller.appbarTitle.value,
                    style: AppTextStyle.normalSemiBold16,
                  ),
            SizedBox(
              width: 30.w,
            )
          ],
        ));
  }

  Widget headerLogo() {
    return Row(
      children: [
        SizedBox(
          height: 10.h,
          child: const VerticalDivider(
            color: appBarPrimary,
            thickness: 3,
            indent: 0,
            endIndent: 0,
            width: 20,
          ),
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          height: 48.0,
          child: Image.network(
            controller.logoModel?.value.logoUrl.toString() ?? '',
            height: 48,
          ),
        ),
      ],
    );
  }

  Widget getDrawerView() {
    if (controller.menuModel?.value.childrenData == null) {
      return Container();
    }
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                margin: const EdgeInsets.only(
                    top: 50.0, left: 10.0, right: 20.0, bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text((controller.menuModel?.value.name).toString(),
                        style: AppTextStyle.textStyleUtils600(size: 16.sp)),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        AppAsset.close,
                        height: 20,
                        color: borderGrey,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2.0,
                color: borderGrey,
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 85.0),
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
                            controller.menuModel?.value.childrenData?.length,
                        itemBuilder: (context, index) {
                          ChildrenData? itemLevel1 =
                              controller.menuModel?.value.childrenData?[index];
                          return itemLevel1?.isActive ?? false
                              ? Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 5.0, right: 10.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textWithIcon(
                                        name: itemLevel1?.name ?? '',
                                        style: AppTextStyle.textStyleUtils400(
                                            size: 14.sp),
                                        isIcon:
                                            itemLevel1?.childrenData?.isEmpty ??
                                                    false
                                                ? true
                                                : false,
                                        isExpand:
                                            itemLevel1?.isExpand.value ?? false
                                                ? true
                                                : false,
                                        onTapExpand: () {
                                          itemLevel1?.isExpand.value = true;
                                          controller.menuModel?.refresh();
                                          if (itemLevel1
                                                  ?.childrenData?.isEmpty ??
                                              false) {
                                            Get.toNamed(
                                                RoutesConstants
                                                    .productListScreen,
                                                arguments: [
                                                  "dash",
                                                  itemLevel1?.id,
                                                  itemLevel1?.name
                                                ]);
                                          }
                                        },
                                        onTapCollapse: () {
                                          itemLevel1?.isExpand.value = false;
                                          controller.menuModel!
                                              .refresh(); // for (var element in itemLevel1.childrenData!) {
                                        },
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.3,
                                        child: itemLevel1?.isExpand.value ??
                                                false
                                            ? ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: itemLevel1
                                                    ?.childrenData?.length,
                                                itemBuilder: (context, index1) {
                                                  ChildrenData? itemLevel2 =
                                                      itemLevel1?.childrenData?[
                                                          index1];
                                                  return childItem(
                                                      itemLevel2, itemLevel1);
                                                })
                                            : Container(),
                                      ),
                                    ],
                                  ),
                                )
                              : Container();
                        }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget childItem(ChildrenData? itemLevel2, ChildrenData? itemLevel1) {
    return itemLevel2?.isActive ?? false
        ? Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWithIcon(
                  name: itemLevel2?.name ?? '',
                  style: AppTextStyle.textStyleUtils400(size: 13.sp),
                  isIcon: (itemLevel2?.childrenData?.isEmpty ?? false)
                      ? true
                      : false,
                  isExpand:
                      (itemLevel2?.isExpand.value ?? false) ? true : false,
                  onTapExpand: () {
                    if (itemLevel2?.childrenData?.isEmpty ?? false) {
                      Get.toNamed(RoutesConstants.productListScreen,
                          arguments: [
                            "dash",
                            itemLevel2?.id,
                            itemLevel1?.name
                          ]);
                    }
                    itemLevel2?.isExpand.value = true;
                    controller.menuModel?.refresh();
                  },
                  onTapCollapse: () {
                    itemLevel2?.isExpand.value = false;
                    controller.menuModel
                        ?.refresh(); // for (var element in itemLevel1.childrenData!) {
                  },
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    itemLevel2?.isExpand.value ?? false
                        ? ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: itemLevel2?.childrenData?.length,
                            itemBuilder: (context, index2) {
                              ChildrenData? itemLevel3 =
                                  itemLevel2?.childrenData?[index2];
                              return itemLevel3?.isActive ?? false
                                  ? GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutesConstants.productListScreen,
                                            arguments: [
                                              "dash",
                                              itemLevel3?.id,
                                              "${itemLevel1?.name} ${itemLevel3?.name}"
                                            ]);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, top: 3.0, bottom: 3.0),
                                        child: Text(
                                          itemLevel3?.name ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyle
                                              .textStyleUtils400_12(),
                                        ),
                                      ),
                                    )
                                  : Container();
                            })
                        : Container(),
                  ],
                )
              ],
            ),
          )
        : Container();
  }

  Widget getDrawer() {
    return SafeArea(
      child: Drawer(
        child: SizedBox(
          width: Get.width - 40.0,
          child: getDrawerView(),
        ),
      ),
    );
  }

  Widget headerMenu() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (!(controller.scaffoldkey.currentState?.isDrawerOpen ?? false)) {
              controller.scaffoldkey.currentState?.openDrawer();
            }
          },
          child: Image.asset(
            AppAsset.menu,
            height: 16.0,
            width: 16.0,
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(RoutesConstants.cartScreen);
          },
          child: Image.asset(
            AppAsset.cart1,
            height: 16.0,
            width: 16.0,
          ),
        ),
        const SizedBox(width: 10.0)
      ],
    );
  }

  Widget textWithIcon({
    String? name,
    TextStyle? style,
    bool isIcon = false,
    bool isExpand = false,
    GestureTapCallback? onTapExpand,
    GestureTapCallback? onTapCollapse,
  }) {
    return InkWell(
      onTap: !isExpand ? onTapExpand : onTapCollapse,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name!, overflow: TextOverflow.ellipsis, style: style),
            isIcon
                ? Container()
                : Image.asset(
                    !isExpand ? AppAsset.plus : AppAsset.minus,
                    height: 14,
                    color: Colors.black,
                    width: 14,
                  ),
          ],
        ),
      ),
    );
  }
}
