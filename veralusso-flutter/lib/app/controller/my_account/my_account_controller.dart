import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_account_repository.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:veralusso/app/core/const/constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/data/local_data/local_store.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/error_dialog.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class MyAccountController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isValid = false;
  List<String> data = [
    LanguageConstants.myAccountText.tr,
    LanguageConstants.myOrdersText.tr,
    LanguageConstants.myWishlistText.tr,
    LanguageConstants.addressBookText.tr,
    LanguageConstants.accountInformationText.tr,
    LanguageConstants.myTicketsText.tr,
  ];
  RxBool isLoading = true.obs;
  RxString countryCurrency = "".obs;

  Rx<MyAccountDetails>? accountDetail = MyAccountDetails().obs;

  final MyAccountAPIRepository myAccountAPIRepository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  @override
  void onInit() {
    super.onInit();
    getCountryData();
    getAccountDetails();
  }

  Future<void> getAccountDetails() async {
    debugPrint("getAccountDetailFromApi -> ");
    isLoading.value = true;
    LocalStore.localStore.checkGuest();
    if (LocalStore.localStore.isGuest) {
      isLoading.value = false;
      return;
    }
    try {
      MyAccountDetails data = await myAccountAPIRepository.getAccountDetailsResponse();
      accountDetail!.value = data;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);

      return false;
    }
    return true;
  }

  Future<void> getCountryData() async {
    try {
      String data = LocalStore.getPrefStringValue(kLocalStoreModelKey);
      if (data.isNotEmpty) {
        LocalStoreModel localStoreModel =
            LocalStoreModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
        debugPrint("Get LocalMap -> ${jsonEncode(localStoreModel)}");
        countryCurrency.value = "${localStoreModel.name} (${localStoreModel.currentCurrency})";
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {}
  }
}
