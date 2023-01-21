import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';

class CheckoutNewAddressButton extends GetView<CheckoutOrderController> {
  const CheckoutNewAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CommonThemeButton(
        onTap: () async {
          controller.showDialogAddress(Get.context!);
        },
        title: LanguageConstants.newAddressText.tr,
      ),
    );
  }
}
