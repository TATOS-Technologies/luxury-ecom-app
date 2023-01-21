import '../../../../../all_imports.dart';
import 'billing_address_list.dart';

class MyBillingAddress extends GetView<CheckoutOrderController> {
  const MyBillingAddress({Key? key}) : super(key: key);

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
                            color: Colors.black54,
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
                    ? const BillingAddressList()
                    : Container(),
              ],
            ),
          )
        : Container();
  }
}
