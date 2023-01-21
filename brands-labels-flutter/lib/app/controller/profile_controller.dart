import 'dart:convert';

import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/data/local_data/local_store.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString countryCurrency = "".obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint("ProfileController -> $runtimeType");
    getCountryData();
  }

  Future<void> getCountryData() async {
    String data = LocalStore.getPrefStringValue(kLocalStoreModelKey);
    if (data.isNotEmpty) {
      LocalStoreModel localStoreModel =
          LocalStoreModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
      debugPrint("Get LocalMap -> ${jsonEncode(localStoreModel)}");
      countryCurrency.value =
          "${localStoreModel.name} (${localStoreModel.currentCurrency})";
      update();
    }
  }
}
