// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:suvandnat/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:suvandnat/app/controller/home/home_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/screens/checkout_order/widget/checkout_widget.dart';
import 'package:suvandnat/app/theme/colors.dart';

class CheckoutOrderScreen extends GetView<CheckoutOrderController> {
  CheckoutOrderScreen({Key? key}) : super(key: key);
  CartModel? cartlist =
      Get.arguments is CartModel ? Get.arguments as CartModel : null;

  final CheckoutOrderController controller = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(title: LanguageConstants.checkoutText.tr),
        body: Obx(
          () => Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: const CheckoutWidget(),
                  ),
                ),
                controller.isLoading.value
                    ? AbsorbPointer(
                        absorbing: true,
                        child: Center(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: const SpinKitThreeBounce(
                              color: cartBrownColor,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
