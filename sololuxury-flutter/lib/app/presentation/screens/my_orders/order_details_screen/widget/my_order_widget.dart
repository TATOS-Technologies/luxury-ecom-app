// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../../all_imports.dart';
import 'row_widgets.dart';

class MyOrderWidget extends GetView<MyOrdersController> {
  ParentItemElement? item;
  int? index;
  MyOrdersDataItem? orderData;

  MyOrderWidget({
    Key? key,
    this.item,
    this.index,
    this.orderData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Container();
    }
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: GestureDetector(
        onTap: () {
          Get.toNamed<dynamic>(RoutesConstants.orderDetailsScreen,
              arguments: [item, orderData]);
        },
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: item!.extensionAttributess?.productImage ?? '',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item!.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.textStyleUtils500(size: 14.sp),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    RichText(
                      text: TextSpan(
                        text: LanguageConstants.quantity.tr,
                        style: AppTextStyle.textStyleUtils400(size: 12.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' : ',
                              style:
                                  AppTextStyle.textStyleUtils400(size: 12.sp)),
                          TextSpan(
                              text: item!.qtyOrdered != null
                                  ? item!.qtyOrdered.toString()
                                  : '',
                              style:
                                  AppTextStyle.textStyleUtils400(size: 12.sp)),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(height: 20),
            RowOne(
              text: LanguageConstants.orderIdTitle.tr,
              data: orderData?.incrementId?.toString() ?? '',
            ),
            const SizedBox(height: 20),
            RowOne(
              text: LanguageConstants.orderDate.tr,
              data: orderData?.createdAt ?? '',
            ),
            const SizedBox(height: 20),
            RowOne(
              text: LanguageConstants.shipTo.tr,
              data:
                  '${orderData?.billingAddress?.firstname ?? ''} ${orderData?.billingAddress?.lastname ?? ''}',
            ),
            const SizedBox(height: 20),
            RowOne(
              text: LanguageConstants.orderTotalText.tr,
              data:
                  '${orderData?.subtotal?.toString() ?? '-'} ${orderData?.orderCurrencyCode?.toString() ?? ''}',
            ),
            const SizedBox(height: 20),
            RowOne(
                text: LanguageConstants.status.tr,
                data: orderData?.status.toString() ?? ''),
            const SizedBox(height: 20),
            SizedBox(height: 15.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonThemeButton(
                  buttonColor: primary,
                  onTap: () {
                    controller.onReturnTap(orderData);
                  },
                  title: LanguageConstants.returnItemText.tr,
                ),
                SizedBox(
                  width: 30.w,
                ),
                CommonThemeButton(
                  buttonColor: primary,
                  onTap: () {
                    controller.onCancelTap(orderData);
                  },
                  title: LanguageConstants.cancel.tr,
                )
              ],
            ),
            
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       width: Get.width / 3,
            //       child: Text(
            //         LanguageConstants.action.tr,
            //         style: AppStyle.textStyleUtils500(),
            //       ),
            //     ),
            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //             controller.onReturnTap(orderData);
            //           },
            //           child: Container(
            //             color: Colors.transparent,
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   Icons.reply,
            //                   size: 20,
            //                   color: (orderData?.extensionAttributes
            //                                   ?.isReturnable ??
            //                               '0') ==
            //                           '1'
            //                       ? appColor.withOpacity(0.6)
            //                       : Colors.grey,
            //                 ),
            //                 const SizedBox(
            //                   width: 4,
            //                 ),
            //                 Text(
            //                   LanguageConstants.returnText.tr,
            //                   style: AppStyle.textStyleUtils400(
            //                     color: (orderData?.extensionAttributes
            //                                     ?.isReturnable ??
            //                                 '0') ==
            //                             '1'
            //                         ? appColor.withOpacity(0.6)
            //                         : Colors.grey,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           width: 08,
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             controller.onCancelTap(orderData);
            //           },
            //           child: Container(
            //             color: Colors.transparent,
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   Icons.close,
            //                   size: 20,
            //                   color: (orderData?.extensionAttributes
            //                                   ?.isCancellable ??
            //                               '0') ==
            //                           '1'
            //                       ? appColor.withOpacity(0.6)
            //                       : Colors.grey,
            //                 ),
            //                 const SizedBox(
            //                   width: 4,
            //                 ),
            //                 Text(
            //                   LanguageConstants.cancelText.tr,
            //                   style: AppStyle.textStyleUtils400(
            //                     color: (orderData?.extensionAttributes
            //                                     ?.isCancellable ??
            //                                 '0') ==
            //                             '1'
            //                         ? appColor.withOpacity(0.6)
            //                         : Colors.grey,
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
            // const SizedBox(height: 20),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       width: Get.width / 3,
            //       child: Text(
            //         LanguageConstants.viewDetailsText.tr,
            //         style: AppStyle.textStyleUtils500(),
            //       ),
            //     ),
            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Container(
            //           color: Colors.transparent,
            //           child: Icon(
            //             Icons.remove_red_eye_outlined,
            //             size: 20,
            //             color: appColor.withOpacity(0.6),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
