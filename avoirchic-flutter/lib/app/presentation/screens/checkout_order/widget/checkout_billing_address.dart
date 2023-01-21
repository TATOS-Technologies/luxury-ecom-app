import 'package:avoirchic/app/controller/checkout_order_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_divider.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart'
    as multi_address;

class CheckoutBillingAddress extends GetView<CheckoutOrderController> {
  const CheckoutBillingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (controller.multiAddressModel.value.addresses?.length ?? 0) > 1
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() => InkWell(
                        onTap: () {
                          controller.myBillingAddress();
                        },
                        child: Container(
                          height: 24.0,
                          width: 24.0,
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            controller.isSameAsBilling.value
                                ? Icons.check_box_sharp
                                : Icons.check_box_outline_blank_sharp,
                            color: appBorderColor,
                            size: 24.0,
                          ),
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
                  ? billingAddressList()
                  : Container(),
            ],
          )
        : Container();
  }

  Widget billingAddressList() {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.multiAddressModel.value.addresses?.length,
            itemBuilder: (context, index) {
              multi_address.Address? address =
                  controller.multiAddressModel.value.addresses?[index];
              return Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          if (controller.selectedBillingIndex.value != index) {
                            controller.billingAddress =
                                address ?? multi_address.Address();
                            if (!controller.isSameAsBilling.value) {
                              controller.estimateAndShippingAPICall(
                                controller.shippingAddress,
                                controller.billingAddress,
                              );
                              controller.isSameAsBilling.value = false;
                            } else {
                              controller.estimateAndShippingAPICall(
                                controller.shippingAddress,
                                controller.shippingAddress,
                              );
                            }
                          }
                          controller.selectedBillingIndex.value = index;
                          controller.checkEnablePlaceOrder();
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () => Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: appBorderColor,
                                    width:
                                        controller.selectedBillingIndex.value ==
                                                index
                                            ? 4.5
                                            : 0.8,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: CommonTextOpenSans(
                                "${address?.firstname} ${address?.lastname} ${address?.street?.join(",")} ${address?.city} ${address?.postcode}'${address?.telephone}",
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                                maxLine: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      (controller.multiAddressModel.value.addresses?.length ??
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
                                  height: 10.0,
                                ),
                              ],
                            ),
                    ],
                  ));
            }),
        const SizedBox(height: 15.0),
        newAddressButton(Get.context!),
      ],
    );
  }

  Widget newAddressButton(context) {
    return Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            controller.showAddDialog(
              Get.context!,
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: appTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: CommonTextOpenSans(
            LanguageConstants.newAddressText.tr,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13.5,
          ),
        ));
  }
}
