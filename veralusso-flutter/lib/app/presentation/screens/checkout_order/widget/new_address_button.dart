import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class NewAddressButton extends GetView<CheckoutOrderController> {
  @override
  final CheckoutOrderController controller = Get.find();
  NewAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          debugPrint("Aaa->");
          controller.showDialogAddress(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: blackColor,

          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
        ),
        child: Text(
          LanguageConstants.newAddressText.tr,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppTextStyle.textStyleUtils400(color: whiteColor),
        ),
      ),
    );
  }
}
