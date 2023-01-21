// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart' as ship;
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_divider.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class OrderSummary extends GetView<CheckoutOrderController> {
  OrderSummary({Key? key}) : super(key: key);

  @override
  final CheckoutOrderController controller = Get.find();
  CartModel? cartList = Get.arguments is CartModel ? Get.arguments as CartModel : null;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.shipInfoModel.value.totals == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => InkWell(
                    onTap: () {
                      controller.isShowItems.value = !controller.isShowItems.value;
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextMontserrat(
                                "${controller.shipInfoModel.value.totals?.itemsQty} ${LanguageConstants.itemInCartText.tr}",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.left,
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
                        CommonDivider(
                          color: textFieldBoarderColor,
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
                                itemCount: controller.shipInfoModel.value.totals?.items?.length ?? 0,
                                itemBuilder: (context, index) {
                                  ship.Items? shipItem = controller.shipInfoModel.value.totals?.items?[index];
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 85,
                                            color: Colors.yellow,
                                            width: 85,
                                            child: shipItem?.extensionAttributes?.productImage != null
                                                ? Image.network(
                                                    shipItem?.extensionAttributes!.productImage ?? '',
                                                    errorBuilder: (
                                                      BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace,
                                                    ) {
                                                      return Container();
                                                    },
                                                    width: 85,
                                                  )
                                                : Image.asset(AppAsset.logo, height: 85.0, width: 85.0),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: 85.0,
                                              width: Get.width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CommonTextMontserrat(
                                                    "${shipItem?.name}",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    textAlign: TextAlign.left,
                                                    maxLine: 3,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  CommonTextMontserrat(
                                                    "${LanguageConstants.qtyText.tr}: ${shipItem?.qty}",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  CommonTextMontserrat(
                                                    localStore.setItemPriceWithSymbol(
                                                        shipItem?.rowTotalInclTax.toString() ?? '',
                                                            shipItem
                                                                ?.baseRowTotalInclTax.toString() ?? ''),
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  );
                                }),
                        const SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  )),
              CommonDivider(
                color: textFieldBoarderColor,
                width: Get.width,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color:
                                                          textFieldBoarderColor)),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: 35.w,
                                                      child: TextFormField(
                                                        cursorColor: blackColor,
                                                        controller: controller.couponCodeController,
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          fillColor:
                                                              Colors.transparent,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .only(
                                                            bottom: 10,
                                                            top: 10,
                                                            left: 10,
                                                          ),
                                                          hintText: LanguageConstants
                                                              .enterDiscountCodeText
                                                              .tr,
                                                          hintStyle: AppStyle
                                                              .textStyleUtils400(
                                                            color: Colors.grey,
                                                          ),
                                                          labelStyle: AppTextStyle
                                                              .textStyleUtils400(
                                                                  color: Colors
                                                                      .black54),
                                                          errorStyle: AppTextStyle
                                                              .textStyleUtils400(),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    0.0,
                                                                  ),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    0.0,
                                                                  ),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none),
                                                          suffixIcon: null,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide.none,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              0.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 35.w,
                                                    width: 112.w,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            elevation: 0,
                                                            backgroundColor:
                                                                blackColor,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12))),
                                                        onPressed: () {
                                                         controller.couponEnable();
                                                        },
                                                        child: CommonTextPoppins(
                                                          controller
                                                                  .showAppliedCoupons
                                                                  .value
                                                              ? LanguageConstants
                                                                  .removeCoupon.tr
                                                              : LanguageConstants
                                                                  .applyText.tr,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),

              const SizedBox(
                height: 8.0,
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
                    color: blackColor,
                    fontSize: 14.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CommonDivider(
                color: textFieldBoarderColor,
                height: 1.0,
                width: Get.width,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  // itemCount: controller.shipInfoModel?.value.totals?.totalSegments?.length,
                  itemCount: controller.getTotalsData.value.totalSegments?.length ?? 0,
                  itemBuilder: (context, index) {
                    // TotalSegments totalSegmentsItem = controller.shipInfoModel?.value.totals?.totalSegments?[index];
                    ship.TotalSegments? totalSegmentsItem = controller.getTotalsData.value.totalSegments?[index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CommonTextMontserrat(
                                '${totalSegmentsItem?.title}',
                                fontSize: 12.sp,
                                maxLine: 2,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            CommonTextMontserrat(
                              '${controller.shipInfoModel.value.totals?.quoteCurrencyCode ?? ''} ${totalSegmentsItem?.value?.toString() ?? '0'}',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    );
                  }),
              const SizedBox(
                height: 10.0,
              ),
              CommonDivider(
                color: textFieldBoarderColor,
                height: 1.0,
                width: Get.width,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonTextMontserrat(
                    LanguageConstants.orderTotalText.tr,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.left,
                  ),
                  CommonTextMontserrat(
                    controller.getTotalsData.value.getGrandTotal() ?? '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
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
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.left,
                              color: blackColor,
                            ),
                            CommonTextPoppins(
                              controller.getTotalsData.value.getDiscount() ?? '',
                              fontSize: 14.sp,
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
              Obx(() => controller.isEnabledPlaceOrder.value
                  ? Align(
                      alignment: Alignment.center,
                      child: CommonThemeButton(
                        title: LanguageConstants.placeOrderText.tr,

                        onTap: () async {
                          await controller.placeOrder(cartList);
                        },
                      ),
                    )
                  : Container())
            ],
          ));
  }

  void showAllCouponsList() {
    showDialog<dynamic>(
      context: Get.context!,
      builder: (context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: Colors.white,
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
