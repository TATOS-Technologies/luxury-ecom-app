import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/estimate_shipping_method_model.dart';
import 'package:suvandnat/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../../../main/main.common.dart';
import '../../../common_widget/common_text_poppins.dart';

class CheckoutShippingMethod extends GetView<CheckoutOrderController> {
  const CheckoutShippingMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.estimatesList.isEmpty) return Container();
    return Column(
      children: [
        const SizedBox(height: 10.0),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.estimatesList.length,
            itemBuilder: (context, index) {
              EstimateShippingMethodModel estimateModel = controller.estimatesList[index];
              return Obx(() => InkWell(
                onTap: () async {
                  await controller.shippingAddressOnTap(index);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18.0,
                      width: 18.0,
                      child: Center(
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: appRadioSelectionColor,
                                  width: controller.selectedShippingIndex.value == index ? 3.5 : 0.8),
                              shape: BoxShape.circle),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: CommonTextPoppins(
                        localStore.setItemPriceWithSymbol(
                            estimateModel.amount.toString(), estimateModel.baseAmount.toString()),
                        fontSize: 10.0,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CommonTextPoppins(
                        estimateModel.methodTitle,
                        fontSize: 10.0,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: CommonTextPoppins(
                        estimateModel.carrierTitle,
                        textAlign: TextAlign.left,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ));
            }),
      ],
    );
  }
}
