import 'package:brandslabels/app/controller/checkout_order_controller.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_divider.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
    // return name.split(" ").map((str) => str[0].toUpperCase() + str.substring(1)).join(" ");
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
                  SizedBox(
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonTextPoppins(
                          "${controller.shipInfoModel.value.totals?.itemsQty} ${LanguageConstants.itemInCartText.tr}",
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                        Image.asset(
                          AppAsset.upArrow,
                          width: 18.0,
                          height: 18.0,
                          color: Colors.black,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  CommonDivider(
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
                            ship.Items? shipItem =
                                controller.shipInfoModel.value.totals?.items?[index];
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        width: .5,
                                        color: Colors.black,
                                      )),
                                      child: Center(
                                        child: CachedNetworkImage(
                                          width: 70,
                                          height: 80,
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              shipItem?.extensionAttributes?.productImage ?? '',
                                          progressIndicatorBuilder:
                                              (context, url, downloadProgress) => Lottie.asset(
                                            AppAsset.loaderJson,
                                            width: 65,
                                          ),
                                          errorWidget: (context, url, error) => Image(
                                            image: AssetImage(AppAsset.logo),
                                          ),
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
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                            textAlign: TextAlign.left,
                                            maxLine: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 30),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CommonTextPoppins(
                                                    "${LanguageConstants.qtyText.tr}:",
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w500,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                    ),
                                                    padding: const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        width: 1.0,
                                                      ),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: CommonTextPoppins(
                                                      "${shipItem?.qty}",
                                                      fontSize: 11.0,
                                                      fontWeight: FontWeight.w500,
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  )
                                                ],
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
          height: 20.0,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGrey)),
          height: 40.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                height: 40.w,
                width: 80.w,
                child: CommonThemeButton(
                  borderRadius: 12,
                  onTap: () {
                    controller.couponEnable();
                  },
                  title: controller.showAppliedCoupons.value ? 'Remove' : 'Apply',
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 40.0,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       SizedBox(
        //         height: 40,
        //         width: 200,
        //         child: CommonTextField(
        //           textColor: Colors.grey,
        //           hintText: LanguageConstants.enterDiscountCodeText.tr,
        //           controller: controller.couponCodeController,
        //           isValidationShow: false,
        //           textFieldBorder: Border.all(color: Colors.black),
        //         ),
        //       ),
        //       const SizedBox(
        //         width: 10.0,
        //       ),
        //       SizedBox(
        //         height: 40.0,
        //         child: CommonButton(
        //           padding: const EdgeInsets.symmetric(
        //             horizontal: 5.0,
        //           ),
        //           buttonType: ButtonType.ElevatedButton,
        //           onPressed: () {
        //             controller.couponEnable();
        //           },
        //           elevation: 0.0,
        //           color: appButtonColor,
        //           borderRadius: 0.0,
        //           child: CommonTextPoppins(
        //             controller.showAppliedCoupons.value
        //                 ? LanguageConstants.cancelCoupon.tr
        //                 : LanguageConstants.apply.tr,
        //             fontSize: 14.0,
        //             fontWeight: FontWeight.w500,
        //             color: Colors.white,
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
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
              fontSize: 15.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        CommonDivider(
          color: borderGrey,
          width: Get.width,
        ),
        const SizedBox(
          height: 25.0,
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
              ship.TotalSegments? totalSegmentsItem =
                  controller.getTotalsData.value.totalSegments?[index];
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
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CommonTextPoppins(
                        controller.getTotalSegmentValues(totalSegmentsItem),
                        fontSize: 10.0,
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
          color: borderGrey,
          width: Get.width,
        ),
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
            CommonTextPoppins(
              controller.getTotalsData.value.getGrandTotal() ?? '',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.left,
            ),
          ],
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
            textFieldBorder: Border.all(
              color: borderGrey,
            ),
            isValidationShow: false,
            textColor: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Obx(
          () => controller.isEnabledPlaceOrder.value
              ? Align(
                  alignment: Alignment.center,
                  child: CommonThemeButton(
                    onTap: () async {
                      controller.placeOrder(context, cartlist);
                    },
                    title: firstCapitalize(LanguageConstants.placeOrderText.tr),
                  ),
                )
              : Container(),
        ),
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
          backgroundColor: Colors.white,
          radius: 30,
          contentWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    LanguageConstants.allCouponsList.tr,
                    style: AppTextStyle.textStyleUtils400(size: 15),
                  ),
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
