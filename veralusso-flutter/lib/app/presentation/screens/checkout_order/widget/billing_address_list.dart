import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_opensans.dart';

import '../../../common_widget/common_widget/common_divider.dart';
import 'new_address_button.dart';

class BillingAddressList extends GetView<CheckoutOrderController> {
  @override
  final CheckoutOrderController controller = Get.find();

  BillingAddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.multiAddressModel.value.addresses?.length ?? 0,
            itemBuilder: (context, index) {
              var address = controller.multiAddressModel.value.addresses?[index];
              return Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          await controller.billingAddressOnTap(index, address);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () => Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      width: controller.selectedBillingIndex.value == index ? 4.5 : 0.8),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: CommonTextOpenSans(
                                "${address?.firstname} ${address?.lastname} ${address?.street?.join(",")} ${address?.city} ${address?.postcode}'${address?.telephone}",
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                                maxLine: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      (controller.multiAddressModel.value.addresses?.length ?? 0) - 1 == index
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
                  ));
            }),
        const SizedBox(height: 15.0),
        NewAddressButton(),
      ],
    );
  }
}
