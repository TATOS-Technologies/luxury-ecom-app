import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/my_orders/order_details/order_details_controller.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';

class AddressInformationWidget extends GetView<OrderDetailsController> {
  const AddressInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LanguageConstants.shippingAddress.tr,
                  style: AppTextStyle.textStyleUtilsUnderLine18(thickness: 1)),
              const SizedBox(height: 10),
              Text(controller.getShippingAddress(),
                  style: AppTextStyle.textStyleUtils400()),
            ],
          ),
          const VerticalDivider(color: blackColor),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LanguageConstants.billingAddress.tr,
                  style: AppTextStyle.textStyleUtilsUnderLine18(thickness: 1)),
              const SizedBox(height: 10),
              Text(
                controller.getBillingAddress(),
                style: AppTextStyle.textStyleUtils400(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
