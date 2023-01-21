import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import 'widget/filter_drop_down.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  bool childrenDataLength(int index1) {
    return (controller
                .menuModel!.value.childrenData?[index1].childrenData?.length ??
            0) >
        0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: homeBackground,
      appBar: AppBar(
        backgroundColor: homeBackground,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            controller.scaffoldKey.currentState?.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(ImageConstant.menuIcon),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: SvgPicture.asset(ImageConstant.searchIcon),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: SvgPicture.asset(ImageConstant.heartIcon),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: SvgPicture.asset(ImageConstant.shoppingCartIcon,
                  color: Colors.black),
            ),
          ),
        ],
        title: Image.asset(AppAsset.logo, width: 110),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: controller.scrollNotificationData,
              child: Obx(
                () => controller.menuModel?.value.childrenData == null
                    ? const Center(
                        child: SpinKitThreeBounce(
                          color: appColor,
                          // size: 50.0,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            const FilterDropDown(),
                            const SizedBox(height: 10),
                            controller.searchValue.value.isNotEmpty
                                ? controller.isSearchDataLoad.value
                                    ? const Expanded(
                                        child: Center(
                                          child: SpinKitThreeBounce(
                                            color: appColor,
                                          ),
                                        ),
                                      )
                                    : controller.productsList.isNotEmpty
                                        ? Expanded(
                                            child: Scaffold(
                                              backgroundColor:
                                                  Colors.transparent,
                                              floatingActionButton: Container(
                                                decoration: BoxDecoration(
                                                  color: appColorPrimary,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 4.0,
                                                    horizontal: 8,
                                                  ),
                                                  child: Text(
                                                    '${controller.productCount.value.toString()}/${(controller.searchItemList.value.totalCount ?? 0).toString()}',
                                                    style: AppStyle
                                                        .textStyleUtils400(
                                                            size: 10,
                                                            color: whiteColor),
                                                  ),
                                                ),
                                              ),
                                              floatingActionButtonLocation:
                                                  FloatingActionButtonLocation
                                                      .startDocked,
                                              body: Column(
                                                children: [
                                                  Expanded(
                                                    child: GridView.builder(
                                                        controller: controller
                                                            .scrollController,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        scrollDirection: Axis
                                                            .vertical,
                                                        addAutomaticKeepAlives:
                                                            true,
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
                                                                mainAxisSpacing:
                                                                    10,
                                                                crossAxisSpacing:
                                                                    12.5,
                                                                childAspectRatio:
                                                                    0.70),
                                                        itemBuilder:
                                                            (_, index) {
                                                          ProductItem item =
                                                              controller
                                                                      .productsList[
                                                                  index];
                                                          return Product(
                                                            item: item,
                                                            index: index,
                                                          );
                                                        },
                                                        itemCount: controller
                                                            .productsList
                                                            .length),
                                                  ),
                                                  controller
                                                          .productLoading.value
                                                      ? const Center(
                                                          child:
                                                              SpinKitThreeBounce(
                                                            color: appColor,
                                                            size: 20.0,
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Expanded(
                                            child: NoData(
                                              textForQuery:
                                                  controller.txtList.text,
                                              onTap: () {
                                                controller.searchValue.value =
                                                    '';
                                                controller.txtList.clear();
                                              },
                                            ),
                                          )
                                : Expanded(
                                    child: DefaultTabController(
                                      length: controller.menuModel!.value
                                              .childrenData?.length ??
                                          0,
                                      initialIndex: 0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          TabBar(
                                            indicator:
                                                const UnderlineTabIndicator(
                                                    borderSide: BorderSide(
                                                        width: 1.0,
                                                        color: appColor),
                                                    insets: EdgeInsets
                                                        .symmetric(
                                                            horizontal:
                                                                16.0)),
                                            isScrollable: true,
                                            indicatorColor: primary,
                                            indicatorSize:
                                                TabBarIndicatorSize.tab,
                                            labelStyle: AppTextStyle
                                                .textStyleUtils500(),
                                            unselectedLabelStyle:
                                                AppTextStyle.textStyleUtils500(),
                                            labelColor: primary,
                                            unselectedLabelColor:
                                                grey6D6D6D,
                                            tabs: List<Widget>.generate(
                                              controller
                                                      .menuModel!
                                                      .value
                                                      .childrenData
                                                      ?.length ??
                                                  0,
                                              (int index) {
                                                return Tab(
                                                  height: 15,
                                                  child: Text(
                                                    controller
                                                            .menuModel!
                                                            .value
                                                            .childrenData?[
                                                                index]
                                                            .name ??
                                                        '',
                                                   
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              physics: const BouncingScrollPhysics(),
                                              children:
                                                  List<Widget>.generate(
                                                controller
                                                        .menuModel!
                                                        .value
                                                        .childrenData
                                                        ?.length ??
                                                    0,
                                                (int index1) {
                                                  return Padding(
                                                    padding:  EdgeInsets.symmetric(horizontal: 24.w),
                                                    child: childrenDataLength(
                                                            index1)
                                                        ? ListView.builder(
                                                          physics: const BouncingScrollPhysics(),
                                                            itemCount: controller
                                                                    .menuModel
                                                                    ?.value
                                                                    .childrenData?[
                                                                        index1]
                                                                    .childrenData
                                                                    ?.length ??
                                                                0,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              var data2 = controller
                                                                  .menuModel!
                                                                  .value
                                                                  .childrenData?[
                                                                      index1]
                                                                  .childrenData?[index];
                                                              return data2!
                                                                      .childrenData!
                                                                      .isNotEmpty
                                                                  ? ExpansionTile(
                                                                      // tileHeight: 30,
                                                                      // contentPadding: EdgeInsets.zero,
                                                                      // verticalVisualDensity: -1,
                                                                      title:
                                                                          Text(
                                                                        data2.name ??
                                                                            '',
                                                                        style:
                                                                            AppStyle.textStyleUtils500(color: ticketTextColor),
                                                                      ),
                                                                      children: [
                                                                        ListView
                                                                            .builder(
                                                                          shrinkWrap:
                                                                              true,
                                                                          physics:
                                                                              const NeverScrollableScrollPhysics(),
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          itemCount:
                                                                              data2.childrenData?.length ?? 0,
                                                                          itemBuilder:
                                                                              (context, index2) {
                                                                            ChildrenData? itemLevel3 = data2.childrenData?[index2];
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                Get.toNamed(RoutesConstants.productListScreen, arguments: [
                                                                                  "dash",
                                                                                  itemLevel3?.id,
                                                                                  itemLevel3?.name ?? ''
                                                                                ]);
                                                                              },
                                                                              child: Container(
                                                                                margin: EdgeInsets.only(left: 30.w, top: 8.w, bottom: 8.w),
                                                                                child: Text(
                                                                                  itemLevel3?.name ?? '',
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: AppTextStyle.textStyleUtils400(color: ticketTextColor),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        )
                                                                      ],
                                                                    )
                                                                  : ListTile(
                                                                      title:
                                                                          Text(
                                                                        data2.name ??
                                                                            '',
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style:
                                                                            AppStyle.textStyleUtils500(color: ticketTextColor),
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        Get.toNamed<dynamic>(
                                                                            RoutesConstants.productListScreen,
                                                                            arguments: [
                                                                              "dash",
                                                                              controller.menuModel?.value.childrenData?[index1].id,
                                                                              controller.menuModel?.value.childrenData?[index1].name
                                                                            ]);
                                                                      },
                                                                    );
                                                            },
                                                          )
                                                        : SingleChildScrollView(
                                                            physics:
                                                                const BouncingScrollPhysics(),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const NothigToShowAnimationWidget(),
                                                                CommonTextPoppins(
                                                                  LanguageConstants
                                                                      .noProductsFound
                                                                      .tr,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  fontSize:
                                                                      14.sp,
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      20.h,
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        35.w,
                                                                    child:
                                                                        CommonThemeButton(
                                                                      onTap:
                                                                          () {
                                                                        Get.toNamed(
                                                                          RoutesConstants.specialRequesScreen,
                                                                          arguments: [
                                                                            controller.txtList.text,
                                                                            "category"
                                                                          ],
                                                                        );
                                                                      },
                                                                      title: LanguageConstants
                                                                          .createTicket
                                                                          .tr,
                                                                    )),
                                                                SizedBox(
                                                                  height:
                                                                      60.h,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
              ),
            ),
            Obx(
              () => !controller.visibleLoader.value
                  ? const SizedBox.shrink()
                  : Center(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: const SpinKitThreeBounce(
                          color: appColor,
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget productListDesign({dynamic product}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed<dynamic>(RoutesConstants.productDetailsScreen,
            arguments: [product]);
      },
      child: Container(
        width: 150,
        color: backGroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 210,
              //padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: appColor,
                  width: 1.4,
                ),
              ),
              child: Stack(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    "${AppConstants.productImageUrl}${product?.customAttributes![1].value}",
                    height: 210,
                    width: 210,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        AppAsset.heart,
                        height: 14,
                        color: appColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${product?.name}",
              style: AppStyle.textStyleUtils400_16()
                  .copyWith(overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 6),
            Text(
              "${product?.name}",
              style: AppStyle.textStyleUtils400_16()
                  .copyWith(overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${product?.price}",
                  style: AppStyle.textStyleUtils600_14(),
                ),
                Text(
                  "\$ ${product?.price}",
                  style: AppStyle.textStyleUtils600_14(color: Colors.black45)
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
