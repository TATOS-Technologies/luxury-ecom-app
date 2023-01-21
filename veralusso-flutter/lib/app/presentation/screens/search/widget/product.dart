import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/controller/search/search_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/screens/search/widget/search_product_list_add_dialog.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import '../../../../theme/colors.dart';

class Product extends GetView<SearchController> {
  final ProductItem? item;
  final int index;

  @override
  final SearchController controller = Get.find();

  Product({Key? key, this.item, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesConstants.productDetailsScreen, arguments: [item]);
      },
      child: Padding(
        padding:  EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      
                      child: controller.isMediaGalleryEntriesEmpty(
                        item?.mediaGalleryEntries,
                      )
                          ? Image.asset(
                              AppAsset.logo,
                            )
                          : PageView.builder(
                              itemCount: controller.productImageList[index].length,
                              physics: const BouncingScrollPhysics(),
                              onPageChanged: (int index2) {
                                controller.productOnPageChanged(
                                  index,
                                  index2,
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index2) {
                                return CachedNetworkImage(
                                  imageUrl:
                                      "${AppConstants.productImageUrl}${controller.productImageList[index][index2]}",
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  memCacheWidth: 200,
                                  memCacheHeight: 150,
                                  placeholder: (context, url) => Container(
                                    color: darkSilver,
                                  ),
                                  errorWidget: (context, url, error) => Image.asset(
                                    AppAsset.logo,
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
                          controller.productIsInStock(index)
                              ? InkWell(
                                  onTap: () async {
                                    await controller.getChooseOption(
                                      item!,
                                    );
                                    showAddDialog(item!);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: SvgPicture.asset(
                                      AppAsset.cart,
                                      height: 20.0,
                                      width: 20.0,
                                      color: blackColor,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(width: 6),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                controller.wishListOnTap(
                                    product: item, index: index);
                              },
                              child: (item?.isWishList.value ?? false)
                                  ? const Icon(
                                      Icons.favorite,
                                      color: blackColor,
                                    )
                                  : SvgPicture.asset(
                                      AppAsset.heart,
                                      height: 14,
                                      color: blackColor,
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
                              builder: (searchController) {
                                return AnimatedContainer(
                                  height: 5,
                                  width: 5,
                                  duration: 200.milliseconds,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: searchController.dotsList[index][index2]
                                        ? blackColor
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
            // const SizedBox(height: 10),
            // Center(
            //   child: Text(
            //     item?.getBrandName() ?? '',
            //     maxLines: 1,
            //     style: AppTextStyle.textStyleUtils500()
            //         .copyWith(overflow: TextOverflow.ellipsis),
            //   ),
            // ),
            const SizedBox(height: 6),
            Text(
              item?.name ?? '',
              maxLines: 1,
              style: AppTextStyle.textStyleUtils500()
                  .copyWith(overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 6),
            Text(
              item?.extensionAttributes?.convertedRegularPrice ?? '',
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils500(size: 15),
            ),
          ],
        ),
      ),
    );
  }

  void showAddDialog(ProductItem item) async {
    await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return SearchProductListAddDialog(
          item: item,
        );
      },
    );
  }
}
