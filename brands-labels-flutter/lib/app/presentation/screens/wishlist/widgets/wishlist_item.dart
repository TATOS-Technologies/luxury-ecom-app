import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:brandslabels/app/controller/wishlist_controller.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:brandslabels/app/theme/colors.dart';

class WishlistItemProduct extends GetView<WishlistController> {
  final ItemProduct? item;
  final int index;

  const WishlistItemProduct({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {},
              child: CachedNetworkImage(
                imageUrl: controller.productImage(index),
                fit: BoxFit.fill,
                errorWidget: (context, url, error) {
                  return Container(
                      alignment: Alignment.center,
                      child: const Icon(Icons.error_outline));
                },
                memCacheHeight: 150,
                memCacheWidth: 200,
              ),
            ),
          ),
        ),
        Text(
          item?.product?.name ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.textStyleUtils300(size: 12.sp),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          controller.getProductPrice(index),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.textStyleUtils400(size: 12.sp),
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                controller.getGenerateCart(index);
              },
              icon: SvgPicture.asset(AppAsset.svgAddtoCart),
            ),
            Container(
              height: 31.w,
              width: 31.w,
              child: TextFormField(
                controller: item?.product?.countController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                style: AppTextStyle.textStyleUtils400(),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.only(left: 5, right: 5, bottom: 12)),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4), // for mobile
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.deleteWishListData(index);
              },
              child: Image(
                image: AssetImage(AppAsset.deletePng),
                color: primary,
              ),
            ),
          ],
        ),
        Obx(
          () => Visibility(
            visible:
                controller.wishItemModel?.value.items?[index].product?.typeId ==
                    'configurable',
            child: Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderGrey),
              ),
              child: item?.product?.sizeList?.isNotEmpty == true
                  ? DropdownButtonHideUnderline(
                      child: DropdownButton<SizeModel>(
                        items: item?.product?.sizeList!
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.label.toString()),
                              ),
                            )
                            .toList(),
                        isExpanded: true,
                        hint: Text(
                          LanguageConstants.chooseAnOption.tr,
                          style: AppTextStyle.textStyleUtils400_12(),
                        ),
                        value:
                            item?.product?.selectSizeValue?.value.value != null
                                ? item?.product?.selectSizeValue?.value
                                : null,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 22,
                          color: Colors.black,
                        ),
                        iconEnabledColor: Colors.transparent,
                        onChanged: (valueList) {
                          item?.product?.selectSizeValue?.value =
                              valueList ?? SizeModel();
                        },
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
