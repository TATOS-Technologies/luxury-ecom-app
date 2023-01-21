import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressPopUpController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  final List<String> countryList = ["Country"];
  var selectedCoutry = "".obs;
  var saveAddressBook = 1.obs;
}
