import 'package:brandslabels/app/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint("SEARCH Binding ======");
    Get.lazyPut(() => SearchController());
  }
}
