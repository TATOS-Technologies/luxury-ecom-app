// ignore_for_file: unnecessary_string_interpolations

import 'dart:ui';

import 'package:brandslabels/app/controller/checkout_order_controller.dart';
import 'package:brandslabels/app/controller/home_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_divider.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/screens/checkout_order/widget/checkout_billing_address.dart';
import 'package:brandslabels/app/presentation/screens/checkout_order/widget/checkout_guest_billing_address.dart';
import 'package:brandslabels/app/presentation/screens/checkout_order/widget/checkout_order_summary.dart';
import 'package:brandslabels/app/presentation/screens/checkout_order/widget/checkout_shipping_address.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart' as ship;

import '../../../main/main.common.dart';
import 'widget/checkout_box.dart';

class CheckoutOrderScreen extends GetView<CheckoutOrderController> {
  CheckoutOrderScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(
    HomeController(),
  );
  final CartModel? cartlist = Get.arguments is CartModel ? Get.arguments as CartModel : null;

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
    // return name.split(" ").map((str) => str[0].toUpperCase() + str.substring(1)).join(" ");
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: commonAppbar(title: LanguageConstants.checkoutText.tr),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Form(
                key: controller.formKey,
                child: checkOutWidget(context),
              ),
            ),
          ),
          controller.isLoading.value
              ? AbsorbPointer(
                  absorbing: true,
                  child: Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: const SpinKitThreeBounce(
                        color: darkBlue,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget checkOutWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          CommonTextPoppins(
            LanguageConstants.purchaseText.tr,
            textAlign: TextAlign.center,
            color: Colors.black87,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 20.0,
          ),
          checkoutForm(context),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget checkoutForm(BuildContext context) {
    return Column(
      children: [
        CheckOutBox(
          title: LanguageConstants.shippingAddressText.tr,
          formFieldWidget: const CheckoutShippingAddress(),
        ),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: LanguageConstants.shippingMethodText.tr,
          formFieldWidget: shippingMethod(),
        ),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: LanguageConstants.paymentMethodText.tr,
          formFieldWidget: paymentMethod(),
        ),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: LanguageConstants.orderSummaryText.tr,
          formFieldWidget: CheckoutOrderSummary(
            cartlist: cartlist,
          ),
        ),
      ],
    );
  }

  Widget shippingMethod() {
    if (controller.estimatesList.isEmpty) return Container();
    return Column(
      children: [
        const SizedBox(height: 10.0),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.estimatesList.length,
            itemBuilder: (context, index) {
              final estimateModel = controller.estimatesList[index];
              return Obx(() => InkWell(
                    onTap: () async {
                      await controller.shippingAddressOnTap(index);
                    },
                    child: SizedBox(
                      height: 25.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 18.0,
                            width: 18.0,
                            child: Center(
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.selectedShippingIndex.value == index
                                        ? appButtonColor
                                        : appRadioColor,
                                    width: controller.selectedShippingIndex.value == index ? 4.5 : 0.8,
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
                              "${localStore.setItemPriceWithSymbol(estimateModel.amount.toString(), estimateModel.baseAmount.toString())}",
                              fontSize: 10.0,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CommonTextPoppins(
                              estimateModel.methodTitle,
                              fontSize: 10.0,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CommonTextPoppins(
                              estimateModel.carrierTitle,
                              textAlign: TextAlign.left,
                              fontSize: 10.0,
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

  Widget paymentMethod() {
    if (controller.shipInfoModel.value.paymentMethods == null) {
      return Container();
    }
    return Column(
      children: [
        const SizedBox(height: 10.0),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.shipInfoModel.value.paymentMethods?.length ?? 0,
            itemBuilder: (context, index) {
              ship.PaymentMethods? paymentMethods = controller.shipInfoModel.value.paymentMethods?[index];
              return InkWell(
                onTap: () {
                  controller.selectedPaymentIndex.value = index;
                },
                child: Obx(() => Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      controller.selectedPaymentIndex.value == index ? appButtonColor : appRadioColor,
                                  width: controller.selectedPaymentIndex.value == index ? 4.5 : 0.8,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            CommonTextPoppins(
                              paymentMethods?.title,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.left,
                              color: appButtonColor,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            index == (controller.shipInfoModel.value.paymentMethods?.length ?? 0) - 1
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
                        )
                      ],
                    )),
              );
            }),
        CommonDivider(
          width: Get.width,
        ),
        const SizedBox(
          height: 15.0,
        ),
        localStore.isGuest ? const CheckoutGuestBillingAddress() : const CheckoutBillingAddress(),
      ],
    );
  }
}
