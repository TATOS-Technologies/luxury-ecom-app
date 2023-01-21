import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint("SEARCH Binding ======");
    Get.lazyPut(() => SearchController());
  }
}
