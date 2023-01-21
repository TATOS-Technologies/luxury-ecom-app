import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/screens/checkout_order/widget/show_all_coupons_list.dart';

import '../../../../../all_imports.dart';

class OrderSummary extends GetView<CheckoutOrderController> {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.shipInfoModel.value.totals == null
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.isShowItems.value =
                              !controller.isShowItems.value;
                        },
                        child: SizedBox(
                          height: 30.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextPoppins(
                                "${controller.shipInfoModel.value.totals?.itemsQty} ${LanguageConstants.itemInCartText.tr}",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.left,
                              ),
                              !controller.isShowItems.value
                                  ? Image.asset(
                                      AppAsset.upArrow,
                                      width: 18.0,
                                      height: 18.0,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      AppAsset.downArrow,
                                      width: 18.0,
                                      height: 18.0,
                                      fit: BoxFit.cover,
                                    ),
                            ],
                          ),
                        ),
                      ),
                      CommonDivider(
                        color: appBorderColor,
                        height: 1.0,
                        width: Get.width,
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      !controller.isShowItems.value
                          ? Container()
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller
                                  .shipInfoModel.value.totals?.items?.length,
                              itemBuilder: (context, index) {
                                Items? shipItem = controller
                                    .shipInfoModel.value.totals?.items?[index];
                                return Obx(
                                  () => Column(
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                AppAsset.frame,
                                                height: 85.w,
                                                width: 85.w,
                                              ),
                                              shipItem?.extensionAttributes
                                                          ?.productImage !=
                                                      null
                                                  ? Image.network(
                                                      shipItem?.extensionAttributes
                                                              ?.productImage ??
                                                          '',
                                                      errorBuilder: (
                                                        BuildContext context,
                                                        Object error,
                                                        StackTrace? stackTrace,
                                                      ) {
                                                        return Container();
                                                      },
                                                      width: 85.w,
                                                    )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10.h,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: 85.0,
                                              width: Get.width,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CommonTextPoppins(
                                                    shipItem?.name,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    textAlign: TextAlign.left,
                                                    maxLine: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CommonTextPoppins(
                                                        "${LanguageConstants.qtyText.tr}: ${shipItem?.qty}",
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      CommonTextPoppins(
                                                        localStore.setItemPriceWithSymbol(
                                                            (shipItem
                                                                    ?.rowTotalInclTax
                                                                    .toString() ??
                                                                ''),
                                                            (shipItem
                                                                    ?.baseRowTotalInclTax
                                                                    .toString() ??
                                                                '')),
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      shipItem?.options != null &&
                                              shipItem?.options == "[]"
                                          ? Container()
                                          : InkWell(
                                              onTap: () {
                                                shipItem?.isOptionsOpen.value =
                                                    !shipItem
                                                        .isOptionsOpen.value;
                                                debugPrint(
                                                    "shipItem.isOptionsOpen -> ${shipItem?.isOptionsOpen}");
                                              },
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: Get.width * 0.269),
                                                  CommonTextPoppins(
                                                    LanguageConstants
                                                        .viewDetailsText.tr,
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w500,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  SizedBox(
                                                    width: 10.h,
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
                                      (shipItem?.isOptionsOpen.value ?? false)
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CommonTextPoppins(
                                                  shipItem?.getOptionsLabel(),
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  textAlign: TextAlign.left,
                                                ),
                                                SizedBox(
                                                  width: 15.h,
                                                ),
                                                CommonTextPoppins(
                                                  shipItem?.getOptionsValue(),
                                                  fontSize: 14.sp,
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
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                CommonDivider(
                  color: appBorderColor,
                  height: 1.0,
                  width: Get.width,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: appTileBGcolor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Form(
                        key: controller.couponFormKey,
                        child: Expanded(
                          child: TextFormField(
                            cursorColor: appColor,
                            controller: controller.couponCodeController,
                            validator: (value) => Validators.validateRequired(
                                value?.trim() ?? '', '*'),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: "Enter Discount Coupon Code",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: AppConstants.fontOpenSans,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              labelStyle: AppTextStyle.textStyleUtils400(
                                  size: 12.sp, color: Colors.black54),
                              errorStyle: AppTextStyle.textStyleUtils400(
                                  size: 12.sp, color: Colors.red),
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
                      ),
                      SizedBox(
                        height: 40.w,
                        child: CommonThemeButton(
                          onTap: () {
                            if (controller.couponFormKey.currentState
                                    ?.validate() ??
                                false) {
                              controller.couponEnable();
                            }
                          },
                          title: controller.showAppliedCoupons.value
                              ? LanguageConstants.cancelCoupon.tr
                              : LanguageConstants.applyText.tr,
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
                    showAllCouponsList(controller);
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
                CommonDivider(
                  color: appBorderColor,
                  height: 1.0,
                  width: Get.width,
                ),
                SizedBox(
                  height: 40.h,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount:
                        controller.getTotalsData.value.totalSegments?.length ??
                            0,
                    itemBuilder: (context, index) {
                      TotalSegments? totalSegmentsItem =
                          controller.getTotalsData.value.totalSegments?[index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CommonTextPoppins(
                                  "${totalSegmentsItem?.title}",
                                  fontSize: 13.sp,
                                  maxLine: 2,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              CommonTextPoppins(
                                '${controller.shipInfoModel.value.totals?.quoteCurrencyCode ?? ''} ${totalSegmentsItem?.value?.toString() ?? '0'}',
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
                  color: appBorderColor,
                  height: 1.0,
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
                                controller.getTotalsData.value
                                            .getDiscountName() ==
                                        null
                                    ? '${LanguageConstants.discount.tr}(${controller.couponCodeController.text})'
                                    : controller.getTotalsData.value
                                        .getDiscountName()!,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.left,
                                color: appColorButton,
                              ),
                              CommonTextPoppins(
                                controller.getTotalsData.value.getDiscount() ??
                                    '',
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
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.left,
                    ),
                    Obx(
                      () {
                        return CommonTextPoppins(
                          controller.getTotalsData.value.getGrandTotal() ?? '',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Obx(() => controller.isEnabledPlaceOrder.value
                    ? Align(
                        alignment: Alignment.center,
                        child: CommonThemeButton(
                          onTap: () async {
                            controller.placeOrder(context);
                          },
                          title: LanguageConstants.placeOrderText.tr,
                        ),
                      )
                    : Container())
              ],
            ),
    );
  }
}
