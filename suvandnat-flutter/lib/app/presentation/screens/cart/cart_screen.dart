import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:suvandnat/app/controller/cart/cart_controller.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/screens/cart/widget/cart_donation.dart';
import 'package:suvandnat/app/presentation/screens/cart/widget/cart_items.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class CartScreen extends GetView<CartController> {
  CartScreen({Key? key}) : super(key: key);

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: commonAppbar(title: "Shopping Cart"),
      body: Obx(
        () => controller.isMainLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(0xFF973133),
                  // size: 50.0,
                ),
              )
            : Stack(
                children: [
                  SafeArea(
                    bottom: false,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(24.w),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: whiteColor),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10.w,
                                        bottom: 10.w,
                                        left: 10.w,
                                      ),
                                      child: Text(
                                        LanguageConstants.itemText.tr,
                                        style: AppTextStyle.textStyleUtils500(color: primary, size: 14.sp),
                                      ),
                                    ),
                                    const CartItems(),
                                    (controller.cartModel.value.items?.isEmpty ?? false)
                                        ? Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(30.w),
                                              child: Text(
                                                ' ${LanguageConstants.youHaveNoItemsInYourShoppingCart.tr}',
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle.textStyleUtils400_16(color: regularGrey),
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              (controller.cartModel.value.items?.isEmpty ?? false)
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                        vertical: 30,
                                      ),
                                      child: CommonThemeButton(
                                        onTap: () async {
                                          Get.offAllNamed(RoutesConstants.dashboardScreen);
                                        },
                                        title: LanguageConstants.continueShopping.tr,
                                      ))
                                  : Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.w),
                                      decoration:
                                          BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            LanguageConstants.summaryText.tr,
                                            style: AppTextStyle.textStyleUtils500(color: primary, size: 14.sp),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LanguageConstants.subTotal.tr.capitalizeFirst ?? '',
                                                style: AppTextStyle.textStyleUtils400(size: 12.sp),
                                              ),
                                              Text(
                                                controller.firstCapitalize(
                                                    controller.getTotalsData.value.getSubTotal().toString()),
                                                style: AppTextStyle.textStyleUtils500(size: 12.sp),
                                              ),
                                            ],
                                          ),
                                          const Divider(),
                                          controller.showAppliedCoupons.value
                                              ? Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        CommonTextPoppins(
                                                          controller.getTotalsData.value.getDiscountName() == null
                                                              ? '${LanguageConstants.discount.tr}(${controller.promoCodeController.text})'
                                                              : controller.getTotalsData.value.getDiscountName()!,
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight.w500,
                                                          textAlign: TextAlign.left,
                                                          color: brownColor,
                                                        ),
                                                        CommonTextPoppins(
                                                          controller.getTotalsData.value.getDiscount() ?? '',
                                                          fontSize: 12.sp,
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox(),
                                          SizedBox(
                                            height: controller.showAppliedCoupons.value ? 14.h : 0,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LanguageConstants.taxText.tr.capitalizeFirst ?? '',
                                                style: AppTextStyle.textStyleUtils400(size: 12.sp),
                                              ),
                                              Text(
                                                controller.firstCapitalize(
                                                    controller.getTotalsData.value.getTax().toString()),
                                                style: AppTextStyle.textStyleUtils400(size: 12.sp),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 14,
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
                                                      hintText: LanguageConstants.enterDiscountCoupon.tr,
                                                      hintStyle: AppTextStyle.textStyleUtils400_12(color: Colors.grey),
                                                      labelStyle: AppTextStyle.textStyleUtils400(
                                                          size: 12.sp, color: Colors.black54),
                                                      errorStyle: AppTextStyle.textStyleUtils400(size: 12.sp),
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
                                                        ? LanguageConstants.removeCouponsolo.tr
                                                        : LanguageConstants.apply.tr,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showAllCouponsList();
                                            },
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                LanguageConstants.availableCouponList.tr,
                                                style: AppTextStyle.textStyleUtilsUnderLine14(),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                LanguageConstants.orderTotalText.tr,
                                                style: AppTextStyle.textStyleUtils400(size: 14.sp),
                                              ),
                                              const Spacer(),
                                              Text(
                                                controller.firstCapitalize(
                                                    controller.getTotalsData.value.getGrandTotal().toString()),
                                                style: AppTextStyle.textStyleUtils500(size: 14.sp),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: CommonThemeButton(
                                              onTap: () async {
                                                await Get.toNamed(
                                                  RoutesConstants.checkoutOrderScreen,
                                                  arguments: controller.cartModel.value,
                                                );
                                                controller.getTotals();
                                              },
                                              title: LanguageConstants.checkoutText.tr,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          if (controller.donationList.isNotEmpty) const CartDonation(),
                          SizedBox(
                            height: 120.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.isLoading.value
                      ? AbsorbPointer(
                          absorbing: true,
                          child: Center(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                              child: const SpinKitThreeBounce(
                                color: cartBrownColor,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
      ),
    );
  }

  void showAllCouponsList() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: backGroundColor,
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
                      CouponItems? couponItems = controller.couponCode.value.items?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: brownColor,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SizedBox(height: 4,),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  LanguageConstants.coupons.tr,
                                  style: AppTextStyle.textStyleUtils500(size: 10.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: CommonTextPoppins(
                                  couponItems?.code ?? '',
                                  fontSize: 14.0,
                                  overflow: TextOverflow.ellipsis,
                                  maxLine: 2,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
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
}
