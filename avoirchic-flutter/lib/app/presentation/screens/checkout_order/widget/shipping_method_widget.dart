import 'dart:ui';

import 'package:avoirchic/app/controller/checkout_order_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/estimate_shipping_method_model.dart';

import '../../../../main/main.common.dart';

class ShippingMethodWidget extends GetView<CheckoutOrderController> {
  const ShippingMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.estimatesList.isEmpty) return Container();
    return Column(
      children: [
        const SizedBox(height: 10.0),
        SizedBox(
          height: 35.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
                width: 20.0,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                flex: 2,
                child: CommonTextPoppins(
                  LanguageConstants.priceText.tr,
                  fontSize: 12.0,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                flex: 2,
                child: CommonTextPoppins(
                  LanguageConstants.titleText.tr,
                  fontSize: 12.0,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                flex: 4,
                child: CommonTextPoppins(
                  LanguageConstants.carrierTitleText.tr,
                  textAlign: TextAlign.left,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.estimatesList.length,
            itemBuilder: (context, index) {
              EstimateShippingMethodModel estimateModel =
                  controller.estimatesList[index];
              return Obx(() => InkWell(
                    onTap: () async {
                      await controller.shippingAddressOnTap(index);
                    },
                    child: SizedBox(
                      height: 35.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.w,
                            width: 20.w,
                            child: Center(
                              child: Container(
                                height: 20.w,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller
                                                .selectedShippingIndex.value ==
                                            index
                                        ? appBorderColor
                                        : Colors.black,
                                    width: controller
                                                .selectedShippingIndex.value ==
                                            index
                                        ? 4.5
                                        : 0.8,
                                  ),
                                  shape: BoxShape.circle,
                                ),
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
                                estimateModel.baseAmount.toString(),
                              ),
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
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      ],
    );
  }
}
