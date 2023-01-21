import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../all_imports.dart';
import 'guest_my_billing_address.dart';
import 'my_billing_address.dart';

class PaymentMethod extends GetView<CheckoutOrderController> {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.shipInfoModel.value.paymentMethods == null
          ? Container()
          : Column(
              children: [
                const SizedBox(height: 10.0),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      controller.shipInfoModel.value.paymentMethods?.length,
                  itemBuilder: (context, index) {
                    PaymentMethods? paymentMethods =
                        controller.shipInfoModel.value.paymentMethods?[index];
                    return InkWell(
                      onTap: () {
                        controller.selectedPaymentIndex.value = index;
                        debugPrint(
                            "Payment Method Is ${controller.selectedPaymentIndex.value}");
                      },
                      child: Obx(
                        () => Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20.w,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: appColorPrimary,
                                      width: controller
                                                  .selectedPaymentIndex.value ==
                                              index
                                          ? 5.w
                                          : 0.8,
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
                                        children: const [
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                CommonDivider(
                  color: appBorderColor,
                  height: 1.0,
                  width: Get.width,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                localStore.isGuest
                    ? const GuestMyBillingAddress()
                    : const MyBillingAddress(),
              ],
            ),
    );
  }
}
