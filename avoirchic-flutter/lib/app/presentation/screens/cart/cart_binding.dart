import 'package:avoirchic/app/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint("BINDING=============");
    Get.lazyPut(() => CartController(), fenix: true);
    debugPrint("BINDING=============");
  }
}
