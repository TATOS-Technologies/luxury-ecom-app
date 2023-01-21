import 'dart:convert';
import 'dart:developer';

import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/data/local_data/local_store.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_account_repository.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';

class MyAccountController extends GetxController {
  RxString chosenValue = LanguageConstants.myAccount.tr.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isValid = false;

  RxBool isLoading = true.obs;

  List<String> data = [
    LanguageConstants.myAccountText.tr,
    LanguageConstants.myOrdersText.tr,
    LanguageConstants.myWishlistText.tr,
    LanguageConstants.addressBook.tr,
    LanguageConstants.accountInformationText.tr,
    LanguageConstants.myTicketsText.tr,
  ];
  RxString countryCurrency = "".obs;

  Rx<MyAccountDetails>? accountDetail = MyAccountDetails().obs;

  final MyAccountAPIRepository myAccountAPIRepository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  @override
  void onInit() {
    super.onInit();
    getCountryData();
    localStore.checkGuest();

    if (!localStore.isGuest) {
      getAccountDetails();
    }
  }

  Future<void> getAccountDetails() async {
    isLoading.value = true;
    try {
      MyAccountDetails data =
          await myAccountAPIRepository.getAccountDetailsResponse();
      accountDetail?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
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
      isLoading.value = true;
      String data = LocalStore.getPrefStringValue(kLocalStoreModelKey);
      if (data.isNotEmpty) {
        LocalStoreModel localStoreModel =
            LocalStoreModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
        debugPrint("Get LocalMap -> ${jsonEncode(localStoreModel)}");
        countryCurrency.value = "${localStoreModel.name}";
      }
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
