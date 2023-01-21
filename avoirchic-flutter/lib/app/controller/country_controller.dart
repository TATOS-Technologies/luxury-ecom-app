import 'dart:convert';
import 'dart:developer';

import 'package:avoirchic/app/controller/widgets/dialog_content_widget.dart';
import 'package:avoirchic/app/core/consts/constants.dart';
import 'package:avoirchic/app/data/local_data/local_store.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/store_api_repository.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';
import 'package:meta_package/api/models/country/store_config_model.dart';
import 'package:meta_package/api/models/country/store_views_model.dart';
import 'package:meta_package/api/models/country/store_websites_model.dart';
import 'package:meta_package/helper/country_helper.dart';

import '../main/main.common.dart';
import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class CountryController extends GetxController {
  RxList<StoreWebSitesModel> storeWebsitesList = <StoreWebSitesModel>[].obs;
  RxList<StoreWebSitesModel> searchCountryList = <StoreWebSitesModel>[].obs;
  RxList<StoreViewsModel> storeViewsList = <StoreViewsModel>[].obs;
  RxList<StoreConfigModel> storeConfigsList = <StoreConfigModel>[].obs;

  StoreAPIRepository storeAPIRepository =
      StoreAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;
  bool isShowDialog;

  late CountryHelper countryHelper;

  CountryController({this.countryCode, this.isShowDialog = false}) {
    countryHelper = CountryHelper();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TextEditingController searchController = TextEditingController();

  RxInt id = 1.obs;

  RxList rxLanguageList = [].obs;
  RxList rxCurrencyList = [].obs;
  RxString? country = "".obs;
  final langSelected = "English".obs;

  final currencySelected = "EUR".obs;
  LocalStoreModel? localStoreModel;

  RxInt languageSelectIndex = 0.obs;
  RxInt currencySelectIndex = 0.obs;

  RxBool isChangeLanguage = false.obs;
  RxBool isChangeCurrency = false.obs;

  void setLanguageSelected(String value) {
    langSelected.value = value;

    update();
  }

  void setCurrencySelected(String value) {
    currencySelected.value = value;

    update();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getStoreDataFromApi();
    await getCurrentLanguageCurrency();
  }

  Future<void> getCurrentLanguageCurrency() async {
    String data = LocalStore.getPrefStringValue(kLocalStoreModelKey);
    if (data.isNotEmpty) {
      LocalStoreModel localStoreModel =
          LocalStoreModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
      debugPrint("Get LocalMap -> ${jsonEncode(localStoreModel)}");
      for (var element in localStoreModel.storeViewModelList ?? []) {
        if (element.code == localStoreModel.currentCode) {
          langSelected.value = element.name.toString();
          debugPrint("Languages -> ${langSelected.value}");
        }
      }
      currencySelected.value = localStoreModel.currentCurrency ?? '';
      rxLanguageList.value = localStoreModel.languageList ?? [];
      rxCurrencyList.value = localStoreModel.currencyList ?? [];
      update();
    }
    localStore.getStore();
  }

  Future<void> getStoreDataFromApi() async {
    debugPrint("getStoreDataFromApi -> ");
    storeWebsitesList.value = [];
    searchCountryList.value = [];
    storeViewsList.value = [];
    storeConfigsList.value = [];

    try {
      List<StoreWebSitesModel> data =
          await storeAPIRepository.getStoreWebsitesAPIResponse();
      if (data.isNotEmpty == true) {
        storeWebsitesList.value = data;
        searchCountryList.value = data;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }

    try {
      List<StoreConfigModel> data2 =
          await storeAPIRepository.getStoreConfigsAPIResponse();
      if (data2.isNotEmpty == true) {
        storeConfigsList.value = data2;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }

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
    try {
      debugPrint("selection Country -> ");
      id.value = item.websiteId ?? 0;
      Map<String, dynamic>? mapData =
          countryHelper.formMapData(item, storeConfigsList);
      if (mapData != null) {
        debugPrint('Store data == $mapData');
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
            child: Container(
                padding: EdgeInsets.all(24.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(12)),
                /*padding:
                const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),*/
                child: DialogContent(item)),
            color: Colors.transparent);
        debugPrint("LocalMap -> ${jsonEncode(localStoreModel)}");
        await getCurrentLanguageCurrency();
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStrace) {
      log(e.toString(), name: "Error");
      log(stackStrace.toString(), name: "stackStrace");
    }
  }

  Future<void> changeLanguage() async {
    if (langSelected.value.isNotEmpty) {
      LocalStoreViewModel? localStoreViewModel = localStoreModel
          ?.storeViewModelList
          ?.firstWhere((element) => element.name == langSelected.value);
      localStoreModel?.currentCode = localStoreViewModel?.code;
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

  void countryOnChanged(String? value) {
    if (value != null) {
      searchCountryList.value = [];
      for (StoreWebSitesModel element in storeWebsitesList) {
        if (element.name?.toLowerCase().contains(value.toLowerCase()) ??
            false) {
          searchCountryList.add(element);
        }
      }
    } else {
      searchCountryList = storeWebsitesList;
    }
  }
}
