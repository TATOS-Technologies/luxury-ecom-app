import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_orders/order_details/order_details_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class OrderDetailWidget extends GetView<OrderDetailsController> {
  final int index;
  @override
  final OrderDetailsController controller = Get.find();

  OrderDetailWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: whiteColor,
           borderRadius: BorderRadius.circular(12),
           border: Border.all(color: textFieldBoarderColor,width: 2)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppAsset.logo,
                              width: 35,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CachedNetworkImage(
                          imageUrl: controller.getProductImage(index),
                          height: 60,
                          fit: BoxFit.cover,
                          errorWidget: (BuildContext context, String url,
                              dynamic error) {
                            return Image.asset(
                              AppAsset.logo,
                            );
                          },
                        ),
                      ],
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
                      style: AppStyle.commonTextStyle16400(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LanguageConstants.price.tr,
                    style:
                        AppTextStyle.textStyleUtils400(size: 15, color: grey),
                  ),
                  Text(
                    LanguageConstants.quantity.tr,
                    style:
                        AppTextStyle.textStyleUtils400(size: 15, color: grey),
                  ),
                  Text(
                    LanguageConstants.subTotal.tr,
                    style:
                        AppTextStyle.textStyleUtils400(size: 15, color: grey),
                  ),
                  Text(
                    LanguageConstants.action.tr,
                    style:
                        AppTextStyle.textStyleUtils400(size: 15, color: grey),
                  ),
                ],
              ),
              const Divider(
                height: 9,
                color: textFieldBoarderColor,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.myOrdersDataItem?.items?[index].price
                            ?.toString() ??
                        '',
                    style: AppStyle.textStyleUtils400(
                      size: 14.sp,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    controller.myOrdersDataItem?.items?[index].qtyOrdered
                            ?.toString() ??
                        '',
                    style: AppStyle.textStyleUtils400(
                      size: 14.sp,
                    ),
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
                        style: AppStyle.textStyleUtils400(
                      size: 14.sp,
                    ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        controller.getOrderCurrencyCode(index),
                        style: AppStyle.textStyleUtils400(
                      size: 14.sp,
                    ),
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
                                LanguageConstants.cancel.tr,
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
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
