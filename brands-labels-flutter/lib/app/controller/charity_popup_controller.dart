import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharityPopUpController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  Rx<TextEditingController> gbpTextController = TextEditingController().obs;
  final List<String> countryList = ["Country"];
  var selectedAmount = 5.obs;
}
