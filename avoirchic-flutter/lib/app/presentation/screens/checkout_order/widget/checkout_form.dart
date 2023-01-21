import 'package:avoirchic/app/presentation/screens/checkout_order/widget/payment_method_widget.dart';
import 'package:avoirchic/app/presentation/screens/checkout_order/widget/shipping_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/checkout_order_controller.dart';
import 'checkout_box.dart';
import 'checkout_order_summary.dart';
import 'checkout_shipping_address.dart';

class CheckOutFormWidget extends GetView<CheckoutOrderController> {
  final CartModel? cartlist;
  const CheckOutFormWidget({Key? key,this.cartlist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckOutBox(
          title: LanguageConstants.shippingAddressText.tr,
          formFieldWidget: const CheckoutShippingAddress(),
        ),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: LanguageConstants.shippingMethodText.tr,
          formFieldWidget: const ShippingMethodWidget(),
        ),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: LanguageConstants.paymentMethodText.tr,
          formFieldWidget:const PaymentMethodWidget(),
        ),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: LanguageConstants.orderSummaryText.tr,
          formFieldWidget: CheckoutOrderSummary(
            cartlist: cartlist,
          ),
        ),
      ],
    );
  }
}
