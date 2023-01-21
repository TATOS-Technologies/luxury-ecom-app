import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:veralusso/app/controller/product_listing/product_controller.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/screens/product_listing/product_list_add_dialog.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class ProductListWidget extends GetView<ProductController> {
  @override
  final ProductController controller = Get.find();

  ProductListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.productModel?.value.items =
        controller.productModel?.value.items?.where((element) {
      return element.visibility == 4;
    }).toList();
    return Expanded(
        child: controller.itemList.isNotEmpty
            ? Scaffold(
                backgroundColor: Colors.transparent,
                floatingActionButton: Container(
                  decoration: BoxDecoration(
                    color: blackColor,
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
                          color: Colors.white, size: 10),
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.startFloat,
                body: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        addAutomaticKeepAlives: true,
                        itemCount: controller.itemList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 12.5,
                          childAspectRatio: 0.70,
                        ),
                        itemBuilder: (_, index) {
                          ProductItem? item = controller.itemList[index];
                          return Padding(
                            padding: EdgeInsets.all(4.w),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                    RoutesConstants.productDetailsScreen,
                                    arguments: [item, Get.arguments[0]]);
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Container(
                                            child: controller
                                                    .productImageList[index]
                                                    .isEmpty
                                                ? Image.asset(
                                                    AppAsset.logo,
                                                  )
                                                : PageView.builder(
                                                    itemCount: controller
                                                        .productImageList[index]
                                                        .length,
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    onPageChanged: (int index2) {
                                                      controller.dotsList[index] =
                                                          List.generate(
                                                        controller.dotsList[index]
                                                            .length,
                                                        (index) => false,
                                                      );
                                                      controller.dotsList[index]
                                                          [index2] = true;
                                                      controller.update(
                                                        [
                                                          'images_dots',
                                                          'back_button',
                                                          'next_button'
                                                        ],
                                                      );
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
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        placeholder: (context,
                                                                url) =>
                                                            Container(
                                                                color:
                                                                    darkSilver),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                          AppAsset.logo,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10.0),
                                            child: SizedBox(
                                              height: 20,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  controller
                                                          .productIsInStock(index)
                                                      ? InkWell(
                                                          onTap: () async {
                                                            await controller
                                                                .getChooseOption(
                                                              item,
                                                            );
                                                            showAddDialog(item);
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 8.0,
                                                            ),
                                                            child: SvgPicture.asset(
                                                                AppAsset.cart,
                                                                height: 20.0,
                                                                width: 20.0,
                                                                color:
                                                                    blackColor),
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                  const SizedBox(width: 6),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.wishListOnTap(
                                                          product: item,
                                                          index: index);
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        right: 10,
                                                      ),
                                                      child: Obx(
                                                        () => item
                                                                .isWishList.value
                                                            ? const Icon(
                                                                Icons.favorite,
                                                                color:
                                                                    Colors.black,
                                                                size: 20,
                                                              )
                                                            : SvgPicture.asset(
                                                                AppAsset.heart,
                                                                height: 14,
                                                                color:
                                                                    Colors.black,
                                                              ),
                                                      ),
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
                                                scrollDirection: Axis.horizontal,
                                                itemCount: controller
                                                    .dotsList[index].length,
                                                itemBuilder: (context, index2) {
                                                  return GetBuilder<
                                                      ProductController>(
                                                    id: "images_dots",
                                                    builder: (controller) {
                                                      return AnimatedContainer(
                                                        height: 5,
                                                        width: 5,
                                                        duration:
                                                            200.milliseconds,
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                          horizontal: 2,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
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
                                      ],
                                    ),
                                  ),
                                  Text(
                                    item.getBrandName(),
                                    maxLines: 1,
                                    style: AppTextStyle.textStyleUtils400()
                                        .copyWith(
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 6.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${item.name}".toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: AppTextStyle.textStyleUtils500()
                                          .copyWith(
                                              overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      item.extensionAttributes
                                              ?.convertedRegularPrice ??
                                          '',
                                      textAlign: TextAlign.start,
                                      style:
                                          AppTextStyle.textStyleUtils600_16(),
                                    ),
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
                              color: blackColor,
                              size: 20.0,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              )
            : Get.arguments[0] == "brand"
                ? Padding(
                    padding:
                        const EdgeInsets.only(bottom: 50, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const NothigToShowAnimationWidget(),
                        Text(
                          LanguageConstants
                              .itSeemsLikeWeHaveNothingToShowForThisBrand.tr,
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
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(
                                      RoutesConstants.specialRequestScreen,
                                      arguments: [Get.arguments[2], "brand"]);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: whiteColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: blackColor, width: 2)),
                                ),
                                child: Text(
                                  LanguageConstants.createTicket.tr,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyle.textStyleUtils400(),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.offAllNamed(
                                      RoutesConstants.dashboardScreen);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: blackColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: blackColor, width: 2)),
                                ),
                                child: Text(
                                  LanguageConstants.continueShopping.tr,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyle.textStyleUtils400(
                                      color: whiteColor),
                                ),
                              ),
                            ],
                          ),
                        )
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
                          style: AppTextStyle.textStyleUtils400(),
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
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(
                                      RoutesConstants.specialRequestScreen,
                                      arguments: [
                                        Get.arguments[2],
                                        "category"
                                      ]);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: whiteColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: blackColor, width: 2)),
                                ),
                                child: Text(
                                  LanguageConstants.createTicket.tr,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyle.textStyleUtils400(),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.offAllNamed(
                                      RoutesConstants.dashboardScreen);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: blackColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: blackColor, width: 2)),
                                ),
                                child: Text(
                                  LanguageConstants.continueShopping.tr,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyle.textStyleUtils400(
                                      color: whiteColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
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
