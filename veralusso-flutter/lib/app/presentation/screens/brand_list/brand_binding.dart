import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/brand_list/brand_controller.dart';

class BrandBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint("BRAND Binding ======");
    Get.lazyPut(() => BrandController());
  }
}
