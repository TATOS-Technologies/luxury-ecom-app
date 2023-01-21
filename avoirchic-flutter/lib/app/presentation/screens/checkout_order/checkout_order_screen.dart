import 'dart:ui';

import 'package:avoirchic/app/controller/checkout_order_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/screens/checkout_order/widget/checkout_widget.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';

class CheckoutOrderScreen extends GetView<CheckoutOrderController> {
  final CartModel? cartlist =
      Get.arguments is CartModel ? Get.arguments as CartModel : null;

  CheckoutOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: CommonTextPoppins(LanguageConstants.checkoutText.tr),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Form(key: controller.formKey, child: const CheckOutWidget()),
              if (controller.isLoading.value)
                AbsorbPointer(
                  absorbing: true,
                  child: Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: const SpinKitThreeBounce(
                        color: appBorderColor,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
