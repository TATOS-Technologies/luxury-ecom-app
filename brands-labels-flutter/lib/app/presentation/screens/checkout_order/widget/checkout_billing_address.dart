import 'package:brandslabels/app/controller/checkout_order_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_divider.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart' as multi_address;

class CheckoutBillingAddress extends GetView<CheckoutOrderController> {
  const CheckoutBillingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (controller.multiAddressModel.value.addresses?.length ?? 0) > 1
        ? InkWell(
            onTap: () {
              controller.myBillingAddress();
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
                            color: appBarPrimary,
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
                !controller.isSameAsBilling.value ? billingAddressList() : Container(),
              ],
            ),
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
              multi_address.Address? address = controller.multiAddressModel.value.addresses?[index];
              return Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          await controller.billingAddressOnTap(index, address);
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
                                      color: appBarPrimary,
                                      width: controller.selectedBillingIndex.value == index ? 4.5 : 0.8),
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
                      (controller.multiAddressModel.value.addresses?.length ?? 0) - 1 == index
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
      child: SizedBox(
        height: 40,
        width: 135.0,
        child: CommonButton(
          padding: EdgeInsets.zero,
          buttonType: ButtonType.ElevatedButton,
          onPressed: () {
            controller.showDialogAddress(Get.context!);
          },
          elevation: 0.0,
          color: appBarPrimary,
          borderRadius: 20.0,
          child: CommonTextPoppins(
            LanguageConstants.newAddressText.tr,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
