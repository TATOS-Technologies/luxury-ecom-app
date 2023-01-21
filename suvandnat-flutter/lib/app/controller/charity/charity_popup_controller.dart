import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharityPopUpController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  var selectedAmount = 5.obs;
}
