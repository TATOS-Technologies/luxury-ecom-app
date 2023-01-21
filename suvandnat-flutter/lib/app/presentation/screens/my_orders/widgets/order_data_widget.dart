import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/my_orders/my_orders_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class OrderDataWidget extends GetView<MyOrdersController> {
  final String? text;
  final String? data;

  const OrderDataWidget({Key? key, this.text, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width / 3,
          child: Text(
            text ?? '',
            style: AppTextStyle.textStyleUtils500(size: 15.0),
          ),
        ),
        Expanded(
          child: Text(
            data ?? "",
            style: AppTextStyle.textStyleUtils400(),
          ),
        ),
      ],
    );
  }
}
