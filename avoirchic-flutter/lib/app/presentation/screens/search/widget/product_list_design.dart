import 'dart:ui';

import 'package:avoirchic/app/controller/search_controller.dart';
import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/presentation/screens/search/widget/search_product_list_add_dialog.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../../../core/utils/app_routes.dart';

class ProductListDesign extends GetView<SearchController> {
  final ProductItem product;
  final int index;

  const ProductListDesign(
      {Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesConstants.productDetailsScreen, arguments: [product]);
      },
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    controller.isMediaGalleryEntriesEmpty(product)
                        ? Image.asset(
                            AppAsset.logo,
                            color: const Color(0xffE7CCBE),
                          )
                        : PreloadPageView.builder(
                            itemCount:
                                controller.productImageList[index].length,
                            physics: const BouncingScrollPhysics(),
                            onPageChanged: (int index2) {
                              controller.productOnPageChanged(index, index2);
                            },
                            preloadPagesCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index2) {
                              return CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    "${AppConstants.productImageUrl}${controller.productImageList[index][index2]}",
                                placeholder: (context, url) => Container(
                                    color: avoirChickTheme.withOpacity(0.2)),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  AppAsset.logo,
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                  color: const Color(0xffE7CCBE),
                                ),
                              );
                            },
                          ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            controller.productIsInStock(product)
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
                                        color: avoirChickTheme,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                controller.wishListOnTap(
                                    product: product, index: index);
                              },
                              child: Obx(
                                () => product.isWishList.value
                                    ? const Icon(
                                        Icons.favorite,
                                        color: avoirChickTheme,
                                      )
                                    : SvgPicture.asset(
                                        AppAsset.heart,
                                        height: 14,
                                        color: avoirChickTheme,
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
                                      color: controller.dotsList[index][index2]
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
            ),
            SizedBox(height: 10.h),
            Text(
              product.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.textStyleUtils500()
                  .copyWith(overflow: TextOverflow.ellipsis),
            ),
            Text(
              product.extensionAttributes?.convertedRegularPrice ?? '',
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils500(size: 15),
            ),
          ],
        ),
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
}
