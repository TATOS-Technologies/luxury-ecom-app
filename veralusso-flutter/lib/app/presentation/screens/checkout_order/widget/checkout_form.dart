import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/screens/checkout_order/widget/checkout_box.dart';

import 'order_summary.dart';
import 'payment_method.dart';
import 'shipping_address.dart';
import 'shipping_method.dart';

class CheckoutForm extends StatelessWidget {
  const CheckoutForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckOutBox(
          title: LanguageConstants.shippingAddressText.tr,
          formFieldWidget: ShippingAddress(),
        ),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: LanguageConstants.shippingMethodText.tr,
          formFieldWidget: ShippingMethod(),
        ),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: LanguageConstants.paymentMethodText.tr,
          formFieldWidget: PaymentMethod(),
        ),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: LanguageConstants.orderSummaryText.tr,
          formFieldWidget: OrderSummary(),
        ),
      ],
    );
  }
}
