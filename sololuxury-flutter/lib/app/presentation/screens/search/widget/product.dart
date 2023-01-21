import 'package:cached_network_image/cached_network_image.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/screens/search/widget/search_product_list_add_dialog.dart';
import 'package:solo_luxury/all_imports.dart';

class Product extends StatelessWidget {
  Product({Key? key, this.item, required this.index}) : super(key: key);
  final ProductItem? item;
  final SearchController searchController = Get.find();
  final int index;

  String productImage() {
    for (var element in item!.customAttributes ?? []) {
      if (element.attributeCode == "image") {
        return "${AppConstants.productImageUrl}${element.value}";
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed<dynamic>(RoutesConstants.productDetailsScreen,
            arguments: [item])?.whenComplete(
          () {
            searchController.getGenerateCart(
              context,
              item?.name ?? "",
              productImage(),
              item?.sku ?? "",
              item?.typeId ?? "",
              item?.extensionAttributes?.configurableProductOptions?.first
                      .attributeId ??
                  "",
              (item?.extensionAttributes?.configurableProductOptions?.first
                          .values?.isEmpty ==
                      true)
                  ? "0"
                  : (searchController.sizeList.first.value ?? '').toString(),
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: searchController.isMediaGalleryEntriesEmpty(
                      item?.mediaGalleryEntries,
                    )
                        ? Image.asset(
                            AppAsset.logo,
                            color: const Color(0xffE7CCBE),
                          )
                        : PageView.builder(
                            itemCount:
                                searchController.productImageList[index].length,
                            physics: const BouncingScrollPhysics(),
                            onPageChanged: (int index2) {
                              searchController.productOnPageChanged(
                                index,
                                index2,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index2) {
                              return CachedNetworkImage(
                                imageUrl:
                                    "${AppConstants.productImageUrl}${searchController.productImageList[index][index2]}",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
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
                                  color: secondaryColor.withOpacity(
                                    0.5,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  AppAsset.logo,
                                  color: const Color(0xffE7CCBE),
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
                        (item?.extensionAttributes) != null &&
                                item?.extensionAttributes?.stockItem != null &&
                                item?.extensionAttributes?.stockItem!
                                        .isInStock ==
                                    true
                            ? InkWell(
                                onTap: () async {
                                  await searchController.getChooseOption(
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
                                    color: brown833404,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            searchController.wishListOnTap(
                                product: item, index: index);
                          },
                          child: Obx(
                            () => (item?.isWishList.value ?? false)
                                ? const Icon(
                                    Icons.favorite,
                                    color: appColor,
                                  )
                                : SvgPicture.asset(
                                    AppAsset.heart,
                                    height: 14,
                                    color: appColor,
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
                        itemCount: searchController.dotsList[index].length,
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
                                  color: searchController.dotsList[index]
                                          [index2]
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
          // const SizedBox(
          //   height: 0,
          // ),
          // Text(
          //   item?.getBrandName() ?? '',
          //   style: AppStyle.textStyleUtils400_16()
          //       .copyWith(overflow: TextOverflow.ellipsis),
          // ),
          const SizedBox(
            height: 6,
          ),
          Text(
            item?.name ?? '',
            style: AppStyle.textStyleUtils400_16()
                .copyWith(overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            item?.extensionAttributes?.convertedRegularPrice ?? '',
            style: AppStyle.textStyleUtils600_14(),
          ),
        ],
      ),
    );
  }

  void showAddDialog(ProductItem item) async {
    await showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return SearchProductListAddDialog(
          item: item,
        );
      },
    );
  }
}
