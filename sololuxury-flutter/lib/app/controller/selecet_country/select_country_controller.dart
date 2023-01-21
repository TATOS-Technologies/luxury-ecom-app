import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:solo_luxury/all_imports.dart';

class SelectCountryController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  RxList<CountryListModel> getcountryList = RxList<CountryListModel>();
  RxList<CountryListModel> getSearchList = RxList<CountryListModel>();
  var isLoading = false.obs;

  final textController = TextEditingController().obs;

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
      debugPrint("country list Get $getcountryList");
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  //getSearch
  Future<void> onSearchTextChanged(String text) async {
    debugPrint("Text is $text");
    getSearchList.clear();
    for (var userDetail in getcountryList) {
      if (userDetail.fullNameEnglish
          .toString()
          .toUpperCase()
          .contains(text.toUpperCase())) {
        getSearchList.add(userDetail);
      }
      debugPrint(userDetail.toString());
    }
  }
}
