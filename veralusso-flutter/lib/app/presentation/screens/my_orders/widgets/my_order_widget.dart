import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:veralusso/app/controller/my_orders/my_orders_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'order_data_widget.dart';

class MyOrderWidget extends GetView<MyOrdersController> {
  final ParentItemElement? item;
  final MyOrdersDataItem? orderData;
  @override
  final MyOrdersController controller = Get.find();

  MyOrderWidget(this.item, this.orderData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return const SizedBox.shrink();
    }
    return InkWell(
      onTap: () {
        Get.toNamed(RoutesConstants.orderDetailsScreen,
            arguments: [item, orderData]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            OrderDataWidget(
              text: LanguageConstants.orderIdTitle.tr,
              data: orderData?.incrementId?.toString() ?? '',
            ),
            const SizedBox(height: 20),
            OrderDataWidget(
              text: LanguageConstants.orderDate.tr,
              data: orderData?.createdAt ?? '',
            ),
            const SizedBox(height: 20),
            OrderDataWidget(
              text:  LanguageConstants.shipHereText.tr,
              data:
                  '${orderData?.billingAddress?.firstname ?? ''} ${orderData?.billingAddress?.lastname ?? ''}',
            ),
            const SizedBox(height: 20),
            OrderDataWidget(
              text: LanguageConstants.orderTotalText.tr,
              data:
                  '${orderData?.subtotal?.toString() ?? '-'} ${orderData?.orderCurrencyCode?.toString() ?? ''}',
            ),
            const SizedBox(height: 20),
            OrderDataWidget(
                text: LanguageConstants.status.tr,
                data: orderData?.status.toString() ?? ''),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width / 3,
                  child: Text(
                    LanguageConstants.action.tr,
                    style: AppStyle.textStyleUtils400(size: 12.sp),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.onReturnTap(orderData);
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Icon(
                              Icons.reply,
                              size: 20,
                              color: (orderData?.extensionAttributes
                                              ?.isReturnable ??
                                          '0') ==
                                      '1'
                                  ? blackColor
                                  : grey,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              LanguageConstants.returnText.tr,
                              style: AppTextStyle.textStyleUtils400(
                                color: (orderData?.extensionAttributes
                                                ?.isReturnable ??
                                            '0') ==
                                        '1'
                                    ? blackColor
                                    : grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 08,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Icon(
                              Icons.close,
                              size: 20,
                              color: (orderData?.extensionAttributes
                                              ?.isCancellable ??
                                          '0') ==
                                      '1'
                                  ? blackColor
                                  : grey,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              LanguageConstants.cancel.tr,
                              style: AppTextStyle.textStyleUtils400(
                                color: (orderData?.extensionAttributes
                                                ?.isCancellable ??
                                            '0') ==
                                        '1'
                                    ? blackColor
                                    : grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width / 3,
                  child: Text(
                    LanguageConstants.viewDetailsText.tr,
                    style: AppStyle.textStyleUtils400(size: 12.sp),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 20,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              height: 1,
              color: Colors.transparent,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
