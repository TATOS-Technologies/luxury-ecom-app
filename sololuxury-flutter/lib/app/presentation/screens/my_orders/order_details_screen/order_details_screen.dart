// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../core/const/app_style.dart';

class OrderDetailsScreen extends GetView<OrderDetailsController> {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyOrdersDataItem? argumentData12 = Get.arguments[1] as MyOrdersDataItem;

    List<ParentItemElement> argumentData = argumentData12.items ?? [];

    return Obx(
      () => Scaffold(
        backgroundColor: homeBackground,
        appBar: commonAppbar(),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                ),
              )
            : SingleChildScrollView(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: LanguageConstants.orderIdTitle.tr,
                            style: AppStyle.textStyleUtils400_16(),
                          ),
                          TextSpan(
                            text: argumentData12.incrementId?.toString() ?? '',
                            style: AppStyle.textStyleUtils500_16(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: appTileBorderColor, width: 2)),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            height: 40.w,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: appTileBGcolor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(11),
                                  topRight: Radius.circular(11),
                                )),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                LanguageConstants.itemOrder.tr,
                                style: AppStyle.textStyleUtils500(
                                    size: 14.sp, color: primary),
                              ),
                            ),
                          ),
                          ListView.separated(
                            itemCount: argumentData.length,
                            shrinkWrap: true,
                            primary: false,
                            separatorBuilder: (context, index) =>
                                (argumentData[index].parentItemId == null)
                                    ? const Divider(
                                        color: appTileBorderColor,
                                        height: 2,
                                        thickness: 2,
                                      )
                                    : const SizedBox(),
                            itemBuilder: (context, index) {
                              return (argumentData[index].parentItemId == null)
                                  ? Padding(
                                      padding: EdgeInsets.all(15.w),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: CachedNetworkImage(
                                                      imageUrl: argumentData[
                                                                  index]
                                                              .extensionAttributess
                                                              ?.productImage ??
                                                          '',
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
                                                        argumentData[index]
                                                            .name
                                                            .toString(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AppTextStyle
                                                            .textStyleUtils500(
                                                                size: 14.sp),
                                                      ),
                                                      SizedBox(
                                                        height: 8.w,
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          text:
                                                              LanguageConstants
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
                                                                text: argumentData[
                                                                        index]
                                                                    .qtyOrdered
                                                                    ?.toString(),
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
                                                          text:
                                                              LanguageConstants
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
                                                                text: argumentData[
                                                                            index]
                                                                        .price
                                                                        ?.toString() ??
                                                                    '',
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
                                              const SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CommonTextPoppins(
                                                    LanguageConstants
                                                        .subTotal.tr,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  CommonTextPoppins(
                                                    argumentData[index]
                                                            .rowTotal
                                                            ?.toString() ??
                                                        '',
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: primary,
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 20.w),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CommonThemeButton(
                                                    buttonColor: primary,
                                                    onTap: () {
                                                      if ((argumentData[index]
                                                                  .extensionAttributess
                                                                  ?.isReturnable ??
                                                              '0') ==
                                                          '1') {
                                                        controller
                                                            .ordersController
                                                            .showReturnReasonSelectionDialog(
                                                          fromItem: true,
                                                          order: argumentData[
                                                              index],
                                                        );
                                                      } else {
                                                        controller
                                                            .ordersController
                                                            .createTicketForReturnDialog(
                                                          order: argumentData[
                                                              index],
                                                          fromItem: true,
                                                        );
                                                      }
                                                    },
                                                    title: LanguageConstants
                                                        .returnItemText.tr,
                                                  ),
                                                  SizedBox(
                                                    width: 30.w,
                                                  ),
                                                  CommonThemeButton(
                                                    buttonColor: primary,
                                                    onTap: () {
                                                      if ((argumentData[index]
                                                                  .extensionAttributess
                                                                  ?.isCancellable ??
                                                              '0') ==
                                                          '1') {
                                                        controller
                                                            .ordersController
                                                            .showDialogBoxOpen(
                                                          fromItem: true,
                                                          order: argumentData[
                                                              index],
                                                        );
                                                      } else {
                                                        controller
                                                            .ordersController
                                                            .createTicketDialog(
                                                          order: argumentData[
                                                              index],
                                                          fromItem: true,
                                                        );
                                                      }
                                                    },
                                                    title: LanguageConstants
                                                        .cancel.tr,
                                                  )
                                                ],
                                              ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment
                                              //           .spaceBetween,
                                              //   children: [
                                              //     Text(
                                              //       LanguageConstants.price.tr,
                                              //       style: AppStyle
                                              //           .textStyleUtils400(
                                              //         size: 15,
                                              //         color: unselectedTabColor,
                                              //       ),
                                              //     ),
                                              //     Text(
                                              //       LanguageConstants.quantity.tr,
                                              //       style: AppStyle
                                              //           .textStyleUtils400(
                                              //         size: 15,
                                              //         color: unselectedTabColor,
                                              //       ),
                                              //     ),
                                              //     Text(
                                              //       LanguageConstants.subTotal.tr,
                                              //       style: AppStyle
                                              //           .textStyleUtils400(
                                              //         size: 15,
                                              //         color: unselectedTabColor,
                                              //       ),
                                              //     ),
                                              //     Text(
                                              //       LanguageConstants
                                              //           .actionText.tr,
                                              //       style: AppStyle
                                              //           .textStyleUtils400(
                                              //         size: 15,
                                              //         color: unselectedTabColor,
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment
                                              //           .spaceBetween,
                                              //   children: [
                                              //     Text(
                                              //       argumentData[index]
                                              //               .price
                                              //               ?.toString() ??
                                              //           '',
                                              //       style: AppStyle
                                              //           .textStyleUtils400(),
                                              //     ),
                                              //     const SizedBox(
                                              //       width: 15,
                                              //     ),
                                              //     Text(
                                              //       argumentData[index]
                                              //               .qtyOrdered
                                              //               ?.toString() ??
                                              //           '',
                                              //       style: AppStyle
                                              //           .textStyleUtils400(),
                                              //     ),
                                              //     const SizedBox(
                                              //       width: 10,
                                              //     ),
                                              //     Row(
                                              //       mainAxisSize:
                                              //           MainAxisSize.min,
                                              //       children: [
                                              //         Text(
                                              //           argumentData[index]
                                              //                   .rowTotal
                                              //                   ?.toString() ??
                                              //               '',
                                              //           style: AppStyle
                                              //               .textStyleUtils400(),
                                              //         ),
                                              //         const SizedBox(
                                              //           width: 10,
                                              //         ),
                                              //         Text(
                                              //           argumentData12
                                              //                   .storeCurrencyCode
                                              //                   ?.toString() ??
                                              //               '',
                                              //           style: AppStyle
                                              //               .textStyleUtils400(),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //     Column(
                                              //       mainAxisSize:
                                              //           MainAxisSize.min,
                                              //       children: [
                                              //         GestureDetector(
                                              //           onTap: () {
                                              //             if ((argumentData[index]
                                              //                         .extensionAttributess
                                              //                         ?.isReturnable ??
                                              //                     '0') ==
                                              //                 '1') {
                                              //               controller
                                              //                   .ordersController
                                              //                   .showReturnReasonSelectionDialog(
                                              //                 fromItem: true,
                                              //                 order: argumentData[
                                              //                     index],
                                              //               );
                                              //             } else {
                                              //               controller
                                              //                   .ordersController
                                              //                   .createTicketForReturnDialog(
                                              //                 order: argumentData[
                                              //                     index],
                                              //                 fromItem: true,
                                              //               );
                                              //             }
                                              //           },
                                              //           child: Container(
                                              //             color:
                                              //                 Colors.transparent,
                                              //             child: Row(
                                              //               children: [
                                              //                 Icon(
                                              //                   Icons.reply,
                                              //                   size: 20,
                                              //                   color: (argumentData[index]
                                              //                                   .extensionAttributess
                                              //                                   ?.isReturnable ??
                                              //                               '0') ==
                                              //                           '1'
                                              //                       ? appColor
                                              //                           .withOpacity(
                                              //                               0.6)
                                              //                       : Colors.grey,
                                              //                 ),
                                              //                 const SizedBox(
                                              //                   width: 4,
                                              //                 ),
                                              //                 Text(
                                              //                   LanguageConstants
                                              //                       .returnsContactText
                                              //                       .tr,
                                              //                   style: AppStyle
                                              //                       .textStyleUtils400(
                                              //                     color: (argumentData[index].extensionAttributess?.isReturnable ??
                                              //                                 '0') ==
                                              //                             '1'
                                              //                         ? appColor
                                              //                             .withOpacity(
                                              //                                 0.6)
                                              //                         : Colors
                                              //                             .grey,
                                              //                   ),
                                              //                 ),
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //         const SizedBox(
                                              //           height: 10,
                                              //         ),
                                              //         //!
                                              //         GestureDetector(
                                              //           onTap: () {
                                              //             if ((argumentData[index]
                                              //                         .extensionAttributess
                                              //                         ?.isCancellable ??
                                              //                     '0') ==
                                              //                 '1') {
                                              //               controller
                                              //                   .ordersController
                                              //                   .showDialogBoxOpen(
                                              //                 fromItem: true,
                                              //                 order: argumentData[
                                              //                     index],
                                              //               );
                                              //             } else {
                                              //               controller
                                              //                   .ordersController
                                              //                   .createTicketDialog(
                                              //                 order: argumentData[
                                              //                     index],
                                              //                 fromItem: true,
                                              //               );
                                              //             }
                                              //           },
                                              //           child: Container(
                                              //             color:
                                              //                 Colors.transparent,
                                              //             child: Row(
                                              //               children: [
                                              //                 Icon(
                                              //                   Icons.close,
                                              //                   size: 20,
                                              //                   color: (argumentData[index]
                                              //                                   .extensionAttributess
                                              //                                   ?.isCancellable ??
                                              //                               '0') ==
                                              //                           '1'
                                              //                       ? appColor
                                              //                           .withOpacity(
                                              //                               0.6)
                                              //                       : Colors.grey,
                                              //                 ),
                                              //                 const SizedBox(
                                              //                   width: 4,
                                              //                 ),
                                              //                 Text(
                                              //                   LanguageConstants
                                              //                       .cancel.tr,
                                              //                   style: AppStyle
                                              //                       .textStyleUtils400(
                                              //                     color: (argumentData[index].extensionAttributess?.isCancellable ??
                                              //                                 '0') ==
                                              //                             '1'
                                              //                         ? appColor
                                              //                             .withOpacity(
                                              //                                 0.6)
                                              //                         : Colors
                                              //                             .grey,
                                              //                   ),
                                              //                 ),
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    RichText(
                      text: TextSpan(
                        text: LanguageConstants.expectedDate.tr,
                        style: AppStyle.textStyleUtils400(),
                        children:  <TextSpan>[
                          TextSpan(
                              text: LanguageConstants.orderDate.tr,
                              style: AppStyle.textStyleUtils400()),
                         
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: argumentData12.extensionAttributes
                                        ?.estimatedShipping ??
                                    '',
                        style: AppStyle.textStyleUtils400(),
                        children:  <TextSpan>[
                          TextSpan(
                              text: argumentData12.createdAt == null
                                    ? ""
                                    : DateFormat.yMMMMd().format(
                                        DateTime.parse(
                                          argumentData12.createdAt
                                                  ?.toString() ??
                                              '',
                                        ),
                                      ),
                              style: AppStyle.textStyleUtils400()),
                         
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 30.h),
                    CommonThemeButton(
                      onTap: () {
                        controller.showOrderTrackingDialogBox(context);
                      },
                      title: LanguageConstants.trackOrderText.tr,
                    ),
                    SizedBox(height: 40.h),
                    BillTileWidget(
                      title: LanguageConstants.shippingAddressText.tr,
                      child: Text(
                        // "123456\n\nJaipur, Delhi, 302019\n\nIndia\n\nT: 01234567890",
                        "${argumentData12.billingAddress?.street![0]},\n${argumentData12.billingAddress?.city}, ${argumentData12.billingAddress?.postcode}\n${argumentData12.billingAddress?.countryId}\nT:${argumentData12.billingAddress?.telephone}",
                        style: AppStyle.textStyleUtils400_16(),
                      ),
                    ),
                    SizedBox(
                      height: 12.w,
                    ),
                    BillTileWidget(
                      title: LanguageConstants.billingAddress.tr,
                      child: Text(
                        argumentData12.extensionAttributes
                                    ?.shippingAssignments![0] ==
                                null
                            ? ""
                            : "${argumentData12.extensionAttributes?.shippingAssignments![0].shipping?.address?.city ?? ''}, ${argumentData12.extensionAttributes?.shippingAssignments![0].shipping?.address?.postcode ?? ''}\n${argumentData12.extensionAttributes?.shippingAssignments![0].shipping?.address?.countryId ?? ''}\nT:${argumentData12.extensionAttributes?.shippingAssignments![0].shipping?.address?.telephone ?? ''}",
                        style: AppStyle.textStyleUtils400_16(),
                      ),
                    ),
                    SizedBox(
                      height: 12.w,
                    ),
                    BillTileWidget(
                      title: LanguageConstants.paymentMethod.tr,
                      child: Text(
                        argumentData12.payment?.method?.toString() ?? '',
                        style: AppStyle.textStyleUtils400_16(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CommonThemeButton(
                      onTap: () {
                        Get.offAllNamed<dynamic>(
                          RoutesConstants.dashboardScreen,
                        );
                      },
                      title: LanguageConstants.continueShopping.tr,
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
      ),
    );
  }

//

}

class BillTileWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const BillTileWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: appTileBorderColor, width: 2)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: appTileBGcolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: AppStyle.textStyleUtils500(size: 14.sp, color: primary),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
