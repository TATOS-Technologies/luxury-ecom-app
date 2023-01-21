import 'package:avoirchic/app/controller/checkout_order_controller.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_divider.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_field.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart' as ship;
import 'package:meta_package/translations/translations.dart';

class CheckoutOrderSummary extends GetView<CheckoutOrderController> {
  CartModel? cartlist;

  CheckoutOrderSummary({Key? key, this.cartlist}) : super(key: key);

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (controller.shipInfoModel.value.totals == null) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.shipInfoModel.value.totals?.items?.length,
                  itemBuilder: (context, index) {
                    ship.Items? shipItem = controller.shipInfoModel.value.totals?.items?[index];
                    return Obx(
                      () => Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  height: 80,
                                  child: CachedNetworkImage(
                                    imageUrl: shipItem?.extensionAttributes?.productImage ?? '',
                                    errorWidget: (
                                      BuildContext context,
                                      String url,
                                      dynamic error,
                                    ) {
                                      return Image(
                                        image: AssetImage(AppAsset.logo),
                                      );
                                    },
                                    width: 85,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonTextPoppins(
                                      shipItem?.name,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.left,
                                      maxLine: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CommonTextPoppins(
                                          "${LanguageConstants.qtyText.tr}: ${shipItem?.qty}",
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.left,
                                        ),
                                        CommonTextPoppins(
                                          localStore.setItemPriceWithSymbol(shipItem?.rowTotalInclTax.toString() ?? '',
                                              shipItem?.baseRowTotalInclTax.toString() ?? ''),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          shipItem?.options != null && shipItem?.options == "[]"
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    shipItem?.isOptionsOpen.value = !shipItem.isOptionsOpen.value;
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(width: Get.width * 0.269),
                                      const CommonTextPoppins(
                                        "View Details",
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Image.asset(
                                        AppAsset.downArrow,
                                        width: 18.0,
                                        height: 18.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                          const SizedBox(height: 10),
                          shipItem?.isOptionsOpen.value ?? false
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonTextPoppins(
                                      shipItem?.getOptionsLabel(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.left,
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    CommonTextPoppins(
                                      shipItem?.getOptionsValue(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            )),
        CommonDivider(
          width: Get.width,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: EdgeInsets.only(left: 10.w),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGrey)),
          height: 35.h,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: appColor,
                  controller: controller.couponCodeController,
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
                    hintStyle: AppTextStyle.textStyleUtils400_12(color: Colors.grey),
                    labelStyle: AppTextStyle.textStyleUtils400(size: 12.sp, color: Colors.black54),
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
                height: 35.h,
                width: 90.w,
                child: CommonThemeButton(
                  onTap: () {
                    controller.couponEnable();
                  },
                  title: controller.showAppliedCoupons.value
                      ? LanguageConstants.cancelCoupon.tr
                      : LanguageConstants.apply.tr,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        GestureDetector(
          onTap: () {
            showAllCouponsList();
          },
          child: Align(
            alignment: Alignment.topRight,
            child: CommonTextPoppins(
              LanguageConstants.viewCouponList.tr,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 14.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.getTotalsData.value.totalSegments?.length ?? 0,
            itemBuilder: (context, index) {
              ship.TotalSegments? totalSegmentsItem = controller.getTotalsData.value.totalSegments?[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CommonTextPoppins(
                          "${totalSegmentsItem?.title}",
                          fontSize: 11.0,
                          maxLine: 2,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CommonTextPoppins(
                        controller.getTotalSegmentValues(totalSegmentsItem),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              );
            }),
        const SizedBox(
          height: 10.0,
        ),
        CommonDivider(
          width: Get.width,
        ),
        controller.showAppliedCoupons.value
            ? Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextPoppins(
                        controller.getTotalsData.value.getDiscountName() == null
                            ? '${LanguageConstants.discount.tr}(${controller.couponCodeController.text})'
                            : controller.getTotalsData.value.getDiscountName()!,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                        color: avoirChickTheme,
                      ),
                      CommonTextPoppins(
                        controller.getTotalsData.value.getDiscount() ?? '',
                        fontSize: 14.0,
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ],
              )
            : const SizedBox(),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextPoppins(
              LanguageConstants.orderTotalText.tr,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left,
            ),
            CommonTextPoppins(
              controller.getTotalsData.value.getGrandTotal() ?? '',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        SizedBox(
          height: 70.0,
          child: CommonTextField(
            hintText: LanguageConstants.orderCommentText.tr,
            controller: TextEditingController(),
            maxLines: 3,
            isValidationShow: false,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Obx(() => controller.isEnabledPlaceOrder.value
            ? Align(
                alignment: Alignment.center,
                child: CommonThemeButton(
                  onTap: () {
                    controller.placeOrder(
                      context,
                      cartlist,
                    );
                  },
                  title: firstCapitalize(
                    LanguageConstants.placeOrderText.tr,
                  ),
                ),
              )
            : Container())
      ],
    );
  }

  void showAllCouponsList() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: whiteColor,
          radius: 30,
          contentWidget: Container(
            decoration: const BoxDecoration(color: appBGColor),
            child: Padding(
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
                                color: avoirChickTheme,
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
          ),
        );
      },
    );
  }
}
