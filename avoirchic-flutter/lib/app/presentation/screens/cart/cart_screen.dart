import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/screen_loading.dart';
import 'package:avoirchic/app/presentation/screens/cart/widget/cart_donation.dart';
import 'package:avoirchic/app/presentation/screens/cart/widget/cart_items.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import '../../../controller/cart_controller.dart';
import '../../common_widgets/common_widget/common_appbar.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBGColor,
      appBar: commonAppbar(
        title: LanguageConstants.shippingCartText.tr,
        appBarColor: Colors.transparent,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(
                    0xff367587,
                  ),
                ),
              )
            : Stack(
                children: [
                  SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.all(24.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              const CartItems(),
                              !controller.isItemListEmpty()
                                  ? GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(top: 20),
                                        // decoration: BoxDecoration(
                                        //   border: Border.all(
                                        //       color: Colors.black, width: 1),
                                        // ),
                                        child: Column(
                                          children: [
                                            const NothigToShowAnimationWidget(),
                                            Text(
                                              "You have no items in your shopping cart.",
                                              textAlign: TextAlign.center,
                                              style: AppTextStyle
                                                  .textStyleUtils400_16(),
                                            ),
                                            SizedBox(
                                              height: 10.w,
                                            ),
                                            CommonThemeButton(
                                              onTap: () {},
                                              title: LanguageConstants
                                                  .continueShopping.tr,
                                            ),
                                            SizedBox(
                                              height: 20.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: 20.w,
                              ),
                              controller.isItemListEmpty()
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: borderGrey)),
                                          height: 40.w,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  cursorColor: appColor,
                                                  controller: controller
                                                      .promoCodeController,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                        Colors.transparent,
                                                    // contentPadding:
                                                    //     const EdgeInsets.only(
                                                    //   bottom: 10,
                                                    //   top: 10,
                                                    //   left: 10,
                                                    // ),
                                                    hintText: LanguageConstants
                                                        .enterDiscountCoupon.tr,
                                                    hintStyle: AppTextStyle
                                                        .textStyleUtils400_12(
                                                            color: Colors.grey),
                                                    labelStyle: AppTextStyle
                                                        .textStyleUtils400(
                                                            size: 12.sp,
                                                            color:
                                                                Colors.black54),
                                                    errorStyle: AppTextStyle
                                                        .textStyleUtils400(
                                                            size: 12.sp),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        12,
                                                      ),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              12,
                                                            ),
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    suffixIcon: null,
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                    if (controller
                                                        .showAppliedCoupons
                                                        .value) {
                                                      controller
                                                          .deleteAppliedCoupon();
                                                    } else {
                                                      controller
                                                          .addCouponsToCartForField();
                                                    }
                                                  },
                                                  title: controller
                                                          .showAppliedCoupons
                                                          .value
                                                      ? LanguageConstants
                                                          .removeCouponsolo.tr
                                                      : LanguageConstants
                                                          .apply.tr,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showAllCouponsList();
                                          },
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              LanguageConstants
                                                  .viewCouponList.tr,
                                              style: AppTextStyle
                                                  .textStyleUtilsUnderLine(
                                                      color: primary,
                                                      thickness: .6,
                                                      size: 14.sp),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              SizedBox(
                                height: 20.h,
                              ),
                              controller.isItemListEmpty()
                                  ? Container(
                                      // padding: EdgeInsets.all(20.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            width: 1.0, color: borderGrey),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 12.w),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                firstCapitalize(
                                                    LanguageConstants
                                                        .cartSummaryText.tr),
                                                style: AppTextStyle
                                                    .textStyleUtils400(),
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                              color: borderGrey,
                                              height: 1,
                                              thickness: 1),
                                          Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      LanguageConstants
                                                          .subtotalSpaceText.tr,
                                                      style: AppTextStyle
                                                          .textStyleUtils400(),
                                                    ),
                                                    Text(
                                                      controller.getTotalsData
                                                              .value
                                                              .getSubTotal() ??
                                                          '',
                                                      style: AppTextStyle
                                                          .textStyleUtils400(),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.w,
                                                ),
                                                controller.showAppliedCoupons
                                                        .value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              CommonTextPoppins(
                                                                controller.getTotalsData
                                                                            .value
                                                                            .getDiscountName() ==
                                                                        null
                                                                    ? '${LanguageConstants.discount.tr}(${controller.promoCodeController.text})'
                                                                    : controller
                                                                        .getTotalsData
                                                                        .value
                                                                        .getDiscountName()!,
                                                                fontSize: 14.0,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                              CommonTextPoppins(
                                                                controller
                                                                        .getTotalsData
                                                                        .value
                                                                        .getDiscount() ??
                                                                    '',
                                                                fontSize: 14.0,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : const SizedBox(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      LanguageConstants
                                                          .taxText.tr,
                                                      style: AppTextStyle
                                                          .textStyleUtils400(),
                                                    ),
                                                    Text(
                                                      controller.getTotalsData
                                                              .value
                                                              .getTax() ??
                                                          '',
                                                      style: AppTextStyle
                                                          .textStyleUtils400(),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      LanguageConstants
                                                          .orderTotalText.tr,
                                                      style: AppTextStyle
                                                          .textStyleUtils400(),
                                                    ),
                                                    Text(
                                                      controller.getTotalsData
                                                              .value
                                                              .getGrandTotal() ??
                                                          '',
                                                      style: AppTextStyle
                                                          .textStyleUtils400(),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.w,
                                                ),
                                                CommonThemeButton(
                                                    onTap: () async {
                                                      await Get.toNamed(
                                                        RoutesConstants
                                                            .checkoutOrderScreen,
                                                        arguments: controller
                                                            .cartModel.value,
                                                      );
                                                      controller.getTotals();
                                                    },
                                                    title: LanguageConstants
                                                        .processCheckOutText.tr)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: 30.h,
                              ),
                              if (controller.donationList.isNotEmpty)
                                const CartDonation(),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.isScreenLoading.value
                      ? const ScreenLoading()
                      : const SizedBox.shrink()
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
          backgroundColor: avoirChickLightBgTheme,
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
                          horizontal: 8.0,
                          vertical: 8.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: blackColor,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SizedBox(height: 4,),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: CommonTextPoppins(
                                  LanguageConstants.coupons.tr,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
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
