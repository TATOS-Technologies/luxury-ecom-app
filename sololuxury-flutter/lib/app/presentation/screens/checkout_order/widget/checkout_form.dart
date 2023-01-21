import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/presentation/screens/checkout_order/widget/payment_method.dart';
import 'package:solo_luxury/app/presentation/screens/checkout_order/widget/shipping_address.dart';
import 'package:solo_luxury/app/presentation/screens/checkout_order/widget/shipping_method.dart';

import '../../../../../all_imports.dart';
import 'order_summary.dart';

class CheckOutForm extends StatelessWidget {
  const CheckOutForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckOutBox(
          title: LanguageConstants.shippingAddressText.tr,
          formFieldWidget: const ShippingAddress(),
        ),
        SizedBox(height: 15.w),
        CheckOutBox(
          title: LanguageConstants.shippingMethodText.tr,
          formFieldWidget: const ShippingMethod(),
        ),
        SizedBox(height: 15.w),
        CheckOutBox(
          title: LanguageConstants.paymentMethod.tr,
          formFieldWidget: const PaymentMethod(),
        ),
        SizedBox(height: 15.w),
        SizedBox(height: 15.w),
        CheckOutBox(
          title: LanguageConstants.orderSummaryText.tr,
          formFieldWidget: const OrderSummary(),
        ),
      ],
    );
  }
}
