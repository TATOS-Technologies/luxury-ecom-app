import 'package:avoirchic/app/controller/cart_controller.dart';
import 'package:avoirchic/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    debugPrint("BINDING=============");
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
