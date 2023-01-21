import 'dart:convert';

import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/address_list/address_list.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';

class AddAddressController extends GetxController {
  String countryCodenumber = '1';
  RxString phoneErrorMsg = "".obs;
  RxInt index = 0.obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController zipPovinceController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController address3Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  RxList<CountryListModel> getcountryList = RxList<CountryListModel>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String addressId = '';
  RxBool isValidation = false.obs;

  Rx<CountryListModel> selectedCoutry = CountryListModel().obs;
  Rx<AvailableRegion> selectedState = AvailableRegion().obs;
  AddressListModal? getAddressList = Get.arguments[0] is AddressListModal
      ? Get.arguments[0] as AddressListModal
      : null;

  bool isFromAddAddress = Get.arguments[2] == 0;
  RxBool isScreenLoading = false.obs;

  Rx<Address> getUpdateAddressList = Address().obs;

  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  RxBool isLoading = true.obs;

  AddAddressController({
    this.countryCode,
  });

  @override
  void onInit() {
    getCountryList();
    super.onInit();
  }

  Future<void> getCountryList() async {
    isLoading.value = true;

    try {
      List<CountryListModel>? countryList =
          await addressListAPIRepository.getCountryListResponse();
      if (countryList?.isNotEmpty == true) {
        getcountryList.value = countryList!;
        getcountryList.removeWhere(
            (element) => (element.fullNameEnglish?.isEmpty ?? true));
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
    getUpdateOrNot();
  }

  void getUpdateOrNot() {
    isLoading.value = true;
    if (Get.arguments[2] == 1) {
      getUpdateAddressList.value =
          Get.arguments[1] is Address ? Get.arguments[1] as Address : Address();
      addressId = getUpdateAddressList.value.id.toString();

      firstNameController.text = getUpdateAddressList.value.firstname ?? '';
      lastNameController.text = getUpdateAddressList.value.lastname ?? '';
      phoneNumberController.text = getUpdateAddressList.value.telephone ?? '';
      zipPovinceController.text = getUpdateAddressList.value.postcode ?? '';
      address1Controller.text = getUpdateAddressList.value.street?[0] ?? '';
      address2Controller.text = getUpdateAddressList.value.street?[1] ?? '';
      address3Controller.text = getUpdateAddressList.value.street?[2] ?? '';
      cityController.text = getUpdateAddressList.value.city ?? '';
      for (var i in getcountryList) {
        if (i.id.toString() ==
            getUpdateAddressList.value.countryId.toString()) {
          selectedCoutry.value = i;
          for (AvailableRegion j
              in selectedCoutry.value.availableRegions ?? []) {
            if (j.id.toString() ==
                (getUpdateAddressList.value.region?.regionId?.toString() ??
                    '')) {
              selectedState.value = AvailableRegion(
                code: getUpdateAddressList.value.region?.regionCode ?? '',
                id: getUpdateAddressList.value.region?.regionId.toString() ??
                    '',
                name: getUpdateAddressList.value.region?.region ?? '',
              );
            }
          }
        }
      }
    }
    isLoading.value = false;
  }

  bool checkCountryAndState() {
    if (selectedCoutry.value.id == null) {
      Get.snackbar(LanguageConstants.warning.tr,
          '${LanguageConstants.countryText.tr} ${LanguageConstants.requiredVal.tr}');
      return false;
    }
    if (selectedState.value.id == null) {
      Get.snackbar(LanguageConstants.warning.tr,
          '${LanguageConstants.stateText.tr} ${LanguageConstants.requiredVal.tr}');
      return false;
    }
    return true;
  }

  Future<void> addAddress(
      BuildContext context, GlobalKey<FormState> formKey) async {
    if ((formKey.currentState?.validate() ?? false) && checkCountryAndState()) {
      if (phoneNumberController.text.isEmpty) {
        phoneErrorMsg.value = "Phone is required";
      } else {
        phoneErrorMsg.value = "";
      }
      var getList = [].obs;
      for (var i in getAddressList?.addresses ?? []) {
        getList.add(
          {
            "region": i.region?.toJson() ?? {},
            "country_id": "${i.countryId}",
            "street": i.street,
            "Firstname": "${i.firstname}",
            "lastname": "${i.lastname}",
            "telephone": "+$countryCodenumber${i.telephone}",
            "postcode": "${i.postcode}",
            "city": "${i.city}",
            "default_shipping": i.isShipping?.value ?? false,
            "default_billing": i.isBilling?.value ?? false,
          },
        );
      }
      getList.add({
        "region": {
          "region_code": selectedState.value.code ?? '',
          "region": selectedState.value.name ?? '',
          "region_id": selectedState.value.id ?? '',
        },
        "country_id": selectedCoutry.value.id.toString(),
        "street": [
          (address1Controller.value.text.toString()),
          (address2Controller.value.text.toString()),
          (address3Controller.value.text.toString()),
        ],
        "Firstname": firstNameController.value.text.toString(),
        "lastname": lastNameController.value.text.toString(),
        "telephone":
            "+$countryCodenumber${phoneNumberController.value.text.toString()}",
        "postcode": zipPovinceController.value.text.toString(),
        "city": cityController.value.text.toString(),
        "default_shipping": false,
        "default_billing": false
      });

      await postaddress(context, getList);
    }
  }

  Future<void> postaddress(context, getaddress) async {
    debugPrint("Add Address $getaddress");
    var addaddressPost = {
      "customer": {
        "email": getAddressList?.email.toString(),
        "firstname": getAddressList?.firstname.toString(),
        "lastname": getAddressList?.lastname.toString(),
        "website_id": getAddressList?.websiteId.toString(),
        "addresses": getaddress,
      }
    };
    try {
      await addressListAPIRepository
          .postAddAddressApiResponse(json.encode(addaddressPost));
      isScreenLoading.value = false;
      Get.back(result: true);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> updateAddress(
      BuildContext context, GlobalKey<FormState> formKey) async {
    try {
      isScreenLoading.value = true;
      if ((formKey.currentState?.validate() ?? false) &&
          checkCountryAndState()) {
        List<Map<String, dynamic>> getList = <Map<String, dynamic>>[].obs;
        for (Address i in getAddressList?.addresses ?? []) {
          if (i.id.toString() == addressId) {
            getList.add({
              "region": {
                "region_code": selectedState.value.code,
                "region": selectedState.value.name,
                "region_id": selectedState.value.id,
              },
              "country_id": selectedCoutry.value.id.toString(),
              "street": [
                (address1Controller.value.text.toString()),
                (address2Controller.value.text.toString()),
                (address3Controller.value.text.toString()),
              ],
              "Firstname": firstNameController.value.text.toString(),
              "lastname": lastNameController.value.text.toString(),
              "telephone": phoneNumberController.value.text.toString(),
              "postcode": zipPovinceController.value.text.toString(),
              "city": cityController.value.text.toString(),
              "default_shipping": true,
              "default_billing": true
            });
          } else {
            getList.add({
              "region": i.region,
              "country_id": "${i.countryId}",
              "street": i.street,
              "Firstname": "${i.firstname}",
              "lastname": "${i.lastname}",
              "telephone": "${i.telephone}",
              "postcode": "${i.postcode}",
              "city": "${i.city}",
              "default_shipping": i.isShipping?.value ?? false,
              "default_billing": i.isBilling?.value ?? false
            });
          }
        }
        await postupdateaddress(context, getList);
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }

  Future<void> postupdateaddress(
      context, List<Map<String, dynamic>> getaddress) async {
    debugPrint("Add Address $getaddress");
    var addAddressPost = {
      "customer": {
        "email": getAddressList?.email.toString(),
        "firstname": getAddressList?.firstname.toString(),
        "lastname": getAddressList?.lastname.toString(),
        "website_id": getAddressList?.websiteId.toString(),
        "addresses": getaddress,
      }
    };
    try {
      await addressListAPIRepository
          .postAddAddressApiResponse(json.encode(addAddressPost));
      isScreenLoading.value = false;
      Get.back(result: true);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  String selectedOrHintText() {
    return selectedState.value.name.toString() == "null" ||
            selectedState.value.name == ""
        ? LanguageConstants.stateText.tr
        : selectedState.value.name.toString();
  }

  String buttonText() {
    return isFromAddAddress ? 'Save Address' : 'Update Address';
  }
}
