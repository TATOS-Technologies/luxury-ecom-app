import 'dart:ui';

import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/controller/search_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/no_data_text.dart';
import 'package:brandslabels/app/presentation/screens/faq/faq_screen.dart';
import 'package:brandslabels/app/presentation/screens/search/widget/search_product_list_add_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/colors.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: controller.scrollNotificationData,
            child: Obx(
              () => controller.menuModel.value.childrenData == null
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xff000080),
                        // size: 50.0,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
                      child: Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top + 26.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 40.w),
                            filterDropDown(),
                            const SizedBox(height: 10),
                            controller.searchValue.value.isNotEmpty
                                ? controller.isSearchDataLoad.value
                                    ? const Expanded(
                                        child: Center(
                                          child: SpinKitThreeBounce(
                                            color: Color(0xff000080),
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
                                                  color: darkBlue,
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                    vertical: 4.0,
                                                    horizontal: 8,
                                                  ),
                                                  child: Text(
                                                    '${controller.productCount.value.toString()}/${(controller.searchItemList.value.totalCount ?? 0).toString()}',
                                                    style: AppTextStyle.textStyleUtils400(
                                                      size: 10,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
                                              body: Column(
                                                children: [
                                                  Expanded(
                                                    child: GridView.builder(
                                                      controller: controller.scrollController,
                                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                                      addAutomaticKeepAlives: true,
                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 8.w,
                                                          childAspectRatio: .66),
                                                      itemBuilder: (_, index) {
                                                        ProductItem item = controller.productsList[index];
                                                        return productListDesign(product: item, index: index);
                                                      },
                                                      itemCount: controller.productsList.length,
                                                    ),
                                                  ),
                                                  controller.productLoading.value
                                                      ? const Center(
                                                          child: SpinKitThreeBounce(
                                                            color: darkBlue,
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
                                              textForQuery: controller.txtList.text,
                                              onTap: () {
                                                controller.searchValue.value = '';
                                                controller.txtList.clear();
                                              },
                                            ),
                                          )
                                : Expanded(
                                    child: DefaultTabController(
                                      length: controller.menuModel.value.childrenData?.length ?? 0, // length of tabs
                                      initialIndex: 0,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                                            child: TabBar(
                                              indicator: const UnderlineTabIndicator(
                                                  borderSide: BorderSide(width: 1.0, color: appColor),
                                                  insets: EdgeInsets.symmetric(horizontal: 16.0)),
                                              isScrollable: true,
                                              indicatorColor: darkBlue,
                                              indicatorSize: TabBarIndicatorSize.tab,
                                              labelStyle: AppTextStyle.textStyleUtils500(size: 18.0),
                                              unselectedLabelStyle: AppTextStyle.textStyleUtils500(size: 18.0),
                                              labelColor: darkBlue,
                                              unselectedLabelColor: grey6D6D6D,
                                              tabs: List<Widget>.generate(
                                                controller.menuModel.value.childrenData?.length ?? 0,
                                                (int index) {
                                                  return Tab(
                                                    height: 15,
                                                    child: Text(
                                                      controller.menuModel.value.childrenData?[index].name ?? '',
                                                      style: AppTextStyle.textStyleUtils500(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: List<Widget>.generate(
                                                controller.menuModel.value.childrenData?.length ?? 0,
                                                (int index1) {
                                                  return childrenDataLength(index1)
                                                      ? ListView.builder(
                                                          padding:
                                                              EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                                                          itemCount: controller.menuModel.value.childrenData?[index1]
                                                                  .childrenData?.length ??
                                                              0,
                                                          itemBuilder: (BuildContext context, int index) {
                                                            var data2 = controller.menuModel.value
                                                                .childrenData?[index1].childrenData?[index];
                                                            return ExpansionTil(
                                                              tileHeight: 30,
                                                              contentPadding: EdgeInsets.zero,
                                                              verticalVisualDensity: -1,
                                                              title: Text(
                                                                data2?.name ?? '',
                                                                style: AppTextStyle.textStyleUtils400(),
                                                              ),
                                                              children: [
                                                                ListView.builder(
                                                                  shrinkWrap: true,
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  padding: EdgeInsets.zero,
                                                                  itemCount: data2?.childrenData?.length ?? 0,
                                                                  itemBuilder: (context, index2) {
                                                                    ChildrenData? itemLevel3 =
                                                                        data2?.childrenData?[index2];
                                                                    return GestureDetector(
                                                                      onTap: () {
                                                                        Get.toNamed(RoutesConstants.productListScreen,
                                                                            arguments: [
                                                                              "dash",
                                                                              itemLevel3?.id,
                                                                              itemLevel3?.name??
                                                                                  ''
                                                                            ]);
                                                                      },
                                                                      child: Container(
                                                                        margin: const EdgeInsets.only(
                                                                            left: 40.0, top: 3.0, bottom: 3.0),
                                                                        child: Text(
                                                                          itemLevel3?.name ?? '',
                                                                          overflow: TextOverflow.ellipsis,
                                                                          style: AppTextStyle.textStyleUtils400_12(
                                                                              color: grey969290),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                )
                                                              ],
                                                            );
                                                          },
                                                        )
                                                      : SingleChildScrollView(
                                                        physics: const BouncingScrollPhysics(),
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
                                                                fontSize: 14.sp,
                                                              ),
                                                              SizedBox(
                                                                height: 20.h,
                                                              ),
                                                              SizedBox(
                                                                height: 35.w,
                                                                child:
                                                                    CommonThemeButton(
                                                                  onTap:
                                                                      () {
                                                                    Get.toNamed(
                                                                      RoutesConstants
                                                                          .specialRequestScreen,
                                                                      arguments: [
                                                                        controller
                                                                            .txtList
                                                                            .text,
                                                                        "category"
                                                                      ],
                                                                    );
                                                                  },
                                                                  title: 
                                                                    LanguageConstants
                                                                        .createTicket
                                                                        .tr,
                                                                    )
                                                              ),
                                                              SizedBox(
                                                                height: 60.h,
                                                              )
                                                            ],
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
          ),
          Obx(
            () => !controller.visibleLoader.value
                ? const SizedBox.shrink()
                : Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: const SpinKitThreeBounce(
                        color: darkBlue,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }

  bool childrenDataLength(int index1) {
    return (controller.menuModel.value.childrenData?[index1].childrenData?.length ?? 0) > 0;
  }

  bool productIsInStock(ProductItem product) {
    return (product.extensionAttributes) != null &&
        product.extensionAttributes?.stockItem != null &&
        product.extensionAttributes?.stockItem?.isInStock == true;
  }

  Widget productListDesign({required ProductItem product, required int index}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesConstants.productDetailScreen, arguments: [product]);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(4.w),
              // color: red,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: controller.isMediaGalleryEntriesEmpty(product)
                        ? Image.asset(
                            AppAsset.brandListLogo,
                          )
                        : PageView.builder(
                            itemCount: controller.productImageList[index].length,
                            physics: const BouncingScrollPhysics(),
                            onPageChanged: (int index2) {
                              controller.productOnPageChanged(index, index2);
                            },
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index2) {
                              return CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: "${AppConstants.productImageUrl}${controller.productImageList[index][index2]}",
                                placeholder: (context, url) => Container(color: whiteColor),
                                errorWidget: (context, url, error) => Image.asset(
                                  AppAsset.brandListLogo,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          productIsInStock(product)
                              ? InkWell(
                                  onTap: () async {
                                    await controller.getChooseOption(product);
                                    showAddDialog(product);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: SvgPicture.asset(
                                      AppAsset.cart,
                                      height: 20.0,
                                      width: 20.0,
                                      color: darkBlue,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {
                              controller.wishListOnTap(product: product, index: index);
                            },
                            child: Obx(
                              () => product.isWishList.value
                                  ? const Icon(
                                      Icons.favorite,
                                      color: darkBlue,
                                    )
                                  : SvgPicture.asset(
                                      AppAsset.heart,
                                      height: 14,
                                      color: darkBlue,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SizedBox(
                        height: 5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.dotsList[index].length,
                          itemBuilder: (context, index2) {
                            return GetBuilder<SearchController>(
                              id: "images_dots",
                              builder: (controller) {
                                return AnimatedContainer(
                                  height: 5,
                                  width: 5,
                                  duration: 200.milliseconds,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.dotsList[index][index2] ? Colors.black : Colors.grey,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name ?? '',
            maxLines: 1,
            style: AppTextStyle.textStyleUtils500().copyWith(overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 6),
          Text(
            "${product.extensionAttributes?.convertedRegularPrice}",
            style: AppTextStyle.textStyleUtils500(size: 15),
          ),
          SizedBox(height: 15.h,)
        ],
      ),
    );
  }

  void showAddDialog(ProductItem item) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return SearchProductListAddDialog(
          item: item,
        );
      },
    );
  }

  Widget categoriesOptions({String? text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text ?? '',
            style: AppTextStyle.textStyleUtils400(),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: darkBlue,
            size: 12,
          ),
        ],
      ),
    );
  }

  Widget filterDropDown() {
    return SizedBox(
      width: 327.w,
      child: TextFormField(
        controller: controller.txtList,
        autofocus: false,
        textAlign: TextAlign.left,
        cursorColor: blackColor,
        cursorHeight: 20,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
              height: 20.w,
              width: 20.w,
              child: SvgPicture.asset(
                AppAsset.search,
                fit: BoxFit.scaleDown,
              )),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(
            bottom: 12,
            top: 12,
            left: 12,
          ),
          hintStyle: AppTextStyle.textStyleUtils500(
            color: Colors.grey.shade600,
          ),
          errorStyle: AppTextStyle.textStyleUtils400(color: Colors.red),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          isDense: true,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: LanguageConstants.searchText.tr,
        ),
        onChanged: (val) {
          controller.searchOnChanged(val);
        },
      ),
    );
  }
}
