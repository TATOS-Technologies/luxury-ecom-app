// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import 'package:meta_package/translations/translations.dart';

import 'package:solo_luxury/app/controller/order_confirmation/order_confirmation_controller.dart';
import 'package:solo_luxury/app/core/utils/app_routes.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/theme/app_text_style.dart';
import 'package:solo_luxury/app/theme/colors.dart';

import '../../../core/const/app_style.dart';

class OrderConfirmationPage extends GetView<OrderConfirmationController> {
  const OrderConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        Address address = controller.extensionAttributes.value
                .shippingAssignments?.first.shipping?.address ??
            Address();
        return Scaffold(
          key: controller.scaffoldkey,
          backgroundColor: homeBackground,
          appBar: AppBar(
            title: Text(
              LanguageConstants.myOrdersText.tr,
              style: AppStyle.textStyleUtils500_16(),
            ),
            leading: InkWell(
              onTap: () {
                Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 24.0,
              ),
            ),
            elevation: 0,
            backgroundColor: backGroundColor,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: appColor,
                    // size: 50.0,
                  ),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Text(
                        LanguageConstants.orderConfirm.tr,
                        textAlign: TextAlign.center,
                        style: AppStyle.textStyleUtils600(size: 18),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LanguageConstants.orderIdTitle.tr,
                              style: AppStyle.textStyleUtils400_16(),
                            ),
                            TextSpan(
                              text: controller.orderConfirmationModel.value
                                      .incrementId ??
                                  ''.toString(),
                              style: AppStyle.textStyleUtils400_16(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                          color: homeBackground,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: appTileBorderColor, width: 2),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              height: 40.w,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: appTileBGcolor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  )),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  LanguageConstants.itemOrder.tr,
                                  style: AppStyle.textStyleUtils400(
                                      size: 14.sp, color: primary),
                                ),
                              ),
                            ),
                            const Divider(
                              color: appTileBorderColor,
                              height: 2,
                              thickness: 2,
                            ),
                            ListView.builder(
                              itemCount: controller.items.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return (controller.items[index].parentItemId ==
                                        null)
                                    ? Padding(
                                        padding: EdgeInsets.all(15.w),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Container(
                                                    height: 105,
                                                    width: 100,
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Image.network(
                                                      controller
                                                          .items[index]
                                                          .extensionAttributess!
                                                          .productImage!,
                                                      height: 100.w,
                                                      width: 95.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Expanded(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                              .items[index].name
                                                              .toString()
                                                              .capitalizeFirst ??
                                                          '',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppTextStyle
                                                          .textStyleUtils500(
                                                              size: 14.sp),
                                                    ),
                                                    SizedBox(
                                                      height: 8.w,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: LanguageConstants
                                                            .quantity.tr,
                                                        style: AppTextStyle
                                                            .textStyleUtils400(
                                                                size: 12.sp),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: ' : ',
                                                              style: AppTextStyle
                                                                  .textStyleUtils400(
                                                                      size: 12
                                                                          .sp)),
                                                          TextSpan(
                                                              text: controller
                                                                  .items[index]
                                                                  .qtyOrdered
                                                                  .toString(),
                                                              style: AppTextStyle
                                                                  .textStyleUtils400(
                                                                      size: 12
                                                                          .sp)),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8.w,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: LanguageConstants
                                                            .price.tr,
                                                        style: AppTextStyle
                                                            .textStyleUtils400(
                                                                size: 12.sp),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: ' : ',
                                                              style: AppTextStyle
                                                                  .textStyleUtils400(
                                                                      size: 12
                                                                          .sp)),
                                                          TextSpan(
                                                              text:
                                                                  '${controller.orderConfirmationModel.value.orderCurrencyCode ?? ''} ${controller.items[index].price?.toString() ?? ''}',
                                                              style: AppTextStyle
                                                                  .textStyleUtils400(
                                                                      size: 12
                                                                          .sp)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  LanguageConstants.subTotal.tr,
                                                  style: AppTextStyle
                                                      .textStyleUtils400(
                                                          size: 12.sp),
                                                ),
                                                Text(
                                                  '${controller.orderConfirmationModel.value.orderCurrencyCode ?? ''} ${controller.items[index].rowTotal?.toString() ?? ''}',
                                                  style: AppStyle
                                                      .textStyleUtils400(
                                                          size: 12.sp),
                                                )
                                              ],
                                            ),
                                            // Container(
                                            //   padding: const EdgeInsets.symmetric(
                                            //     horizontal: 20,
                                            //     vertical: 20,
                                            //   ),
                                            //   margin: const EdgeInsets.symmetric(
                                            //     horizontal: 20,
                                            //   ),
                                            //   decoration: BoxDecoration(
                                            //     color: homeBackground,
                                            //     boxShadow: [
                                            //       BoxShadow(
                                            //         color: blackColor.withOpacity(0.25),
                                            //         blurRadius: 8,
                                            //       ),
                                            //     ],
                                            //   ),
                                            //   child: Column(
                                            //     children: [
                                            //       Container(
                                            //         height: 100,
                                            //         width: 100,
                                            //         padding: const EdgeInsets.all(8),
                                            //         decoration: BoxDecoration(
                                            //           border: Border.all(
                                            //             color: wishListBorder,
                                            //             width: 1.4,
                                            //           ),
                                            //         ),
                                            //         child: Column(
                                            //           mainAxisSize: MainAxisSize.min,
                                            //           children: [
                                            //             Row(
                                            //               mainAxisAlignment:
                                            //                   MainAxisAlignment
                                            //                       .spaceBetween,
                                            //               children: [
                                            //                 Image.asset(
                                            //                   AppAsset.logo,
                                            //                   width: 35,
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //             const SizedBox(height: 10),
                                            //             Image.network(
                                            //               controller
                                            //                   .items[index]
                                            //                   .extensionAttributess!
                                            //                   .productImage!,
                                            //               height: 60,
                                            //               fit: BoxFit.cover,
                                            //             ),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //       const SizedBox(height: 10),
                                            //       Text(
                                            //         controller.items[index].name
                                            //                 .toString()
                                            //                 .capitalizeFirst ??
                                            //             '',
                                            //         style: AppStyle.textStyleUtils400(
                                            //             size: 20),
                                            //       ),
                                            //       const SizedBox(height: 30),
                                            //       Row(
                                            //         mainAxisAlignment:
                                            //             MainAxisAlignment.spaceBetween,
                                            //         children: [
                                            //           Text(
                                            //             LanguageConstants.price.tr,
                                            //             style:
                                            //                 AppStyle.textStyleUtils400(
                                            //               size: 15,
                                            //               color: unselectedTabColor,
                                            //             ),
                                            //           ),
                                            //           Text(
                                            //             "       ${LanguageConstants.quantity.tr}",
                                            //             style:
                                            //                 AppStyle.textStyleUtils400(
                                            //               size: 15,
                                            //               color: unselectedTabColor,
                                            //             ),
                                            //           ),
                                            //           Text(
                                            //             LanguageConstants.subTotal.tr,
                                            //             style:
                                            //                 AppStyle.textStyleUtils400(
                                            //               size: 15,
                                            //               color: unselectedTabColor,
                                            //             ),
                                            //           )
                                            //         ],
                                            //       ),
                                            //       const Divider(
                                            //         height: 9,
                                            //         color: appTileBGcolor,
                                            //         thickness: 1,
                                            //       ),
                                            //       Row(
                                            //         mainAxisAlignment:
                                            //             MainAxisAlignment.spaceBetween,
                                            //         children: [
                                            //           Text(
                                            //             '${controller.orderConfirmationModel.value.orderCurrencyCode ?? ''} ${controller.items[index].price?.toString() ?? ''}',
                                            //             style: AppStyle
                                            //                 .textStyleUtils400(),
                                            //           ),
                                            //           Text(
                                            //             controller
                                            //                 .items[index].qtyOrdered
                                            //                 .toString(),
                                            //             style: AppStyle
                                            //                 .textStyleUtils400(),
                                            //           ),
                                            //           Text(
                                            //             '${controller.orderConfirmationModel.value.orderCurrencyCode ?? ''} ${controller.items[index].rowTotal?.toString() ?? ''}',
                                            //             style: AppStyle
                                            //                 .textStyleUtils400(),
                                            //           )
                                            //         ],
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            // const SizedBox(height: 30),
                                          ],
                                        ),
                                      )
                                    : const SizedBox();
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(color: homeBackground),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LanguageConstants.expectedDate.tr,
                                    style: AppStyle.textStyleUtils400(size: 13),
                                  ),
                                  Text(
                                    LanguageConstants.orderDate.tr,
                                    style: AppStyle.textStyleUtils400(size: 13),
                                  ),
                                ]),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.extensionAttributes.value
                                          .estimatedShipping ??
                                      '',
                                  style: AppStyle.textStyleUtils400(size: 15),
                                ),
                                controller.orderConfirmationModel.value
                                            .createdAt !=
                                        null
                                    ? Text(
                                        DateFormat.yMMMMd().format(
                                          DateTime.parse(
                                            controller.orderConfirmationModel
                                                    .value.createdAt
                                                    ?.toString() ??
                                                '',
                                          ),
                                        ),
                                        style: AppStyle.textStyleUtils400(
                                            size: 15),
                                      )
                                    : const SizedBox()
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      CommonThemeButton(
                        onTap: () {
                          controller.showOrderTrackingDialogBox(context);
                        },
                        title: LanguageConstants.trackOrderText.tr,
                      ),
                      SizedBox(height: 4.h),
                      OrderAddressTile(
                        title: LanguageConstants.shippingAddressText.tr,
                        child: Text(
                              "${address.street?[0] ?? ''}\n\n${address.city ?? ''}, ${address.region ?? ''}, ${address.postcode ?? ''}\n\nT: ${address.telephone ?? ''}",
                              style: AppStyle.textStyleUtils400(),
                            ),
                      ),
                      OrderAddressTile(
                        title: LanguageConstants.billingAddress.tr,
                        child:  Text(
                              "${controller.billingAddress.value.street?[0] ?? ''}\n\n${controller.billingAddress.value.city}, ${controller.billingAddress.value.region}, ${controller.billingAddress.value.postcode}\n\nT: ${controller.billingAddress.value.telephone}",
                              style: AppStyle.textStyleUtils400(),
                            ),
                      ),
                      OrderAddressTile(
                        title: LanguageConstants.paymentMethod.tr,
                        child: Text(
                              controller.additionalInformation(),
                              style: AppStyle.textStyleUtils400(),
                            ),
                      ),
                      CommonThemeButton(
                        onTap: () {
                          Get.offAllNamed<dynamic>(
                              RoutesConstants.dashboardScreen);
                        },
                        title:
                              LanguageConstants.continueShopping.tr,
                             
                              
                       
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class OrderAddressTile extends StatelessWidget {
  final String title;
  final Widget child;
  const OrderAddressTile({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: homeBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: appTileBorderColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: appTileBGcolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: CommonTextPoppins(title,
                    fontSize: 14.sp,
                    color: appColorPrimary,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: child,
          )
        ],
      ),
    );
  }
}
