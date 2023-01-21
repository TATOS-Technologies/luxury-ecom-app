import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';
import 'package:veralusso/app/theme/colors.dart';

class ShippingMethod extends GetView<CheckoutOrderController> {
  @override
  final CheckoutOrderController controller = Get.find();

  ShippingMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.estimatesList.isEmpty
        ? Container()
        : Column(
            children: [
              const SizedBox(height: 10.0),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.estimatesList.length,
                  itemBuilder: (context, index) {
                    return Obx(() => InkWell(
                          onTap: () async {
                            await controller.shippingAddressOnTap(index);
                          },
                          child: SizedBox(
                            height: 30.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                              height: 20.w,
                              width: 20.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      controller.selectedShippingIndex.value ==
                                              index
                                          ? primary
                                          : primary,
                                  width:
                                      controller.selectedShippingIndex.value ==
                                              index
                                          ? 5.w
                                          : 1.w,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: CommonTextMontserrat(
                                    "${localStore.currentCurrency} ${(controller.estimatesList[index].amount ?? 0).toString()}",
                                    fontSize: 12.sp,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: CommonTextMontserrat(
                                    controller.estimatesList[index].methodTitle
                                        .toString(),
                                    fontSize: 12.sp,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: CommonTextMontserrat(
                                    controller
                                        .estimatesList[index].carrierTitle,
                                    textAlign: TextAlign.left,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }),
            ],
          ));
  }
}
