import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/controller/wishlist/wishlist_controller.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class WishlistItem extends GetView<WishlistController> {
  final int index;

  WishlistItem({Key? key, required this.index}) : super(key: key);

  @override
  final WishlistController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  controller
                      .wishListOnTap(controller.wishItemModel.value.items?[index]);
                },
                child: CachedNetworkImage(
                  imageUrl: controller.productImage(index),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            controller.wishItemModel.value.items?[index].product?.name ?? '',
            maxLines: 1,
            textAlign: TextAlign.start,
            style: AppStyle.commonTextStyle400(size: 14.sp),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(controller.getProductPrice(index),
              textAlign: TextAlign.start,
              style: AppStyle.commonTextStyle500(
                  size: 14.sp) //commonTextStyle500(size: 16.0),
              ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    controller.getGenerateCart(index);
                  },
                  child: const Icon(Icons.shopping_cart_outlined,
                      color: blackColor)),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: textFieldBoarderColor,
                      width: 2,
                    ),
                  ),
                  child: TextFormField(
                    controller: controller
                        .wishItemModel.value.items?[index].product?.countController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.done,
                    style: AppStyle.commonTextStyle400(size: 14.sp),
                    decoration: const InputDecoration(
                      border: InputBorder.none
                        // contentPadding:
                        //     EdgeInsets.only(left: 5, right: 5, bottom: 12)
                        ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: () {
                    controller.deleteWishListData(index);
                  },
                  child: const Icon(Icons.delete_outline, color: blackColor)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Visibility(
              visible:
                  controller.wishItemModel.value.items?[index].product?.typeId ==
                      'configurable',
              child: Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: blackColor),
                ),
                child: controller.wishItemModel.value.items?[index].product
                            ?.sizeList?.isNotEmpty ==
                        true
                    ? DropdownButtonHideUnderline(
                        child: DropdownButton<SizeModel>(
                          items: controller.wishItemModel.value.items?[index]
                              .product?.sizeList!
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
                          value: controller.wishItemModel.value.items?[index]
                                      .product?.selectSizeValue?.value.value !=
                                  null
                              ? (controller.wishItemModel.value.items?[index]
                                  .product?.selectSizeValue?.value ?? SizeModel())
                              : null,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 22,
                            color: Colors.black,
                          ),
                          iconEnabledColor: Colors.transparent,
                          onChanged: (valueList) {
                            controller
                                .wishItemModel
                                .value
                                .items?[index]
                                .product
                                ?.selectSizeValue
                                ?.value = valueList ?? SizeModel();
                          },
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
