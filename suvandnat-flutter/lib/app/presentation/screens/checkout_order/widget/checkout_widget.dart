import 'package:flutter/material.dart';

import 'package:suvandnat/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/screens/checkout_order/widget/checkout_form_widget.dart';

class CheckoutWidget extends GetView<CheckoutOrderController> {
  const CheckoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 40.0,
          ),
          CheckoutFormWidget(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
