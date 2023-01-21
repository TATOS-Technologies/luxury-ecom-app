import 'dart:ui';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/product_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/screens/product_listing/product_list_add_dialog.dart';
import 'package:brandslabels/app/presentation/screens/product_listing/widget/product_shop.dart';
import 'package:brandslabels/app/presentation/screens/product_listing/widget/product_sort.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:brandslabels/app/theme/app_asset.dart';

class ProductListScreen extends GetView<ProductController> {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      appBar: commonAppbar(title: controller.title.value),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(0xff000080),
                  // size: 50.0,
                ),
              )
            : NotificationListener<ScrollNotification>(
                onNotification: controller.scrollNotificationData,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.5),
                  child: Column(
                    children: [
                      controller.productModel?.value.items?.isNotEmpty ?? false
                          ? Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Row(
                                children: const [
                                  SortByWidget(),
                                  ShopByWidget(),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(height: 30),
                      Expanded(
                        child: products(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  bool productIsInStock(ProductItem item) {
    return item.extensionAttributes != null &&
        item.extensionAttributes?.stockItem != null &&
        item.extensionAttributes?.stockItem?.isInStock == true;
  }

  Widget products() {
    controller.productModel?.value.items =
        controller.productModel?.value.items?.where((element) {
      return element.visibility == 4;
    }).toList();
    return Obx(
      () => controller.itemList.isNotEmpty
          ? Stack(
              children: [
                Scaffold(
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
                        '${controller.productCount.value.toString()}/${(controller.productModel?.value.totalCount ?? 0).toString()}',
                        style: AppTextStyle.textStyleUtils400(
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.startFloat,
                  body: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          addAutomaticKeepAlives: true,
                          itemCount: controller.itemList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 12.5,
                          childAspectRatio: .80,
                        ),
                          itemBuilder: (_, index) {
                            ProductItem item = controller.itemList[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutesConstants.productDetailScreen,
                                    arguments: [item, Get.arguments[0]]);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(5.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10.w),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12),
                                              child: controller
                                                      .isMediaGalleryEntriesEmpty(
                                                          item)
                                                  ? Image.asset(
                                                      AppAsset.brandListLogo,
                                                    )
                                                  : PageView.builder(
                                                      itemCount: controller
                                                          .productImageList[
                                                              index]
                                                          .length,
                                                      physics:
                                                          const BouncingScrollPhysics(),
                                                      onPageChanged:
                                                          (int index2) {
                                                        controller
                                                            .productOnPageChanged(
                                                                index, index2);
                                                      },
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index2) {
                                                        return CachedNetworkImage(
                                                          fit: BoxFit.fill,
                                                          memCacheWidth: 200,
                                                          memCacheHeight: 150,
                                                          imageUrl:
                                                              "${AppConstants.productImageUrl}${controller.productImageList[index][index2]}",
                                                          placeholder: (context,
                                                                  url) =>
                                                              Container(
                                                                  color:
                                                                      whiteColor),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Image.asset(
                                                            AppAsset
                                                                .brandListLogo,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  productIsInStock(item)
                                                      ? InkWell(
                                                          onTap: () async {
                                                            await controller
                                                                .getChooseOption(
                                                                    item);
                                                            showAddDialog(item);
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 8.0,
                                                            ),
                                                            child: SvgPicture
                                                                .asset(
                                                              AppAsset.cart,
                                                              height: 20.0,
                                                              width: 20.0,
                                                              color: darkBlue,
                                                            ),
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                  
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
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: controller
                                                      .dotsList[index].length,
                                                  itemBuilder:
                                                      (context, index2) {
                                                    return GetBuilder<
                                                        ProductController>(
                                                      id: "images_dots",
                                                      builder: (controller) {
                                                        return AnimatedContainer(
                                                          height: 5,
                                                          width: 5,
                                                          duration:
                                                              200.milliseconds,
                                                          margin:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 2,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: controller
                                                                        .dotsList[
                                                                    index][index2]
                                                                ? Colors.black
                                                                : Colors.grey,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const Alignment(.7,-.7),
                                            child: GestureDetector(
                                                      onTap: () {
                                                        controller.wishListOnTap(
                                                            product: item,
                                                            index: index);
                                                      },
                                                      child: Obx(
                                                        () => item
                                                                .isWishList.value
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
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(height: 10.h),
                                    // CommonTextPoppins(
                                    //   (item.getBrandName()).toUpperCase(),
                                    //   overflow: TextOverflow.ellipsis,
                                    // ),
                                    // SizedBox(height: 6.h),
                                    CommonTextPoppins(
                                      (item.name ?? '').toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12.sp,
                                    ),
                                    const SizedBox(height: 6),
                                    CommonTextPoppins(
                                      item.extensionAttributes
                                              ?.convertedRegularPrice ??
                                          '',
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      controller.productLoading.value
                          ? const Center(
                              child: SpinKitThreeBounce(
                                color: darkBlue,
                                size: 20.0,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                controller.visibleLoader.value == false
                    ? const SizedBox()
                    : Center(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: const SpinKitThreeBounce(
                            color: darkBlue,
                          ),
                        ),
                      ),
              ],
            )
          : Get.arguments[0] == "brand"
              ? SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const NothigToShowAnimationWidget(),
                      SizedBox(
                        width: 290.w,
                        child: CommonTextPoppins(
                          LanguageConstants
                              .itSeemsLikeWeHaveNothingToShowForThisBrand.tr,
                          color: blackColor,
                          fontSize: 14.sp,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 290.w,
                        child: CommonTextPoppins(
                          '${LanguageConstants.ifyouwouldlikeUsSendYouTheCollectionFrom.tr} ${Get.arguments[2]} ${LanguageConstants.plsCreateATicketBelow.tr}',
                          color: blackColor,
                          fontSize: 14.sp,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.specialRequestScreen,
                                  arguments: [Get.arguments[2], "brand"]);
                            },
                            child: Container(
                              height: 35.w,
                              width: 124.w,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(14),
                                border:
                                    Border.all(width: 2, color: buttonColor),
                              ),
                              child: Center(
                                child: Text(
                                  LanguageConstants.createTicket.tr,
                                  style: AppTextStyle.textStyleUtils600(
                                      color: buttonColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(RoutesConstants.dashboardScreen);
                            },
                            child: Container(
                                height: 35.w,
                                width: 166.w,
                                decoration: BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.circular(14),
                                  border:
                                      Border.all(width: 2, color: buttonColor),
                                ),
                                child: Center(
                                    child: Text(
                                  LanguageConstants.continueShopping.tr,
                                  style: AppTextStyle.textStyleUtils600(
                                    color: Colors.white,
                                  ),
                                ))),
                          ),
                        ],
                      ),
                      SizedBox(height: 100.w)
                    ],
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.only(bottom: 50, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const NothigToShowAnimationWidget(),
                      Text(
                        LanguageConstants
                            .itSeemsLikeWeHaveNothingToShowForThisCategory.tr,
                        style: AppTextStyle.textStyleUtils500(),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CommonTextPoppins(
                          '${LanguageConstants.ifyouwouldlikeUsSendYouTheCollectionFrom.tr} ${Get.arguments[2]} ${LanguageConstants.plsCreateATicketBelow.tr}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed(
                                    RoutesConstants.specialRequestScreen,
                                    arguments: [Get.arguments[2], "category"]);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 1,
                                backgroundColor: appBarPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: CommonTextOpenSans(
                                LanguageConstants.createTicket.tr,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.5,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.offAllNamed(
                                    RoutesConstants.dashboardScreen);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 1,
                                backgroundColor: appBarPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: CommonTextOpenSans(
                                LanguageConstants.continueShopping.tr,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.5,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
    );
  }

  void showAddDialog(ProductItem item) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return ProductListAddDialog(
          item: item,
        );
      },
    );
  }
}
