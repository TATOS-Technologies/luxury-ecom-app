import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart'
    as multi_address;

import '../../../../../all_imports.dart';
import 'guest_shipping_address_form.dart';
import 'new_address_button.dart';

class ShippingAddress extends GetView<CheckoutOrderController> {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.multiAddressModel.value.addresses == null ||
            (controller.multiAddressModel.value.addresses?.isEmpty ?? false)
        ? localStore.isGuest
            ? const GuestShippingAddressForm()
            : Column(
                children: const [
                  SizedBox(
                    height: 20.0,
                  ),
                  NewAddressButton(),
                ],
              )
        : SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      controller.multiAddressModel.value.addresses?.length,
                  itemBuilder: (context, index) {
                    multi_address.Address? address =
                        controller.multiAddressModel.value.addresses?[index];
                    return Obx(
                      () => Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonTextOpenSans(
                                      "${address?.firstname} ${address?.lastname} ${address?.street?.join(",")} ${address?.city} ${address?.postcode}",
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      maxLine: 5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 10.sp,
                                    ),
                                    CommonTextOpenSans(
                                      '${address?.telephone}',
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      maxLine: 5,
                                    ),
                                  ],
                                ),
                              ),
                               SizedBox(
                                width: 30.w,
                              ),
                              Expanded(
                                  child: SizedBox(
                                height: 30.w,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await controller.shipHereOnTap(
                                        index, address);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(
                                            color: appColorButton, width: 2)),
                                    backgroundColor:
                                        controller.selectedAddressIndex.value ==
                                                index
                                            ? appColorAccent
                                            : appColorButton,
                                  ),
                                  child: CommonTextOpenSans(
                                    LanguageConstants.shipHereText.tr,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                    color:
                                        controller.selectedAddressIndex.value ==
                                                index
                                            ? appColorButton
                                            : appColorAccent,
                                  ),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          (controller.multiAddressModel.value.addresses
                                              ?.length ??
                                          0) -
                                      1 ==
                                  index
                              ? Container()
                              : Column(
                                  children: const [
                                    // CommonDivider(
                                    //   width: Get.width,
                                    // ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    );
                  },
                ),
                const NewAddressButton(),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ));
  }
}
