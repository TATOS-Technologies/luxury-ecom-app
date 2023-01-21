import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../controller/order_details_controller.dart';

class OrderDetailsScreen extends GetView<OrderDetailsController> {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(color: appBGColor),
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: Color(0xff367587),
                    ),
                  )
                : Column(
                    children: [
                      SafeArea(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, top: 20.0, bottom: 10),
                              child: Icon(
                                Icons.arrow_back,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: LanguageConstants.orderIdTitle.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                            size: 15.0),
                                      ),
                                      TextSpan(
                                        text: controller
                                                .myOrdersDataItem?.incrementId
                                                ?.toString() ??
                                            '',
                                        style: AppTextStyle.textStyleUtils500(
                                            size: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  LanguageConstants.orderContain.tr,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 15.0),
                                ),
                                const SizedBox(height: 15),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            LanguageConstants.orderDateTitle.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                            size: 18.0),
                                      ),
                                      TextSpan(
                                        text: controller.getCreatedDate(),
                                        style: AppTextStyle.textStyleUtils400(
                                            size: 18.0),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: LanguageConstants
                                            .expectedShippingDate.tr,
                                        style:
                                            AppTextStyle.textStyleUtils400_16(),
                                      ),
                                      TextSpan(
                                        text: controller.getEstimatedShipping(),
                                        style:
                                            AppTextStyle.textStyleUtils400_16(),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10.w, right: 10.w),
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
                                          child: Row(
                                            children: [
                                              Text(
                                                LanguageConstants.itemText.tr,
                                                style: AppTextStyle
                                                    .textStyleUtils500(
                                                        color: primary,
                                                        size: 14.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      ListView.separated(
                                        itemCount: controller.myOrdersDataItem
                                                ?.items?.length ??
                                            0,
                                        shrinkWrap: true,
                                        primary: false,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: Get.width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(20.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: controller
                                                                  .getProductImage(
                                                                      index),
                                                              fit: BoxFit.cover,
                                                              height: 100.w,
                                                              width: 95.w,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 15.w,
                                                          ),
                                                          Expanded(
                                                              child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                controller
                                                                    .getItemNameCapitalizeFirst(
                                                                        index),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: AppTextStyle
                                                                    .textStyleUtils500(
                                                                        size: 14
                                                                            .sp),
                                                              ),
                                                              SizedBox(
                                                                height: 8.w,
                                                              ),
                                                              RichText(
                                                                text: TextSpan(
                                                                  text: LanguageConstants
                                                                      .quantity
                                                                      .tr,
                                                                  style: AppTextStyle
                                                                      .textStyleUtils400(
                                                                          size:
                                                                              12.sp),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                        text:
                                                                            ' : ',
                                                                        style: AppTextStyle.textStyleUtils400(
                                                                            size:
                                                                                12.sp)),
                                                                    TextSpan(
                                                                        text: controller.getQtyOrdered(
                                                                            index),
                                                                        style: AppTextStyle.textStyleUtils400(
                                                                            size:
                                                                                12.sp)),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 8.w,
                                                              ),
                                                              RichText(
                                                                text: TextSpan(
                                                                  text:
                                                                      LanguageConstants
                                                                          .price
                                                                          .tr,
                                                                  style: AppTextStyle
                                                                      .textStyleUtils400(
                                                                          size:
                                                                              12.sp),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                        text:
                                                                            ' : ',
                                                                        style: AppTextStyle.textStyleUtils400(
                                                                            size:
                                                                                12.sp)),
                                                                    TextSpan(
                                                                        text: controller.getProductPrice(
                                                                            index),
                                                                        style: AppTextStyle.textStyleUtils400(
                                                                            size:
                                                                                12.sp)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ))
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 12.w,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            LanguageConstants
                                                                .subTotal.tr,
                                                            style: AppTextStyle
                                                                .textStyleUtils500(),
                                                          ),
                                                          Text(
                                                            controller.rawTotal(
                                                                index),
                                                            style: AppTextStyle
                                                                .textStyleUtils400(),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 15.w),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CommonThemeButton(
                                                            onTap: () {
                                                              controller
                                                                  .returnOnTap(
                                                                      index);
                                                            },
                                                            title: LanguageConstants
                                                                .returnItemText
                                                                .tr,
                                                          ),
                                                          SizedBox(
                                                            width: 30.w,
                                                          ),
                                                          CommonThemeButton(
                                                            onTap: () {
                                                              controller
                                                                  .cancelOnTap(
                                                                      index);
                                                            },
                                                            title:
                                                                LanguageConstants
                                                                    .cancel.tr,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return (controller
                                                      .myOrdersDataItem
                                                      ?.items?[index]
                                                      .parentItemId ==
                                                  null)
                                              ? const SizedBox(height: 15)
                                              : const SizedBox();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                CommonThemeButton(
                                  onTap: () {
                                    controller
                                        .showOrderTrackingDialogBox(context);
                                  },
                                  title: LanguageConstants.trackOrderText.tr,
                                ),
                                const SizedBox(
                                  height: 45,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10.w, right: 10.w),
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
                                            LanguageConstants.shippingAddress.tr,
                                            style: AppTextStyle
                                                .textStyleUtils500(
                                                    color: primary,
                                                    size: 14.sp),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.all(20.w),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            controller.getShippingAssignments(),
                                            style:
                                                AppTextStyle.textStyleUtils400_16(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10.w, right: 10.w),
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
                                            LanguageConstants.billingAddress.tr,
                                            style: AppTextStyle
                                                .textStyleUtils500(
                                                    color: primary,
                                                    size: 14.sp),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.all(20.w),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                             "${controller.myOrdersDataItem?.billingAddress?.street![0]},\n\n${controller.myOrdersDataItem?.billingAddress?.city}, ${controller.myOrdersDataItem?.billingAddress?.postcode}\n\n${controller.myOrdersDataItem?.billingAddress?.countryId}\n\nT:${controller.myOrdersDataItem?.billingAddress?.telephone}",
                                            style:
                                                AppTextStyle.textStyleUtils400_16(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10.w, right: 10.w),
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
                                            LanguageConstants.paymentMethod.tr,
                                            style: AppTextStyle
                                                .textStyleUtils500(
                                                    color: primary,
                                                    size: 14.sp),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.all(20.w),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            controller
                                              .myOrdersDataItem?.payment?.method
                                              ?.toString() ??
                                          '',
                                            style:
                                                AppTextStyle.textStyleUtils400_16(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                
                                const SizedBox(height: 40),
                                CommonThemeButton(
                                  onTap: () {
                                    Get.offAllNamed(
                                      RoutesConstants.dashboardScreen,
                                    );
                                  },
                                  title: LanguageConstants.continueShopping.tr
                                      .toUpperCase(),
                                ),
                                SizedBox(
                                  height: 30.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
