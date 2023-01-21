import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:suvandnat/app/controller/wishlist/wishlist_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
class Wishlist extends GetView<WishlistController> {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        addAutomaticKeepAlives: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio:.50,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    controller.wishListOnTap(
                        controller.wishItemModel.value.items?[index]);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 170.w,
                      child: CachedNetworkImage(
                        imageUrl: controller.productImage(index),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  controller.getProductName(index),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const SizedBox(height: 5),
                Text(
                  controller.getProductPrice(index),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.textStyleUtils500(),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.getGenerateCart(index);
                      },
                      child: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.black54),
                    ),
                    Container(
                      height: 31,
                      width: 31,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: controller.countController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textInputAction: TextInputAction.done,
                        style: AppTextStyle.textStyleUtils400(),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.only(left: 5, right: 5, bottom: 12)),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(4), // for mobile
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.deleteWishListData(index);
                      },
                      child: Image(
                        image: AssetImage(AppAsset.delete2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Obx(
                      () => Visibility(
                    visible: controller
                        .wishItemModel.value.items?[index].product?.typeId ==
                        'configurable',
                    child: Container(
                      height: 35.h,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: blackColor),
                      ),
                      child: controller.wishItemModel.value.items?[index].product
                          ?.sizeList?.isNotEmpty ==
                          true
                          ? DropdownButtonHideUnderline(
                        child: DropdownButton<SizeModel>(
                          alignment: AlignmentDirectional.center,
                          items: controller.wishItemModel.value
                              .items?[index].product?.sizeList!
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
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.textStyleUtils400(size: 12.sp),
                          ),
                          value: controller.selectSizeValue?.value.value !=
                              null
                              ? controller.selectSizeValue?.value
                              : null,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 22,
                            color: Colors.black,
                          ),
                          iconEnabledColor: Colors.transparent,
                          onChanged: (valueList) {
                            controller.selectSizeValue?.value =
                                valueList ?? SizeModel();
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
        },
        itemCount: controller.wishItemModel.value.items?.length,
      ),
    );
  }
}