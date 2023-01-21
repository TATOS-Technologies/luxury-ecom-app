import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/presentation/common_widgets/expandable_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';

class SelectCountryController extends GetxController {
  RxInt index = 0.obs;

  Rx<ExpandableController> aboutUsExpandableController =
      ExpandableController().obs;
  RxList<CountryListModel> getcountryList = RxList<CountryListModel>();
  RxList<CountryListModel> getSearchList = RxList<CountryListModel>();
  var isLoading = false.obs;

  AddressAPIRepository addressAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;

  SelectCountryController({this.countryCode});

  @override
  Future<void> onInit() async {
    super.onInit();
    await getSelectCountry();
  }

//CountrList
  Future<void> getSelectCountry() async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");
    try {
      List<CountryListModel>? selectCountry =
          await addressAPIRepository.getCountryListResponse();
      if (selectCountry?.isNotEmpty == true) {
        getcountryList.value = selectCountry!;
      }
      debugPrint("country list Get $getcountryList");
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
