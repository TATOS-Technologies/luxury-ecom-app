import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint("BINDING=============");
    Get.lazyPut(() => CartController(), fenix: true);
    debugPrint("BINDING=============");
  }
}
