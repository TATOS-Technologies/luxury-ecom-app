import 'package:flutter/material.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/screens/checkout_order/widget/checkout_order_summary.dart';
import 'package:suvandnat/app/presentation/screens/checkout_order/widget/checkout_shipping_address.dart';
import 'package:suvandnat/app/presentation/screens/checkout_order/widget/checkout_shipping_method.dart';

import 'checkout_box.dart';
import 'checkout_payment_method.dart';

class CheckoutFormWidget extends GetView<CheckoutOrderController> {
  const CheckoutFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckOutBox(
            title: LanguageConstants.shippingAddressText.tr,
            formFieldWidget: const CheckoutShippingAddress()),
        const SizedBox(height: 10.0),
        CheckOutBox(
            title: LanguageConstants.shippingMethodText.tr,
            formFieldWidget: const CheckoutShippingMethod()),
        const SizedBox(height: 10.0),
        CheckOutBox(
          title: LanguageConstants.paymentMethodText.tr,
          formFieldWidget: const CheckoutPaymentMethod(),
        ),
        const SizedBox(height: 10.0),
        CheckOutBox(
            title: LanguageConstants.orderSummaryText.tr,
            formFieldWidget: const CheckoutOrderSummary()),
      ],
    );
  }
}
