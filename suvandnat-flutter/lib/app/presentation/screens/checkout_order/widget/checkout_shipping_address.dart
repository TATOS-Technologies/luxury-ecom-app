import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart'
    as multi_address;
import 'package:suvandnat/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_divider.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/theme/colors.dart';

import 'checkout_guest_shipping_address_form.dart';
import 'checkout_new_address_button.dart';

class CheckoutShippingAddress extends GetView<CheckoutOrderController> {
  const CheckoutShippingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.multiAddressModel?.value.addresses == null ||
        (controller.multiAddressModel?.value.addresses?.isEmpty ?? false)) {
      return localStore.isGuest
          ? const CheckoutGuestShippingAddressForm()
          : Column(
              children: const [
                SizedBox(
                  height: 20.0,
                ),
                CheckoutNewAddressButton(),
              ],
            );
    }
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15.0),
          ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.multiAddressModel?.value.addresses?.length,
              itemBuilder: (context, index) {
                multi_address.Address? address =
                    controller.multiAddressModel?.value.addresses?[index];
                return Obx(() => Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CommonTextPoppins(
                                "${address?.firstname} ${address?.lastname} ${address?.street?.join(",")} ${address?.city} ${address?.postcode} ${address?.telephone}",
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                maxLine: 6,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 60.0,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: appColorPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () async {
                                  await controller.shipHereOnTap(
                                      index, address);
                                },
                                child: HeadlineBodyOneBaseWidget(
                                  title: LanguageConstants.shipHereText.tr,
                                  titleColor: Colors.white,
                                  fontFamily: AppConstants.fontPoppins,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        (controller.multiAddressModel?.value.addresses
                                            ?.length ??
                                        0) -
                                    1 ==
                                index
                            ? Container()
                            : Column(
                                children: [
                                  CommonDivider(
                                    width: Get.width,
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                ],
                              ),
                      ],
                    ));
              }),
          const CheckoutNewAddressButton(),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
