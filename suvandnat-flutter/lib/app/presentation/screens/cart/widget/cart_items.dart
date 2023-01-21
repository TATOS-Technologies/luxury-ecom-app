import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/cart/cart_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class CartItems extends GetView<CartController> {
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        //   child: Row(
        //     children: [
        //       Text(
        //         LanguageConstants.priceText.tr,
        //       ),
        //       const Spacer(),
        //       Text(
        //         LanguageConstants.qtyText.tr,
        //       ),
        //       const Spacer(),
        //       Text(
        //         LanguageConstants.subtotalText.tr,
        //       ),
        //     ],
        //   ),
        // ),
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.cartModel.value.items?.length ?? 0,
          itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    width: 110,
                                    height: 110,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 5,
                                            left: 5,
                                            top: 5,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                  AppAsset.logo,
                                                ),
                                                width: 40,
                                              ),
                                              Tooltip(
                                                message: LanguageConstants.addProductToWishlist.tr,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    confirmationDialogForAddToWishList(
                                                      index,
                                                      context,
                                                    );
                                                  },
                                                  child: const Icon(
                                                    Icons.favorite_border,
                                                    color: blackColor,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        controller.getProductImage(index) != ""
                                            ? CachedNetworkImage(
                                                width: 65,
                                                fit: BoxFit.cover,
                                                imageUrl: controller.getProductImage(index),
                                                //  placeholder: (context, url) => const CircularProgressIndicator(),
                                                progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                    Lottie.asset(
                                                  AppAsset.loader,
                                                  width: 65,
                                                ),
                                                errorWidget: (
                                                  context,
                                                  url,
                                                  error,
                                                ) =>
                                                    const Icon(
                                                  Icons.error,
                                                ),
                                              )
                                            : Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                    6.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: const Color(
                                                        0xffB89BA4,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    LanguageConstants.noImageText.tr,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.cartModel.value.items?[index].name}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: AppTextStyle.textStyleUtils500(size: 12.sp),
                              ),
                              Text(controller.cartModel.value.items?[index].sku?.toString() ?? '',
                                  overflow: TextOverflow.ellipsis, maxLines: 2),
                              Row(
                                children: const [Spacer(), Icon(Icons.edit_outlined), Icon(Icons.delete_outlined)],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        // const SizedBox(height: 8),

                        // Text(
                        //   localStore.getRegularPriceWithCurrency(
                        //     controller.cartModel.value.items![index].price
                        //         .toString(),
                        //     controller.cartModel.value.items![index].price
                        //         .toString(),
                        //   ),
                        // ),
                        //     ],
                        //   ),
                        // ),
                        Text(
                          LanguageConstants.qtyText.tr,
                          style: AppTextStyle.textStyleUtils500(color: primary, size: 14.sp),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (controller.cartModel.value.items?[index].qty == 1) {
                                  confirmationDialogForRemove(index, context);
                                } else {
                                  controller.postRemoveFromCartData(index);
                                }
                              },
                              child: Container(
                                width: 18.w,
                                height: 18.h,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: primary),
                                child: const Icon(
                                  Icons.remove,
                                  color: whiteColor,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              controller.cartModel.value.items![index].qty.toString(),
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                controller.increaseProductQty(index);
                                // controller.
                              },
                              child: Container(
                                width: 18.w,
                                height: 18.h,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: primary),
                                child: const Icon(
                                  Icons.add,
                                  color: whiteColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          LanguageConstants.subTotal.tr,
                          style: AppTextStyle.textStyleUtils500(color: primary, size: 14.sp),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          localStore.getRegularPriceWithCurrency(
                              controller.cartModel.value.items![index].price.toString(),
                              controller.cartModel.value.items![index].price.toString()),
                          style: AppTextStyle.textStyleUtils600(color: blackColor, size: 14.sp),
                        ),
                        SizedBox(
                          height: 30.h,
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }

  Widget cartNumber(int index) {
    return Obx(
      () => Text(
        "${controller.cartModel.value.items?[index].qty ?? ''}",
      ),
    );
  }

  Future confirmationDialogForRemove(
    int index,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (_) {
        return CommonAlertDialog(
          contentPadding: EdgeInsets.zero,
          elevation: 2.0,
          radius: 30,
          backgroundColor: greenD1F1FF,
          titleWidget: Text(
            LanguageConstants.removeProduct.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils400(),
          ),
          contentWidget: Text(
            LanguageConstants.areYouSureWantToRemoveThisProductFromCart.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils400(),
          ),
          actionWidgets: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: appColorPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    Get.back();
                    if (localStore.customerToken.toString() != "") {
                      controller.deleteCartProductContent(
                        index,
                        1,
                      );
                    } else {
                      controller.deleteCartProductContent(
                        index,
                        2,
                      );
                    }
                  },
                  child: HeadlineBodyOneBaseWidget(
                    title: LanguageConstants.yesText.tr,
                    titleColor: Colors.white,
                    fontFamily: AppConstants.fontPoppins,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: appColorPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    Get.back();
                    if (localStore.customerToken.toString() != "") {
                      controller.deleteCartProductContent(index, 1);
                    } else {
                      controller.deleteCartProductContent(index, 2);
                    }
                  },
                  child: HeadlineBodyOneBaseWidget(
                    title: LanguageConstants.no.tr,
                    titleColor: Colors.white,
                    fontFamily: AppConstants.fontPoppins,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Future confirmationDialogForAddToWishList(
    int index,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (_) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          backgroundColor: greenD1F1FF,
          titleWidget: Text(
            LanguageConstants.addToWishlist.tr,
            style: AppTextStyle.textStyleUtils400(color: brownColor),
          ),
          contentWidget: Text(
            LanguageConstants.onceYouAddThisProductToWishlistThenItWillBeRemoveFromAart.tr,
            style: AppTextStyle.textStyleUtils400(color: brownColor),
          ),
          actionWidgets: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: brownColor,
                ),
                child: Text(
                  LanguageConstants.ok.tr,
                  style: AppTextStyle.textStyleUtils500(size: 15.0, color: Colors.white),
                ),
              ),
              onTap: () {
                Get.back();
                controller.postAddToWishlistData(
                  index,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
