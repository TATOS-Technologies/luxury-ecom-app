import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../all_imports.dart';

class ShippingMethod extends GetView<CheckoutOrderController> {
  const ShippingMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.estimatesList.isNotEmpty
        ? Column(
            children: [
              const SizedBox(height: 10.0),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.estimatesList.length,
                itemBuilder: (context, index) {
                  EstimateShippingMethodModel estimateModel =
                      controller.estimatesList[index];
                  return Obx(
                    () => InkWell(
                      onTap: () async {
                        await controller.shippingAddressOnTap(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 20.w,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: appColorPrimary,
                                    width: controller
                                                .selectedShippingIndex.value ==
                                            index
                                        ? 5.w
                                        : 0.8,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              flex: 2,
                              child: CommonTextPoppins(
                                localStore.setItemPriceWithSymbol(
                                    estimateModel.amount.toString(),
                                    estimateModel.baseAmount.toString()),
                                fontSize: 12.0,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: CommonTextPoppins(
                                estimateModel.methodTitle,
                                fontSize: 12.0,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: CommonTextPoppins(
                                estimateModel.carrierTitle,
                                textAlign: TextAlign.left,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                maxLine: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        : Container());
  }
}
