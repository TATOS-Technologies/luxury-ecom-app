import 'dart:ui';

import 'package:avoirchic/app/controller/product_controller.dart';
import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/screens/product_listing/product_list_add_dialog.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:preload_page_view/preload_page_view.dart';

class ProductItemWidget extends GetView<ProductController> {
  const ProductItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      color: avoirChickTheme,
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
                  body: NotificationListener<ScrollNotification>(
                    onNotification: controller.scrollNotificationData,
                    child: Column(
                      children: [
                        Expanded(
                          child: RefreshIndicator(
                            color: iconBlueColor,
                            onRefresh: () async {
                              controller.onInit();
                            },
                            child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              controller: controller.scrollController,
                              padding: EdgeInsets.zero,
                              addAutomaticKeepAlives: true,
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
                                    Get.toNamed(
                                      RoutesConstants.productDetailsScreen,
                                      arguments: [item, Get.arguments[0]],
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(4.w),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: controller
                                                        .isMediaGalleryEntriesEmpty(
                                                            item)
                                                    ? Image.asset(
                                                        AppAsset.logo,
                                                        color: const Color(
                                                            0xffE7CCBE),
                                                      )
                                                    : PreloadPageView.builder(
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
                                                                  index,
                                                                  index2);
                                                        },
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index2) {
                                                          return CachedNetworkImage(
                                                            imageUrl:
                                                                "${AppConstants.productImageUrl}${controller.productImageList[index][index2]}",
                                                            imageBuilder: (context,
                                                                    imageProvider) =>
                                                                Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  image:
                                                                      imageProvider,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            memCacheWidth: 200,
                                                            memCacheHeight: 150,
                                                            placeholder: (context,
                                                                    url) =>
                                                                Container(
                                                                    color: secondaryColor
                                                                        .withOpacity(
                                                                            0.5)),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Image.asset(
                                                              AppAsset.logo,
                                                              color: const Color(
                                                                  0xffE7CCBE),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                              ),
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0),
                                                  child: SizedBox(
                                                    height: 20,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        controller
                                                                .checkAddDialog(
                                                                    item)
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await controller
                                                                      .getChooseOption(
                                                                          item);
                                                                  showAddDialog(
                                                                      item);
                                                                },
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    horizontal:
                                                                        8.0,
                                                                  ),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    AppAsset
                                                                        .cart,
                                                                    height:
                                                                        20.0,
                                                                    width: 20.0,
                                                                    color:
                                                                        avoirChickTheme,
                                                                  ),
                                                                ),
                                                              )
                                                            : const SizedBox(),
                                                        const SizedBox(
                                                            width: 6),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .wishListOnTap(
                                                                    product:
                                                                        item,
                                                                    index:
                                                                        index);
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              right: 10,
                                                            ),
                                                            child:
                                                                favoriteOrNot(
                                                                    item),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                                                          .dotsList[index]
                                                          .length,
                                                      itemBuilder:
                                                          (context, index2) {
                                                        return GetBuilder<
                                                            ProductController>(
                                                          id: "images_dots",
                                                          builder:
                                                              (controller) {
                                                            return AnimatedContainer(
                                                              height: 5,
                                                              width: 5,
                                                              duration: 200
                                                                  .milliseconds,
                                                              margin:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 2,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: controller
                                                                            .dotsList[index]
                                                                        [index2]
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .grey,
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
                                        SizedBox(height: 10.h),
                                        //Text(
                                        //(item.getBrandName()).toUpperCase(),
                                        //maxLines: 1,
                                        //textAlign: TextAlign.start,
                                        //style: AppTextStyle.textStyleUtils500()
                                        //  .copyWith(
                                        //  overflow: TextOverflow.ellipsis),
                                        //),
                                        //const SizedBox(height: 6),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              (item.name ?? '').toUpperCase(),
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                              style: AppTextStyle
                                                      .textStyleUtils500(
                                                          size: 12.sp)
                                                  .copyWith(
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                        ),
                                        const SizedBox(height: 6),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              item.extensionAttributes
                                                      ?.convertedRegularPrice ??
                                                  '',
                                              textAlign: TextAlign.start,
                                              style: AppTextStyle
                                                      .textStyleUtils600(
                                                          size: 12.sp)
                                                  .copyWith(
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: controller.itemList.length,
                            ),
                          ),
                        ),
                        controller.productLoading.value
                            ? const Center(
                                child: SpinKitThreeBounce(
                                  color: Color(0xff367587),
                                  size: 20.0,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
                !controller.visibleLoader.value
                    ? const SizedBox()
                    : Center(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: const CircularProgressIndicator(
                            strokeWidth: 3,
                            color: blackColor,
                          ),
                        ),
                      )
              ],
            )
          : Get.arguments[0] == "brand"
              ? Padding(
                  padding: const EdgeInsets.only(
                    bottom: 50,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const NothigToShowAnimationWidget(),
                      Text(
                        LanguageConstants
                            .itSeemsLikeWeHaveNothingToShowForThisBrand.tr,
                        style: AppTextStyle.textStyleUtils400(),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: CommonTextPoppins(
                          '${LanguageConstants.ifyouwouldlikeUsSendYouTheCollectionFrom.tr} ${Get.arguments[2]} ${LanguageConstants.plsCreateATicketBelow.tr}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35.w,
                            child: CommonThemeButton(
                              onTap: () {
                                Get.toNamed(
                                  RoutesConstants.specialRequesScreen,
                                  arguments: [Get.arguments[2], "brand"],
                                );
                              },
                              title:
                                LanguageConstants.createTicket.tr,
                            )
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                          
                            height: 35.w,
                            child: CommonThemeButton(
                              onTap: () {
                                Get.offAllNamed(
                                    RoutesConstants.dashboardScreen);
                              },
                              title:
                                LanguageConstants.continueShopping.tr,
                             )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.w,
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    bottom: 50,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const NothigToShowAnimationWidget(),
                      Text(
                        LanguageConstants
                            .itSeemsLikeWeHaveNothingToShowForThisCategory.tr,
                        style: AppTextStyle.textStyleUtils400(),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: CommonTextPoppins(
                          '${LanguageConstants.ifyouwouldlikeUsSendYouTheCollectionFrom.tr} ${Get.arguments[2]} ${LanguageConstants.plsCreateATicketBelow.tr}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Get.find<SpecialRequestController>().brandName = Get.arguments[2];
                              // Get.offAllNamed(RoutesConstants.dashboardScreen);
                              Get.toNamed(
                                RoutesConstants.specialRequesScreen,
                                arguments: [Get.arguments[2], "category"],
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: whiteColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: primary, width: 2.w),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.createTicket.tr,
                              color: primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed(RoutesConstants.dashboardScreen);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
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
                      )
                    ],
                  ),
                ),
    );
  }

  Widget favoriteOrNot(ProductItem item) {
    return Obx(
      () => item.isWishList.value
          ? const Icon(
              Icons.favorite,
              color: avoirChickTheme,
            )
          : SvgPicture.asset(
              AppAsset.heart,
              height: 14,
              color: avoirChickTheme,
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
