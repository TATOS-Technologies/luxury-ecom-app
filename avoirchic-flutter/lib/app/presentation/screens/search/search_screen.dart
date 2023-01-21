import 'dart:ui';

import 'package:avoirchic/app/controller/search_controller.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/common_widgets/no_data_text.dart';
import 'package:avoirchic/app/presentation/screens/faq/faq_screen.dart';
import 'package:avoirchic/app/presentation/screens/search/widget/filter_dropdown.dart';
import 'package:avoirchic/app/presentation/screens/search/widget/product_list_design.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: appBGColor,
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: controller.scrollNotificationData,
            child: Obx(
              () => controller.menuModel?.value.childrenData == null
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xff367587),
                        // size: 50.0,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 70.w),
                          const FilterDropDown(),
                          SizedBox(height: 10.h),
                          controller.searchValue.value.isNotEmpty
                              ? controller.isSearchDataLoad.value
                                  ? const Expanded(
                                      child: Center(
                                        child: SpinKitThreeBounce(
                                          color: Color(0xff367587),
                                          // size: 50.0,
                                        ),
                                      ),
                                    )
                                  : controller.productsList.isNotEmpty
                                      ? Expanded(
                                          child: Scaffold(
                                            backgroundColor: Colors.transparent,
                                            floatingActionButton: Container(
                                              decoration: BoxDecoration(
                                                color: avoirChickTheme,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 4.0,
                                                  horizontal: 8,
                                                ),
                                                child: Text(
                                                  controller
                                                      .productCountVsTotalCount(),
                                                  style: AppTextStyle
                                                      .textStyleUtils400(
                                                          color: Colors.white,
                                                          size: 10),
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
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15),
                                                    addAutomaticKeepAlives:
                                                        true,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 10,
                                                      crossAxisSpacing: 12.5,
                                                      childAspectRatio: .80,
                                                    ),
                                                    itemBuilder: (_, index) {
                                                      ProductItem? item =
                                                          controller
                                                                  .productsList[
                                                              index];
                                                      return ProductListDesign(
                                                          product: item,
                                                          index: index);
                                                    },
                                                    itemCount: controller
                                                        .productsList.length,
                                                  ),
                                                ),
                                                controller.productLoading.value
                                                    ? const Center(
                                                        child:
                                                            SpinKitThreeBounce(
                                                          color:
                                                              avoirChickTheme,
                                                          size: 20.0,
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                NoData(
                                                  showText: LanguageConstants
                                                      .noDataFound.tr,
                                                  textForQuery:
                                                      controller.txtList.text,
                                                ),
                                                CommonThemeButton(
                                                  isOutLined: true,
                                                  buttonColor: whiteColor,
                                                  textColor: primary,
                                                    onTap: () {
                                                      Get.offAllNamed(
                                                          RoutesConstants
                                                              .dashboardScreen);
                                                    },
                                                    title: LanguageConstants
                                                        .continueShopping.tr)
                                              ],
                                            ),
                                          ),
                                        )
                              : Expanded(
                                  child: DefaultTabController(
                                    length: controller.menuModel?.value
                                            .childrenData?.length ??
                                        0, // length of tabs
                                    initialIndex: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          TabBar(
                                            indicator:
                                                const UnderlineTabIndicator(
                                                    borderSide: BorderSide(
                                                        width: 1.0,
                                                        color: Colors.black),
                                                    insets:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16.0)),
                                            isScrollable: true,
                                            indicatorColor: blue265B6A,
                                            indicatorSize:
                                                TabBarIndicatorSize.tab,
                                            labelStyle:
                                                AppTextStyle.textStyleUtils500(
                                                    size: 18.0),
                                            unselectedLabelStyle:
                                                AppTextStyle.textStyleUtils500(
                                                    size: 18.0),
                                            labelColor: blue265B6A,
                                            unselectedLabelColor: grey6D6D6D,
                                            tabs: List<Widget>.generate(
                                                controller.menuModel?.value
                                                        .childrenData?.length ??
                                                    0, (int index) {
                                              return Tab(
                                                height: 20,
                                                child: Text(
                                                  controller
                                                          .menuModel
                                                          ?.value
                                                          .childrenData?[index]
                                                          .name ??
                                                      '',
                                                  style: AppTextStyle
                                                      .textStyleUtils500(
                                                          size: 15.0),
                                                ),
                                              );
                                            }),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: List<Widget>.generate(
                                                controller.menuModel?.value
                                                        .childrenData?.length ??
                                                    0,
                                                (int index1) {
                                                  return (controller
                                                                  .menuModel
                                                                  ?.value
                                                                  .childrenData?[
                                                                      index1]
                                                                  .childrenData
                                                                  ?.length ??
                                                              0) >
                                                          0
                                                      ? ListView.builder(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30.w,
                                                                  vertical:
                                                                      30.w),
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
                                                            return ExpansionTil(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              tileHeight: 30,
                                                              isIcon: true,
                                                              trailing:
                                                                  const Icon(
                                                                Icons.add,
                                                                size: 15,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              verticalVisualDensity:
                                                                  -1,
                                                              title: Text(
                                                                controller
                                                                        .menuModel
                                                                        ?.value
                                                                        .childrenData?[
                                                                            index1]
                                                                        .childrenData?[
                                                                            index]
                                                                        .name ??
                                                                    '',
                                                                style: AppTextStyle
                                                                    .textStyleUtils400(),
                                                              ),
                                                              children: [
                                                                ListView
                                                                    .builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      const NeverScrollableScrollPhysics(),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  itemCount: controller
                                                                          .menuModel
                                                                          ?.value
                                                                          .childrenData?[
                                                                              index1]
                                                                          .childrenData?[
                                                                              index]
                                                                          .childrenData
                                                                          ?.length ??
                                                                      0,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index2) {
                                                                    return GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Get.toNamed(
                                                                            RoutesConstants.productListScreen,
                                                                            arguments: [
                                                                              "dash",
                                                                              controller.menuModel?.value.childrenData?[index1].childrenData?[index].childrenData?[index2].id,
                                                                              "${controller.menuModel?.value.childrenData?[index1].name} ${controller.menuModel?.value.childrenData?[index1].childrenData?[index].childrenData?[index2].name}"
                                                                            ]);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        margin: const EdgeInsets.only(
                                                                            left:
                                                                                40.0,
                                                                            top:
                                                                                3.0,
                                                                            bottom:
                                                                                3.0),
                                                                        child:
                                                                            Text(
                                                                          controller.menuModel?.value.childrenData?[index1].childrenData?[index].childrenData?[index2].name ??
                                                                              '',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              AppTextStyle.textStyleUtils400_12(color: grey6D6D6D),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                )
                                                              ],
                                                            );
                                                          },
                                                        )
                                                      : NoData(
                                                          showText:
                                                              LanguageConstants
                                                                  .noProductsFound
                                                                  .tr,
                                                          textForQuery:
                                                              controller
                                                                  .txtList.text,
                                                        );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                        color: avoirChickTheme,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
