import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart'
    as ship;
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_divider.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_field.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/colors.dart';

class CheckoutOrderSummary extends GetView<CheckoutOrderController> {
  final CartModel? cartlist;

  const CheckoutOrderSummary({Key? key, this.cartlist}) : super(key: key);

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
        Obx(() => InkWell(
          onTap: () {
            controller.isShowItems.value = !controller.isShowItems.value;
          },
          child: Column(
            children: [
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
                              width: 110,
                              height: 110,
                              padding: const EdgeInsets.only(
                                bottom: 15,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
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
                                      ],
                                    ),
                                  ),
                                  shipItem?.extensionAttributes?.productImage != null
                                      ? CachedNetworkImage(
                                    width: 65,
                                    fit: BoxFit.cover,
                                    imageUrl: shipItem?.extensionAttributes?.productImage ?? '',
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
                                    CommonTextPoppins(
                                      shipItem?.name,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.left,
                                      maxLine: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                                          localStore.setItemPriceWithSymbol(
                                              shipItem?.rowTotalInclTax.toString() ?? '',
                                              shipItem?.baseRowTotalInclTax.toString() ?? ''),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.left,
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
        const SizedBox(
          height: 10.0,
        ),
        CommonDivider(
          width: Get.width,
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 40.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: CommonTextField(
                  hintText: LanguageConstants.enterDiscountCodeText.tr,
                  controller: controller.couponCodeController,
                  isValidationShow: false,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 30,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: appColorPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    controller.couponEnable();
                  },
                  child: HeadlineBodyOneBaseWidget(
                    title: controller.showAppliedCoupons.value
                        ? LanguageConstants.cancelCoupon.tr
                        : LanguageConstants.apply.tr,
                    titleColor: Colors.white,
                    fontFamily: AppConstants.fontPoppins,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
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
        CommonDivider(
          height: 1.0,
          width: Get.width,
        ),
        const SizedBox(
          height: 20.0,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.shipInfoModel.value.totals?.totalSegments?.length ?? 0,
            itemBuilder: (context, index) {
              ship.TotalSegments? totalSegmentsItem = controller.shipInfoModel.value.totals?.totalSegments?[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CommonTextPoppins(
                          '${totalSegmentsItem?.title}',
                          fontSize: 11.0,
                          maxLine: 2,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CommonTextPoppins(
                        '${controller.shipInfoModel.value.totals?.quoteCurrencyCode ?? ''} ${totalSegmentsItem?.value?.toString() ?? '0'}',
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
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
          width: Get.width,
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
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.left,
                  color: brownColor,
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
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.left,
            ),
            Obx(
                  () {
                return CommonTextPoppins(
                  controller.getTotalsData.value.getGrandTotal() ?? '',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Obx(
              () => controller.isEnabledPlaceOrder.value
              ? Align(
            alignment: Alignment.center,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: appColorPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                controller.placeOrder(cartlist, context);
              },
              child: HeadlineBodyOneBaseWidget(
                title: LanguageConstants.placeOrderText.tr,
                titleColor: Colors.white,
                fontFamily: AppConstants.fontPoppins,
                fontSize: 14,
              ),
            ),
          )
              : Container(),
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
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: const Color(0xFFF9EAE3),
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
                              color: Colors.black,
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
