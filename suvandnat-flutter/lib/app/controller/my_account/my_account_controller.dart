import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_account_repository.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/error_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class MyAccountController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxString countryCurrency = "".obs;
  bool isValidation = false;

  RxBool isLoading = true.obs;
  List<String> data = [
    LanguageConstants.myAccountText.tr,
    LanguageConstants.myOrdersText.tr,
    LanguageConstants.myWishlistText.tr,
    LanguageConstants.addressBook.tr,
    LanguageConstants.accountInformationText.tr,
    LanguageConstants.myTicketsText.tr,
  ];

  Rx<MyAccountDetails>? accountDetail = MyAccountDetails().obs;

  final MyAccountAPIRepository myAccountAPIRepository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  @override
  void onInit() {
    super.onInit();
    getCountryData();
    LocalStore.localStore.checkGuest();
    if (!LocalStore.localStore.isGuest) {
      getAccountDetails();
    }
  }

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  Future<void> getAccountDetails() async {
    debugPrint("getAccountDetailFromApi -> ");
    isLoading.value = true;
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

  Future<void> getCountryData() async {
    try {
      String data = LocalStore.getPrefStringValue(kLocalStoreModelKey);
      if (data.isNotEmpty) {
        LocalStoreModel localStoreModel =
            LocalStoreModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
        debugPrint("Get LocalMap -> ${jsonEncode(localStoreModel)}");
        countryCurrency.value = "${localStoreModel.name} (${localStoreModel.currentCurrency})";
      }
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {}
  }
}
