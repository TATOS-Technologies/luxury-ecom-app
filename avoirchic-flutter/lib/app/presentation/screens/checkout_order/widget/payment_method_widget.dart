import 'dart:ui';

import 'package:avoirchic/app/controller/checkout_order_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_divider.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/screens/checkout_order/widget/checkout_billing_address.dart';
import 'package:avoirchic/app/presentation/screens/checkout_order/widget/checkout_guest_billing_address.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart'
as ship;

import '../../../../main/main.common.dart';

class PaymentMethodWidget extends GetView<CheckoutOrderController> {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.shipInfoModel.value.paymentMethods == null) {
      return Container();
    }
    return Column(
      children: [
        const SizedBox(height: 10.0),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
            controller.shipInfoModel.value.paymentMethods?.length ?? 0,
            itemBuilder: (context, index) {
              ship.PaymentMethods? paymentMethods =
              controller.shipInfoModel.value.paymentMethods?[index];
              return InkWell(
                onTap: () {
                  controller.selectedPaymentIndex.value = index;
                },
                child: Obx(() => Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20.w,
                          width: 20.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                              controller.selectedPaymentIndex.value ==
                                  index
                                  ? appBorderColor
                                  : appBorderColor,
                              width:
                              controller.selectedPaymentIndex.value ==
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
                        CommonTextPoppins(
                          paymentMethods?.title,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        index ==
                            (controller.shipInfoModel.value
                                .paymentMethods?.length ??
                                0) -
                                1
                            ? Container()
                            : Column(
                          children: [
                            CommonDivider(
                              width: Get.width,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
              );
            }),
        CommonDivider(
          width: Get.width,
        ),
        const SizedBox(
          height: 15.0,
        ),
        localStore.isGuest
            ? const CheckoutGuestBillingAddress()
            : const CheckoutBillingAddress(),
      ],
    );
  }
}
