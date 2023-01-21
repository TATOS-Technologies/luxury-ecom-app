import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class SelectCountryController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  RxList<CountryListModel> getcountryList = RxList<CountryListModel>();
  RxList<CountryListModel> getSearchList = RxList<CountryListModel>();
  var isLoading = false.obs;

  AddressAPIRepository addressAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;

  SelectCountryController({this.countryCode});

  @override
  void onInit() {
    getSelectCountryt();
    super.onInit();
  }

//CountrList
  Future<void> getSelectCountryt() async {
    isLoading.value = true;
    try {
      List<CountryListModel>? data =
          await addressAPIRepository.getCountryListResponse();
      if (data?.isNotEmpty == true) {
        getcountryList.value = data!;
        getcountryList.removeWhere(
            (element) => (element.fullNameEnglish?.isEmpty ?? true));
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
