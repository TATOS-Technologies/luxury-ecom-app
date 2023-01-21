import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:veralusso/app/controller/my_orders/order_details/order_details_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'widgets/order_detail_widget.dart';

class OrderDetailsScreen extends GetView<OrderDetailsController> {
  @override
  final OrderDetailsController controller = Get.find();

  OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          LanguageConstants.orderDetails.tr,
          style: AppTextStyle.textStyleUtils400_16(),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(color: blackColor),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LanguageConstants.orderIdTitle.tr,
                              style: AppStyle.commonTextStyle16(),
                            ),
                            TextSpan(
                              text: controller.myOrdersDataItem?.incrementId
                                  ?.toString(),
                              style: AppStyle.commonTextStyleBold16(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        LanguageConstants.orderContain.tr,
                        textAlign: TextAlign.center,
                        style: AppStyle.commonTextStyle16(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.myOrdersDataItem?.items?.length,
                          itemBuilder: (context, index) {
                            return OrderDetailWidget(index);
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(height: 0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 15,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        // decoration: const BoxDecoration(color: Colors.black12),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LanguageConstants.expectedDate.tr,
                                    style: AppStyle.commonTextStyle20400(
                                      size: 15.0,
                                    ),
                                  ),
                                  Text(
                                    LanguageConstants.orderDate.tr,
                                    style: AppStyle.commonTextStyle20400(
                                      size: 15.0,
                                    ),
                                  ),
                                ]),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller
                                          .myOrdersDataItem
                                          ?.extensionAttributes
                                          ?.estimatedShipping ??
                                      '',
                                  style: AppStyle.commonTextStyle20400(
                                    size: 15.0,
                                  ),
                                ),
                                Text(
                                  controller.myOrdersDataItem?.createdAt == null
                                      ? ""
                                      : DateFormat.yMMMMd().format(
                                          DateTime.parse(
                                            controller
                                                    .myOrdersDataItem?.createdAt
                                                    ?.toString() ??
                                                '',
                                          ),
                                        ),
                                  style:
                                      AppStyle.commonTextStyle20400(size: 15.0),
                                )
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
                      const SizedBox(height: 45),
                      Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: textFieldBoarderColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(
                              height: 1,
                              color: Colors.transparent,
                              thickness: 1,
                            ),
                            Text(
                              LanguageConstants.shippingAddressText.tr,
                              style:
                                  AppTextStyle.textStyleUtils500(size: 14.sp),
                            ),
                            SizedBox(height: 20.w),
                            Text(
                              controller.getShippingAddress(),
                              style: AppStyle.textStyleUtils400(size: 12.sp),
                            ),
                            SizedBox(height: 20.w),
                            Text(
                              LanguageConstants.billingAddress.tr,
                              style:
                                  AppTextStyle.textStyleUtils500(size: 14.sp),
                            ),
                            SizedBox(height: 20.w),
                            Text(
                              controller.getBillingAddress(),
                              style: AppStyle.textStyleUtils400(size: 12.sp),
                            ),
                            SizedBox(height: 20.w),
                            Text(
                              LanguageConstants.paymentMethod.tr,
                              style:
                                  AppTextStyle.textStyleUtils500(size: 14.sp),
                            ),
                            SizedBox(height: 20.w),
                            Text(
                              controller.myOrdersDataItem?.payment?.method
                                      ?.toString() ??
                                  '',
                              style: AppStyle.textStyleUtils400(size: 12.sp),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      CommonThemeButton(
                        buttonColor: whiteColor,
                        isOutLined: true,
                        textColor: blackColor,
                        onTap: () {
                          Get.offAllNamed(
                            RoutesConstants.dashboardScreen,
                          );
                        },
                        title: LanguageConstants.continueShopping.tr,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
