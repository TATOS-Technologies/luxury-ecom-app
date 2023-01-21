import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

import '../../../../controller/my_orders_controller.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../theme/colors.dart';
import '../../../common_widgets/common_widget/common_text_poppins.dart';
import '../../../common_widgets/common_widget/common_theme_button.dart';

class MyOrderWidget extends GetView<MyOrdersController> {
  final ParentItemElement? item;
  final MyOrdersDataItem? orderData;

  const MyOrderWidget({Key? key, this.item, this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item != null) {
      return InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderGrey, width: 2)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
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
                        '${LanguageConstants.orderIdText.tr}# ${orderData!.incrementId}',
                        style: AppTextStyle.textStyleUtils500(
                            color: primary, size: 14.sp),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RoutesConstants.orderDetailsScreen,
                              arguments: [item, orderData]);
                        },
                        child: CommonTextPoppins(
                          LanguageConstants.viewAll.tr,
                          color: primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl:
                                item!.extensionAttributess?.productImage ?? '',
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
                              style:
                                  AppTextStyle.textStyleUtils500(size: 14.sp),
                            ),
                            SizedBox(
                              height: 8.w,
                            ),
                            RichText(
                              text: TextSpan(
                                text: LanguageConstants.quantity.tr,
                                style:
                                    AppTextStyle.textStyleUtils400(size: 12.sp),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' : ',
                                      style: AppTextStyle.textStyleUtils400(
                                          size: 12.sp)),
                                  TextSpan(
                                      text: item!.qtyOrdered != null
                                          ? item!.qtyOrdered.toString()
                                          : '',
                                      style: AppTextStyle.textStyleUtils400(
                                          size: 12.sp)),
                                ],
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LanguageConstants.status.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                        Text(
                          orderData!.status.toString(),
                          style: AppTextStyle.textStyleUtils400(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LanguageConstants.price.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                        Text(
                          controller.getProductPrice(
                            orderData: orderData,
                          ),
                          style: AppTextStyle.textStyleUtils400(),
                        ),
                      ],
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       LanguageConstants.sku.tr,
                    //       style: AppTextStyle.textStyleUtils500(),
                    //     ),
                    //     Text(
                    //       item.sku ?? '',
                    //       style: AppTextStyle.textStyleUtils400(),
                    //     ),
                    //   ],
                    // ),

                    SizedBox(height: 15.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonThemeButton(
                          buttonColor: controller.returnableIconColor(
                              orderData?.extensionAttributes),
                          onTap: () {
                            controller.onReturnTap(orderData);
                          },
                          title: LanguageConstants.returnItemText.tr,
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        CommonThemeButton(
                          buttonColor: controller
                              .cancelIconColor(orderData?.extensionAttributes),
                          onTap: () {
                            controller.onCancelTap(orderData);
                          },
                          title: LanguageConstants.cancel.tr,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
