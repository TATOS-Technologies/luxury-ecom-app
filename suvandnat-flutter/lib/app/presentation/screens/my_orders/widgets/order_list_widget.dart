import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/my_orders/order_details/order_details_controller.dart';
import '../../../../theme/app_asset.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';

class OrderListWidget extends GetView<OrderDetailsController> {
  const OrderListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.myOrdersDataItem?.items?.length,
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: blackColor,
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: blackColor,
                          width: 1.4,
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: controller.getProductImage(index),
                        height: 60,
                        fit: BoxFit.cover,
                        errorWidget:
                            (BuildContext context, String url, dynamic error) {
                          return Image.asset(
                            AppAsset.logo,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        controller.myOrdersDataItem?.items?[index].name
                                .toString()
                                .capitalizeFirst ??
                            '',
                        style: AppTextStyle.textStyleUtils400(size: 15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageConstants.price.tr,
                        style: AppTextStyle.textStyleUtils400(
                            size: 15, color: grey),
                      ),
                      Text(
                        LanguageConstants.quantity.tr,
                        style: AppTextStyle.textStyleUtils400(
                            size: 15, color: grey),
                      ),
                      Text(
                        LanguageConstants.subTotal.tr,
                        style: AppTextStyle.textStyleUtils400(
                            size: 15, color: grey),
                      ),
                      Text(
                        LanguageConstants.actionText.tr,
                        style: AppTextStyle.textStyleUtils400(
                            size: 15, color: grey),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 9,
                  color: grey,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.myOrdersDataItem?.items?[index].price
                                ?.toString() ??
                            '',
                        style: AppTextStyle.textStyleUtils400(),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        controller.myOrdersDataItem?.items?[index].qtyOrdered
                                ?.toString() ??
                            '',
                        style: AppTextStyle.textStyleUtils400(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.myOrdersDataItem?.items?[index].rowTotal
                                    ?.toString() ??
                                '',
                            style: AppTextStyle.textStyleUtils400(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            controller.getOrderCurrencyCode(index),
                            style: AppTextStyle.textStyleUtils400(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.returnOnTap(index);
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.reply,
                                    size: 20,
                                    color: (controller
                                                    .myOrdersDataItem
                                                    ?.items?[index]
                                                    .extensionAttributess
                                                    ?.isReturnable ??
                                                '0') ==
                                            '1'
                                        ? appColor.withOpacity(0.6)
                                        : Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    LanguageConstants.returnText.tr,
                                    style: AppTextStyle.textStyleUtils400(
                                      color: (controller
                                                      .myOrdersDataItem
                                                      ?.items?[index]
                                                      .extensionAttributess
                                                      ?.isReturnable ??
                                                  '0') ==
                                              '1'
                                          ? appColor.withOpacity(0.6)
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                                    color: (controller
                                                    .myOrdersDataItem
                                                    ?.items?[index]
                                                    .extensionAttributess
                                                    ?.isCancellable ??
                                                '0') ==
                                            '1'
                                        ? appColor.withOpacity(0.6)
                                        : Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    LanguageConstants.cancelText.tr,
                                    style: AppTextStyle.textStyleUtils400(
                                      color: (controller
                                                      .myOrdersDataItem
                                                      ?.items?[index]
                                                      .extensionAttributess
                                                      ?.isCancellable ??
                                                  '0') ==
                                              '1'
                                          ? appColor.withOpacity(0.6)
                                          : Colors.grey,
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
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
