import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart';
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_divider.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../../../main/main.common.dart';
import 'guest_my_billing_address.dart';
import 'my_billing_address.dart';

class PaymentMethod extends GetView<CheckoutOrderController> {
  @override
  final CheckoutOrderController controller = Get.find();

  PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.shipInfoModel.value.paymentMethods == null
        ? Container()
        : Column(
            children: [
              const SizedBox(height: 10.0),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      controller.shipInfoModel.value.paymentMethods?.length ??
                          0,
                  itemBuilder: (context, index) {
                    PaymentMethods? paymentMethods =
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
                                          ? primary
                                          : primary,
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
                                  CommonTextMontserrat(
                                    paymentMethods?.title ?? '',
                                    fontSize: 12.sp,
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
                                                  .paymentMethods?.length ?? 0) -
                                              1
                                      ? Container()
                                      : Column(
                                          children: [
                                            CommonDivider(
                                              color: whiteColor,
                                              height: 1.0,
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
                color: whiteColor,
                height: 1.0,
                width: Get.width,
              ),
              const SizedBox(
                height: 15.0,
              ),
              localStore.isGuest ? GuestMyBillingAddress() : MyBillingAddress(),
            ],
          ));
  }
}
