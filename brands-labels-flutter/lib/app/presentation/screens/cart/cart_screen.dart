import 'dart:ui';

import 'package:brandslabels/app/controller/cart_controller.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:meta_package/api/models/cart/donation_modal.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import '../../../main/main.common.dart';
import '../charity/charity_popup.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
  }

  Future<void> confirmationDialogForRemove(
      int index, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return CommonAlertDialog(
            elevation: 6.0,
            radius: 0,
            titleWidget: Text(LanguageConstants.removeProduct.tr,
                style: AppTextStyle.textStyleUtils700_16()),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    LanguageConstants
                        .areYouSureWantToRemoveThisProductFromCart.tr,
                    style: AppTextStyle.textStyleUtils400_16()),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: darkBlue),
                        child: Text(
                          LanguageConstants.yes.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 15, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        controller.deleteProduct(index);
                      },
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: darkBlue),
                        child: Text(
                          LanguageConstants.no.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 15, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Future<void> confirmationDialogForAddToWishList(
      int index, BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          titleWidget: Text(LanguageConstants.addToWishlist.tr,
              style: AppTextStyle.textStyleUtils700_16()),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          contentWidget: Text(
              LanguageConstants
                  .onceYouAddThisProductToWishlistThenItWillBeRemoveFromAart.tr,
              style: AppTextStyle.textStyleUtils400_16()),
          actionWidgets: [
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: darkBlue),
                child: Text(LanguageConstants.ok.tr,
                    style: AppTextStyle.textStyleUtils400(
                        size: 15, color: Colors.white)),
              ),
              onTap: () {
                Get.back();
                controller.postAddToWishlistData(index);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> confirmationDialogForRemoveCartProduct(
      int index, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return CommonAlertDialog(
            elevation: 6.0,
            radius: 0,
            titleWidget: Text(LanguageConstants.removeProduct.tr,
                style: AppTextStyle.textStyleUtils700_16()),
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    LanguageConstants
                        .areYouSureWantToRemoveThisProductFromCart.tr,
                    style: AppTextStyle.textStyleUtils400_16()),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: darkBlue),
                        child: Text(
                          LanguageConstants.yes.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 15, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        controller.deleteProduct(index);
                      },
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: darkBlue),
                        child: Text(
                          LanguageConstants.no.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 15, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: whiteColor,
        appBar: commonAppbar(
            title: firstCapitalize(LanguageConstants.shippingCart.tr)),
        body: controller.isMainLoading.value
            ? const Center(
                child: SpinKitThreeBounce(color: Color(0xff000080)),
              )
            : Stack(
                children: [
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 25.0),
                          if (controller.donationList.isNotEmpty)
                            donateDesign(context),
                          const SizedBox(height: 15.0),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10.w),
                                        height: 40.w,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            color: blueTileColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(11),
                                              topRight: Radius.circular(11),
                                            )),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            LanguageConstants.itemText.tr,
                                            style:
                                                AppTextStyle.textStyleUtils500(
                                                    color: primary,
                                                    size: 14.sp),
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color: borderGrey,
                                        height: 2,
                                        thickness: 2,
                                      ),
                                      SizedBox(
                                        child: Padding(
                                          padding: EdgeInsets.all(10.w),
                                          child: cartList(),
                                        ),
                                      ),
                                      (controller.cartModel.value.items
                                                  ?.isEmpty ??
                                              false)
                                          ? Align(
                                              child: Padding(
                                                padding: EdgeInsets.all(24.w),
                                                child: Text(
                                                  LanguageConstants
                                                      .nouHaveNoItemsInYourShoppingCart
                                                      .tr,
                                                  textAlign: TextAlign.center,
                                                  style: AppTextStyle
                                                      .textStyleUtils400(
                                                          color: regularGrey),
                                                ),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                (controller.cartModel.value.items?.isNotEmpty ??
                                        false)
                                    ? Container(
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: borderGrey, width: 2)),
                                        child: cartItem(context),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                          vertical: 30,
                                        ),
                                        child: SizedBox(
                                          height: 45.h,
                                          width: 327.w,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: appBarPrimary,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12))),
                                            onPressed: () {
                                              Get.offAllNamed(RoutesConstants
                                                  .dashboardScreen);
                                            },
                                            child: CommonTextPoppins(
                                              LanguageConstants
                                                  .continueShopping.tr,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.isLoading.value
                      ? Center(
                          child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                              child: const SpinKitThreeBounce(
                                  color: Color(0xff000080))),
                        )
                      : const SizedBox(),
                ],
              ),
      ),
    );
  }

  Widget cartItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 10.w),
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: blueTileColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                LanguageConstants.cartSummaryTxet.tr,
                style:
                    AppTextStyle.textStyleUtils500(color: primary, size: 14.sp),
              ),
            )),
        const Divider(
          color: borderGrey,
          height: 2,
          thickness: 2,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                LanguageConstants.subTotalText.tr,
                                style:
                                    AppTextStyle.textStyleUtils400(size: 12.sp),
                              ),
                              Text(
                                controller.firstCapitalize(controller
                                    .getTotalsData.value
                                    .getSubTotal()
                                    .toString()),
                                style:
                                    AppTextStyle.textStyleUtils500(size: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        controller.showAppliedCoupons.value
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonTextPoppins(
                                          controller.getTotalsData.value
                                                      .getDiscountName() ==
                                                  null
                                              ? '${LanguageConstants.discount.tr}(${controller.promoCodeController.text})'
                                              : controller.getTotalsData.value
                                                  .getDiscountName()!,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.left,
                                          color: darkBlue),
                                      CommonTextPoppins(
                                          controller.getTotalsData.value
                                                  .getDiscount() ??
                                              '',
                                          fontSize: 12.sp,
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        const SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(LanguageConstants.taxText.tr,
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 12.sp)),
                              Text(
                                  controller.firstCapitalize(controller
                                      .getTotalsData.value
                                      .getTax()
                                      .toString()),
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 12.sp))
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: borderGrey)),
                          height: 40.w,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  cursorColor: appColor,
                                  controller: controller.promoCodeController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    // contentPadding:
                                    //     const EdgeInsets.only(
                                    //   bottom: 10,
                                    //   top: 10,
                                    //   left: 10,
                                    // ),
                                    hintText: "Enter Discount Coupon Code",
                                    hintStyle:
                                        AppTextStyle.textStyleUtils400_12(
                                            color: Colors.grey),
                                    labelStyle: AppTextStyle.textStyleUtils400(
                                        size: 12.sp, color: Colors.black54),
                                    errorStyle: AppTextStyle.textStyleUtils400(
                                        size: 12.sp),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          12,
                                        ),
                                        borderSide: BorderSide.none),
                                    suffixIcon: null,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.w,
                                width: 80.w,
                                child: CommonThemeButton(
                                  borderRadius: 12,
                                  onTap: () {
                                    if (controller.showAppliedCoupons.value) {
                                      controller.deleteAppliedCoupon();
                                    } else {
                                      controller.addCouponsToCartForField();
                                    }
                                  },
                                  title: controller.showAppliedCoupons.value
                                      ? 'Remove'
                                      : 'Apply',
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 40,
                        //   width: Get.width,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SizedBox(
                        //         height: 28,
                        //         width: 180,
                        //         child: TextFormField(
                        //           cursorColor: darkBlue,
                        //           controller: controller.promoCodeController,
                        //           decoration: InputDecoration(
                        //             filled: true,
                        //             fillColor: Colors.transparent,
                        //             contentPadding: const EdgeInsets.only(
                        //                 bottom: 10, top: 10, left: 10),
                        //             hintText: LanguageConstants.enterCouponCode.tr,
                        //             hintStyle: AppTextStyle.textStyleUtils400_12(),
                        //             labelStyle: const TextStyle(
                        //                 fontFamily: AppConstants.fontPoppins,
                        //                 color: Colors.black54),
                        //             errorStyle: AppTextStyle.textStyleUtils400(),
                        //             focusedBorder: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(0.0),
                        //               borderSide: const BorderSide(color: Colors.black),
                        //             ),
                        //             enabledBorder: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(0.0),
                        //               borderSide: const BorderSide(
                        //                   color: Colors.black, width: 1.0),
                        //             ),
                        //             suffixIcon: null,
                        //             border: OutlineInputBorder(
                        //               borderSide: const BorderSide(color: Colors.black),
                        //               borderRadius: BorderRadius.circular(0.0),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           if (controller.showAppliedCoupons.value) {
                        //             controller.deleteAppliedCoupon();
                        //           } else {
                        //             controller.addCouponsToCartForField();
                        //           }
                        //         },
                        //         child: Container(
                        //           height: 28,
                        //           width: 60,
                        //           decoration: const BoxDecoration(color: darkBlue),
                        //           child: Center(
                        //             child: Text(
                        //               controller.showAppliedCoupons.value
                        //                   ? 'Remove Coupon'
                        //                   : LanguageConstants.applyText.tr,
                        //               style: AppTextStyle.textStyleUtils400(
                        //                   color: Colors.white),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            showAllCouponsList();
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              LanguageConstants.availableCouponList.tr,
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(LanguageConstants.orderTotalText.tr,
                                style: AppTextStyle.textStyleUtils400()),
                            const Spacer(),
                            Text(
                                controller.firstCapitalize(controller
                                    .getTotalsData.value
                                    .getGrandTotal()
                                    .toString()),
                                style: AppTextStyle.textStyleUtils400()),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Center(
                            child: SizedBox(
                          height: 35.w,
                          child: CommonThemeButton(
                            onTap: () async {
                              await Get.toNamed(
                                RoutesConstants.checkoutOrderScreen,
                                arguments: controller.cartModel.value,
                              );
                              controller.getTotals();
                            },
                            title: firstCapitalize(
                                LanguageConstants.gotoCheckOutText.tr),
                          ),
                        )),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  void showAllCouponsList() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: whiteColor,
          radius: 30,
          contentWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(LanguageConstants.allCouponsList.tr),
                ),
                SizedBox(
                  height: 400,
                  width: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.couponCode.value.items?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      CouponItems? couponItems =
                          controller.couponCode.value.items?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: CommonTextPoppins(
                                      LanguageConstants.coupons.tr,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.left)),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CommonTextPoppins(
                                      couponItems?.code ?? '',
                                      fontSize: 14.0,
                                      overflow: TextOverflow.ellipsis,
                                      maxLine: 2,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.left)),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget cartList() {
    var listView = ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.cartModel.value.items?.length ?? 0,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(
            top: 12.0, bottom: 22.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(RoutesConstants.productDetailScreen,
                        parameters: {
                          kRouteParameterProductSkuKey:
                              controller.cartModel.value.items?[index].sku ?? ''
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10.w,
                      top: 10.w,
                    ),
                    width: 91.w,
                    height: 97.w,
                    // padding: const EdgeInsets.only(
                    //   bottom: 15,
                    // ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 3, left: 3, top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                  image: AssetImage(AppAsset.logo), width: 40),
                              Tooltip(
                                message: LanguageConstants
                                    .addProductToYourWishList.tr,
                                child: GestureDetector(
                                    onTap: () {
                                      confirmationDialogForAddToWishList(
                                          index, context);
                                    },
                                    child: const Icon(Icons.favorite_border,
                                        color: darkBlue, size: 20)),
                              ),
                            ],
                          ),
                        ),
                        controller.getProductImage(index) != ""
                            ? CachedNetworkImage(
                                width: 60,
                                fit: BoxFit.cover,
                                imageUrl: controller.getProductImage(index),
                                //  placeholder: (context, url) => const CircularProgressIndicator(),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        Lottie.asset(AppAsset.loaderJson,
                                            width: 65),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text(
                          firstCapitalize(controller
                                  .cartModel.value.items?[index].name
                                  ?.toString() ??
                              ''),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: AppTextStyle.textStyleUtils500(size: 15),
                        ),
                      ),
                      Text(
                          controller.cartModel.value.items?[index].sku
                                  ?.toString() ??
                              '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                      Row(
                        children: [
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                Get.toNamed(RoutesConstants.productDetailScreen,
                                    parameters: {
                                      kRouteParameterProductSkuKey: controller
                                              .cartModel
                                              .value
                                              .items?[index]
                                              .sku ??
                                          ''
                                    });
                              },
                              child: const Icon(Icons.edit_outlined)),
                          SizedBox(
                            width: 8.w,
                          ),
                          InkWell(
                              onTap: () {
                                confirmationDialogForRemoveCartProduct(
                                    index, context);
                              },
                              child: const Icon(Icons.delete_outlined))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LanguageConstants.qtyText.tr,
                  style: AppTextStyle.textStyleUtils500(
                      color: primary, size: 14.sp),
                ),
                SizedBox(
                  width: 15.w,
                ),
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: primary),
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2), color: primary),
                    child: const Icon(
                      Icons.add,
                      color: whiteColor,
                      size: 20,
                    ),
                  ),
                ),
                // Expanded(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Text(
                //         LanguageConstants.qtyText.tr,
                //         style: AppTextStyle.textStyleUtils400(),
                //       ),
                //       const SizedBox(height: 6),
                //       // Text(list.qty.toString()),
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           InkWell(
                //             onTap: () {
                //               controller.checkForEmptyDeletation(
                //                   index, context);
                //             },
                //             child: const Icon(
                //               Icons.remove,
                //               color: blackColor,
                //               size: 20,
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 07,
                //           ),
                //           Text(
                //             list.qty.toString(),
                //             style: AppTextStyle.textStyleUtils400(),
                //           ),
                //           const SizedBox(
                //             width: 07,
                //           ),
                //           InkWell(
                //             onTap: () {
                //               controller.increaseProductQty(index);
                //               // controller.
                //             },
                //             child: const Icon(
                //               Icons.add,
                //               color: blackColor,
                //               size: 20,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // Expanded(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Text(
                //           firstCapitalize(LanguageConstants.subTotalText.tr)),
                //       const SizedBox(height: 6),
                //       Text(
                //         localStore.getRegularPriceWithCurrency(
                //           (list.price * list.qty).toString(),
                //           (list.price * list.qty).toString(),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const Spacer(),
                Text(
                  LanguageConstants.subTotal.tr,
                  style: AppTextStyle.textStyleUtils500(
                      color: primary, size: 14.sp),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  localStore.getRegularPriceWithCurrency(
                      controller.cartModel.value.items![index].price.toString(),
                      controller.cartModel.value.items![index].price
                          .toString()),
                  style: AppTextStyle.textStyleUtils600(
                      color: blackColor, size: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.w,
            ),
          ],
        ),
      ),
    );
    return Column(
      children: [
        listView,
      ],
    );
  }

  Widget donateDesign(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 12),
      margin: const EdgeInsets.only(left: 10, right: 10),
      width: Get.width,
      decoration: BoxDecoration(
        color: shoppingcartGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LanguageConstants.cartContain1.tr,
            style: AppTextStyle.textStyleUtils600_16(),
          ),
          const SizedBox(height: 10),
          Text(
            LanguageConstants.cartContain2.tr,
            style: AppTextStyle.textStyleUtils300(),
          ),
          const SizedBox(height: 28),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.donationList.length,
            itemBuilder: (context, index) {
              return dataDonation(context, controller.donationList[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget emptyDataWidget() {
    return Container(
      alignment: Alignment.center,
      height: Get.height / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(LanguageConstants.youHaveNoProductsInYourWishList.tr,
              style: AppTextStyle.normalRegular14),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.offAndToNamed(RoutesConstants.dashboardScreen);
            },
            style: ElevatedButton.styleFrom(
              elevation: 1,
              backgroundColor: appBarPrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: CommonTextPoppins(LanguageConstants.continueShopping.tr,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13.5),
          )
        ],
      ),
    );
  }

  String getSecondaryPrice(int index) {
    String price = ((controller.cartModel.value.items?[index].qty ?? 0) *
            (double.tryParse(
                    controller.cartModel.value.items?[index].price.toString() ??
                        '') ??
                0))
        .toString();
    return localStore.getRegularPriceWithCurrency(price, price);
  }

  Widget dataDonation(BuildContext context, DonationItems imageData) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imageData.imageURL == null
            ? Image(
                image: AssetImage(AppAsset.he),
                height: 90,
                width: 150,
                color: darkBlue)
            : Image.network(imageData.imageURL ?? '',
                height: 90, width: 150, fit: BoxFit.cover),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LanguageConstants.cartContain3.tr,
                  style: AppTextStyle.textStyleUtils400_16()),
              const SizedBox(height: 5),
              MaterialButton(
                onPressed: () {
                  _showDialog(context);
                },
                elevation: 0,
                minWidth: 175,
                color: darkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  LanguageConstants.cartContain4.tr,
                  style: AppTextStyle.textStyleUtils600(color: whiteColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(() => Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: dialogContent(context)));
      },
    );
  }
}
