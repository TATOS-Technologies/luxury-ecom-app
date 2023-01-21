import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/cart/cart_controller.dart';
import 'package:veralusso/app/controller/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    debugPrint("BINDING=============");
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
