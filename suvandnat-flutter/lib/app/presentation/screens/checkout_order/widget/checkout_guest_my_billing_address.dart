import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../../../controller/checkout_order/checkout_order_controller.dart';
import '../../../common_widget/common_text_opensans.dart';
import 'checkout_guest_billing_address_form.dart';

class CheckoutGuestMyBillingAddress extends GetView<CheckoutOrderController> {
  const CheckoutGuestMyBillingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.isSameAsBilling.value = !controller.isSameAsBilling.value;
        controller.checkEnablePlaceOrder();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => Container(
                    height: 24.0,
                    width: 24.0,
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      controller.isSameAsBilling.value
                          ? Icons.check_box_sharp
                          : Icons.check_box_outline_blank_sharp,
                      color: appColorPrimary,
                      size: 24.0,
                    ),
                  )),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: CommonTextOpenSans(
                  LanguageConstants.myBillingShipAddressSameText.tr,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          !controller.isSameAsBilling.value
              ? const CheckoutGuestBillingAddressForm()
              : Container(),
        ],
      ),
    );
  }
}
