// ignore_for_file: inference_failure_on_function_invocation

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';
import '../../../../core/const/app_style.dart';

class WishlistListItem extends GetView<WishlistController> {
  final Function? backToShop;

  const WishlistListItem({required this.backToShop, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.isWishListEmptyOrNot()
        ? SizedBox(
            height: Get.height - (kToolbarHeight * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const NothigToShowAnimationWidget(),
                Text(
                  LanguageConstants.youHaveNoProductsInYourWishList.tr,
                  style: AppTextStyle.normalRegular14,
                ),
                SizedBox(height: 30.h),
                SizedBox(
                
                  child: CommonThemeButton(
                    onTap: () {
                      if (backToShop != null) {
                        backToShop!("true");
                      } else {
                        Get.offAndToNamed<dynamic>(RoutesConstants.dashboardScreen);
                      }
                    },
                    title: 
                      LanguageConstants.continueShopping.tr,
                     
                  ),
                )
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.wishItemModel?.value.items?.length,
              itemBuilder: (_, index) {
                ItemProduct? item = controller.wishItemModel?.value.items?[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.wishListOnTap(item);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(color: appTileBorderColor)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: controller.productImage(index),
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 20, top: 20, bottom: 30),
                                  // margin: const EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: homeBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        color: blackColor.withOpacity(0.10),
                                        blurRadius: 25,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        item?.product?.name ?? '',
                                        maxLines: 1,
                                        style: AppStyle.commonTextStyle400(),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          controller.getProductPrice(index),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: AppStyle.commonTextStyle600(size: 15.0),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Obx(
                                        () => Visibility(
                                          visible: controller.wishItemModel?.value.items?[index]
                                                  .product?.typeId ==
                                              'configurable',
                                          child: Container(
                                            height: 40.h,
                                            margin: const EdgeInsets.only(bottom: 5, right: 20),
                                            padding: const EdgeInsets.symmetric(horizontal: 6),
                                            decoration: BoxDecoration(
                                              color: backgroundticket,
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(color: appTileBorderColor),
                                            ),
                                            child: item?.product?.sizeList != null
                                                ? DropdownButtonHideUnderline(
                                                    child: DropdownButton<SizeModel>(
                                                      dropdownColor: backgroundticket,
                                                      items: item?.product?.sizeList!
                                                          .map(
                                                            (value) => DropdownMenuItem(
                                                              value: value,
                                                              child: Text(value.label.toString()),
                                                            ),
                                                          )
                                                          .toList(),
                                                      isExpanded: true,
                                                      hint: item?.product?.selectSizeValue?.value
                                                                  .value?.isNotEmpty ==
                                                              true
                                                          ? Text(
                                                              item?.product?.selectSizeValue?.value
                                                                      .value ??
                                                                  '',
                                                              style: const TextStyle(
                                                                  color: Colors.black),
                                                            )
                                                          : Text(
                                                              LanguageConstants.chooseAnOption.tr,
                                                              style:
                                                                  AppStyle.textStyleUtils400_12(),
                                                            ),
                                                      value: item?.product?.selectSizeValue?.value
                                                                  .value !=
                                                              null
                                                          ? item?.product?.selectSizeValue?.value
                                                          : null,
                                                      icon: const Icon(
                                                        Icons.keyboard_arrow_down,
                                                        size: 22,
                                                        color: Colors.black,
                                                      ),
                                                      iconEnabledColor: Colors.transparent,
                                                      onChanged: (valueList) {
                                                        debugPrint(
                                                            'Selected == ${valueList?.toJson()}');
                                                        if (valueList != null) {
                                                          item?.product?.selectSizeValue?.value =
                                                              valueList;
                                                        }
                                                        debugPrint(
                                                            'Selected size== ${item?.product?.selectSizeValue?.value}');
                                                      },
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            LanguageConstants.qtyText.tr,
                                            style: AppStyle.textStyleUtils400_16(
                                                color: appColorPrimary),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          SizedBox(
                                            height: 35.w,
                                            width: 80.w,
                                            child: TextFormField(
                                              controller: item?.product?.countController,
                                              keyboardType: TextInputType.number,
                                              textAlign: TextAlign.center,
                                              textInputAction: TextInputAction.done,
                                              style: AppStyle.textStyleUtils400(
                                                  size: 14.sp, color: appColorPrimary),
                                              decoration: InputDecoration(
                                                  fillColor: backgroundticket,
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide: BorderSide.none)),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(4),
                                                // for mobile
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Expanded(
                                            child: CommonThemeButton(
                                              onTap: () async {
                                                await controller.getGenerateCart(index);
                                              },
                                             title:
                                                LanguageConstants.addTOCart.tr,
                                               
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.deleteWishListData(index);
                                            },
                                            child: Image(
                                              image: AssetImage(
                                                AppAsset.delete,
                                              ),
                                              color: appColorPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          );
  }
}
