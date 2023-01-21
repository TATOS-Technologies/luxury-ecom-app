import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart'
    as ship;
import 'package:suvandnat/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_divider.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/theme/colors.dart';

import 'checkout_guest_my_billing_address.dart';
import 'checkout_my_billing_address.dart';

class CheckoutPaymentMethod extends GetView<CheckoutOrderController> {
  const CheckoutPaymentMethod({Key? key}) : super(key: key);

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
            itemCount: controller.shipInfoModel.value.paymentMethods?.length,
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
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: appRadioSelectionColor,
                                      width: controller
                                                  .selectedPaymentIndex.value ==
                                              index
                                          ? 3.5
                                          : 0.8),
                                  shape: BoxShape.circle),
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
                        ),
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
            ? const CheckoutGuestMyBillingAddress()
            : const CheckoutMyBillingAddress(),
      ],
    );
  }
}
