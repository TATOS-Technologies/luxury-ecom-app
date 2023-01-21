import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/store_api_repository.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/helper/country_helper.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/controller/widgets/country_dialog_content.dart';
import 'package:solo_luxury/app/core/utils/lang_directory/translation_service.dart';

class CountryController extends GetxController {
  RxList<StoreWebSitesModel> storeWebsitesList = <StoreWebSitesModel>[].obs;
  RxList<StoreWebSitesModel> searchCountryList = <StoreWebSitesModel>[].obs;
  RxList<StoreConfigModel> storeConfigsList = <StoreConfigModel>[].obs;

  String? countryCode;
  RxBool isChangeLanguage = false.obs;
  RxBool isChangeCurrency = false.obs;
  bool isShowDialog;

  TextEditingController searchController = TextEditingController();

  late CountryHelper countryHelper;

  CountryController({this.countryCode, this.isShowDialog = false}) {
    countryHelper = CountryHelper();
  }

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  // RxString currency = "INR".obs;
  // RxString language = "English".obs;
  RxInt id = 1.obs;

  RxList rxLanguageList = <dynamic>[].obs;
  RxList rxCurrencyList = <dynamic>[].obs;

  final langSelected = "English".obs;
  RxString? country = "".obs;
  final currencySelected = "EUR".obs;
  LocalStoreModel? localStoreModel;

  RxInt languageSelectIndex = 0.obs;
  RxInt currencySelectIndex = 0.obs;

  StoreAPIRepository storeAPIRepository =
      StoreAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  void setLanguageSelected(String value) {
    langSelected.value = value;
    //changeLanguage(value);
    update();
  }

  void setCurrencySelected(String value) {
    currencySelected.value = value;
    //changeCurrency(value);
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

      for (var element in localStoreModel.storeViewModelList!) {
        if (element.code == localStoreModel.currentCode) {
          langSelected.value = element.name!;
        }
      }
      currencySelected.value = localStoreModel.currentCurrency ?? '';
      rxLanguageList.value = localStoreModel.languageList ?? [];
      rxCurrencyList.value = localStoreModel.currencyList ?? [];

      update();
    }
    await localStore.getStore();
  }

  Future<void> getStoreDataFromApi() async {
    storeWebsitesList.value = [];
    searchCountryList.value = [];
    storeConfigsList.value = [];

    try {
      List<StoreWebSitesModel>? data = await storeAPIRepository.getStoreWebsitesAPIResponse();
      if (data.isNotEmpty == true) {
        storeWebsitesList.value = searchCountryList.value = data;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }

    try {
      List<StoreConfigModel> data2 = await storeAPIRepository.getStoreConfigsAPIResponse();
      if (data2.isNotEmpty == true) {
        storeConfigsList.value = data2;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
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

  Future<void> setLanguageAndCurrency(StoreWebSitesModel item, bool isUpdate) async {
    debugPrint("selection Country -> ");
    id.value = item.websiteId!;

    Map<String, dynamic>? mapData = countryHelper.formMapData(item, storeConfigsList);

    if (mapData != null) {
      debugPrint('Store data == $mapData');
      localStoreModel = LocalStoreModel.fromJson(mapData);
      langSelected.value = localStoreModel?.storeViewModelList?.isNotEmpty == true
          ? localStoreModel?.storeViewModelList?.first.name ?? ''
          : '';
      currencySelected.value = localStoreModel?.storeLanguageCurrencyModelList?.isNotEmpty == true
          ? localStoreModel?.storeLanguageCurrencyModelList?.first.defaultDisplayCurrencyCode ?? ''
          : '';
      rxLanguageList.value = localStoreModel?.languageList?.toList() ?? [];
      rxCurrencyList.value = localStoreModel?.currencyList?.toList() ?? [];
      currencySelected.value = localStoreModel?.currentCurrency ?? '';
      await LocalStore.setPrefStringValue(kLocalStoreModelKey, jsonEncode(mapData));
    }
    if (isUpdate) {
      isChangeCurrency.value = false;

      countryHelper.showSelectionDialog(child: DialogContent(item), color: appSubscribeButtonColor);
      debugPrint("LocalMap -> ${jsonEncode(localStoreModel)}");
      await getCurrentLanguageCurrency();
    }
  }

  Future<void> changeLanguage() async {
    if (langSelected.value.isNotEmpty) {
      LocalStoreViewModel localStoreViewModel = localStoreModel!.storeViewModelList!
          .firstWhere((element) => element.name == langSelected.value);
      localStoreModel?.currentCode = localStoreViewModel.code;

      await LocalStore.setPrefStringValue(kLocalStoreModelKey, jsonEncode(localStoreModel));

      try {
        var langCode = localStoreViewModel.code!.split("-").last;
        if (TranslationService.locales.any((element) => element.languageCode == langCode)) {
          TranslationService.changeLocale(langCode);
        }
      } catch (e) {
        debugPrint("could not change locale");
        debugPrint(e.toString());
      }
    }
  }

  Future<void> changeCurrency() async {
    if (currencySelected.value.isNotEmpty) {
      localStoreModel?.currentCurrency = currencySelected.value;
      await LocalStore.setPrefStringValue(kLocalStoreModelKey, jsonEncode(localStoreModel));
    }
  }

  Future<void> changeName(String? name) async {
    if (name?.isNotEmpty == true) {
      localStoreModel?.name = name;
      await LocalStore.setPrefStringValue(kLocalStoreModelKey, jsonEncode(localStoreModel));
    }
  }

  void countryOnChanged(String? value) {
    if (value != null) {
      searchCountryList.value = [];
      for (StoreWebSitesModel element in storeWebsitesList) {
        if (element.name?.toLowerCase().contains(value.toLowerCase()) ?? false) {
          searchCountryList.add(element);
        }
      }
    } else {
      searchCountryList = storeWebsitesList;
    }
  }
}
