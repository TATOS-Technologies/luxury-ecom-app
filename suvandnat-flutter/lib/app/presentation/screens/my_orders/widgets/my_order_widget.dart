import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:suvandnat/app/controller/my_orders/my_orders_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import 'order_data_widget.dart';

class MyOrderWidget extends GetView<MyOrdersController> {
  final ParentItemElement? item;
  final MyOrdersDataItem? orderData;

  const MyOrderWidget(this.item, this.orderData, {Key? key}) : super(key: key);

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
              text: LanguageConstants.shipTo.tr,
              data: controller.getName(orderData),
            ),
            const SizedBox(height: 20),
            OrderDataWidget(
              text: LanguageConstants.orderTotalText.tr,
              data: controller.getSubTotal(orderData),
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
                    style: AppTextStyle.textStyleUtils500(),
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
                            Icon(Icons.reply,
                                size: 20,
                                color:
                                    controller.getReturnableColor(orderData)),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              LanguageConstants.returnText.tr,
                              style: AppTextStyle.textStyleUtils400(
                                color: controller.getReturnableColor(orderData),
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
                              color: controller.getCancellableColor(orderData),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              LanguageConstants.cancelText.tr,
                              style: AppTextStyle.textStyleUtils400(
                                color:
                                    controller.getCancellableColor(orderData),
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
                    style: AppTextStyle.textStyleUtils500(),
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
          ],
        ),
      ),
    );
  }
}
