import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:veralusso/app/core/const/app_constants.dart';

import '../../presentation/common_widget/common_message/validator.dart';

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
    debugPrint("getStoreDataFromApi -> ");
    try {
      List<CountryListModel>? selectCountryt =
          await addressAPIRepository.getCountryListResponse();
      if (selectCountryt?.isNotEmpty == true) {
        getcountryList.value = selectCountryt!;
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }

    debugPrint("country list Get $getcountryList");
    isLoading.value = false;
  }

//getSearch

}
