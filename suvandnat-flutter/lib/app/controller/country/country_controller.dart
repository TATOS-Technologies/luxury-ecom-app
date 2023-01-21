import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/store_api_repository.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';
import 'package:meta_package/api/models/country/store_config_model.dart';
import 'package:meta_package/api/models/country/store_websites_model.dart';
import 'package:meta_package/helper/country_helper.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../widgets/country_dialog_content.dart';

class CountryController extends GetxController {
  RxList<StoreWebSitesModel> storeWebsitesList = <StoreWebSitesModel>[].obs;
  RxList<StoreWebSitesModel> searchCountryList = <StoreWebSitesModel>[].obs;
  RxList<StoreConfigModel> storeConfigsList = <StoreConfigModel>[].obs;
  final searchController = TextEditingController().obs;
  RxList<StoreWebSitesModel> filterList = <StoreWebSitesModel>[].obs;

  StoreAPIRepository storeAPIRepository =
      StoreAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;

  bool isShowDialog;

  late CountryHelper countryHelper;

  CountryController({this.countryCode, this.isShowDialog = false}) {
    countryHelper = CountryHelper();
  }

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  RxInt id = 1.obs;

  RxList rxLanguageList = [].obs;
  RxList rxCurrencyList = [].obs;

  RxString langSelected = "English".obs;

  RxString currencySelected = "EUR".obs;
  RxString country = "".obs;
  LocalStoreModel? localStoreModel;

  RxInt languageSelectIndex = 0.obs;
  RxInt currencySelectIndex = 0.obs;

  RxBool isChangeLanguage = false.obs;
  RxBool isChangeCurrency = false.obs;

  void mySearch(String text) {
    filterList.clear();
    if (text.isNotEmpty) {
      for (int i = 0; i < storeWebsitesList.length; i++) {
        String? data = storeWebsitesList[i].name;
        if (data?.toLowerCase().contains(text.toLowerCase()) ?? false) {
          filterList.add(storeWebsitesList[i]);
        }
      }
    }
  }

  void setLanguageSelected(String value) {
    langSelected.value = value;
  }

  void setCurrencySelected(String value) {
    currencySelected.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getStoreDataFromApi();
    getCurrentLanguageCurrency();
  }

  Future<void> getCurrentLanguageCurrency() async {
    String data = LocalStore.getPrefStringValue(kLocalStoreModelKey);

    if (data.isNotEmpty) {
      LocalStoreModel localStoreModel =
          LocalStoreModel.fromJson(jsonDecode(data) as Map<String, dynamic>);

      for (var element in localStoreModel.storeViewModelList!) {
        if (element.code == localStoreModel.currentCode) {
          langSelected.value = element.name!;
        }
      }
      currencySelected.value = localStoreModel.currentCurrency ?? '';
      rxLanguageList.value = localStoreModel.languageList ?? [];
      rxCurrencyList.value = localStoreModel.currencyList ?? [];
    }
    await localStore.getStore();
    log(localStore.currentCode, name: "localStore.currentCode");
  }

  Future<void> getStoreDataFromApi() async {
    storeWebsitesList.value = [];
    searchCountryList.value = [];
    storeConfigsList.value = [];

    try {
      List<StoreWebSitesModel> data =
          await storeAPIRepository.getStoreWebsitesAPIResponse();

      if (data.isNotEmpty == true) {
        storeWebsitesList.value = data;
        searchCountryList.value = data;
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }

    try {
      List<StoreConfigModel> data2 =
          await storeAPIRepository.getStoreConfigsAPIResponse();

      if (data2.isNotEmpty == true) {
        storeConfigsList.value = data2;
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }

    log('$countryCode', name: 'countryCode');

    if (countryCode != null) {
      for (int i = 0; i < storeWebsitesList.length; i++) {
        if (storeWebsitesList[i].code == countryCode?.toLowerCase()) {
          setLanguageAndCurrency(storeWebsitesList[i], isShowDialog);
          break;
        }
      }
    }
  }

  Future<void> setLanguageAndCurrency(
      StoreWebSitesModel item, bool isUpdate) async {
    debugPrint("selection Country -> ");
    id.value = item.websiteId!;
    Map<String, dynamic>? mapData =
        countryHelper.formMapData(item, storeConfigsList);
    if (mapData != null) {
      debugPrint('Store data == ${mapData}');
      localStoreModel = LocalStoreModel.fromJson(mapData);
      langSelected.value =
          localStoreModel?.storeViewModelList?.isNotEmpty == true
              ? localStoreModel?.storeViewModelList?.first.name ?? ''
              : '';
      currencySelected.value =
          localStoreModel?.storeLanguageCurrencyModelList?.isNotEmpty == true
              ? localStoreModel?.storeLanguageCurrencyModelList?.first
                      .defaultDisplayCurrencyCode ??
                  ''
              : '';
      rxLanguageList.value = localStoreModel?.languageList?.toList() ?? [];
      rxCurrencyList.value = localStoreModel?.currencyList?.toList() ?? [];
      currencySelected.value = localStoreModel?.currentCurrency ?? '';
      await LocalStore.setPrefStringValue(
          kLocalStoreModelKey, jsonEncode(mapData));
    }
    if (isUpdate) {
      isChangeCurrency.value = false;
      countryHelper.showSelectionDialog(
          child: DialogContent(item), color: whiteColor);
      debugPrint("LocalMap -> ${jsonEncode(localStoreModel)}");
      await getCurrentLanguageCurrency();
    }
  }

  Future<void> changeLanguage() async {
    if (langSelected.value.isNotEmpty) {
      LocalStoreViewModel localStoreViewModel = localStoreModel!
          .storeViewModelList!
          .firstWhere((element) => element.name == langSelected.value);
      localStoreModel?.currentCode = localStoreViewModel.code;
      await LocalStore.setPrefStringValue(
          kLocalStoreModelKey, jsonEncode(localStoreModel));
    }
  }

  Future<void> changeCurrency() async {
    if (currencySelected.value.isNotEmpty) {
      localStoreModel?.currentCurrency = currencySelected.value;
      await LocalStore.setPrefStringValue(
          kLocalStoreModelKey, jsonEncode(localStoreModel));
    }
  }

  Future<void> changeName(String? name) async {
    if (name?.isNotEmpty == true) {
      localStoreModel?.name = name;
      await LocalStore.setPrefStringValue(
          kLocalStoreModelKey, jsonEncode(localStoreModel));
    }
  }

  Future<void> dialogSaveOnClick(
    StoreWebSitesModel item,
  ) async {
    if (!isChangeLanguage.value && rxLanguageList.isNotEmpty) {
      langSelected.value = rxLanguageList.first.toString();
    }
    if (!isChangeCurrency.value && rxCurrencyList.isNotEmpty) {
      currencySelected.value = rxCurrencyList.first.toString();
    }
    await changeName(item.name);
    await changeLanguage();
    await changeCurrency();
    await getCurrentLanguageCurrency();

    languageSelectIndex.value = 0;
    currencySelectIndex.value = 0;
    isChangeLanguage.value = false;
    isChangeCurrency.value = false;
    Get.back();
  }
}
