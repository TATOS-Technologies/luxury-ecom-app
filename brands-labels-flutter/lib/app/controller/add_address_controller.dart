import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/add_address_request/add_address_request.dart';
import 'package:meta_package/api/models/address_list/address_list.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:meta_package/translations/translations.dart';

class AddAddressController extends GetxController {
  String countryCodeNumber = '1';

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
  List<CountryListModel> countryList = [];
  bool isFromAddAddress = Get.arguments[2] == 0;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String addressId = '';
  RxBool isScreenLoading = false.obs;

  Rx<CountryListModel> selectedCoutry = CountryListModel().obs;
  Rx<AvailableRegion> selectedState = AvailableRegion().obs;
  AddressListModal? getAddressList = Get.arguments[0] is AddressListModal
      ? Get.arguments[0] as AddressListModal
      : null;
  Rx<Address> getUpdateAddressList = Address().obs;

  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  RxBool isLoading = true.obs;
  bool isValidation = false;

  AddAddressController({this.countryCode});

  @override
  void onInit() {
    getCountryList();
    super.onInit();
  }

  Future<void> getCountryList() async {
    try {
      isLoading.value = true;
      List<CountryListModel>? countryList =
          await addressListAPIRepository.getCountryListResponse();
      if (countryList?.isNotEmpty == true) {
        getcountryList.value = countryList!;
      }
      debugPrint("country list Get $getcountryList");
      getUpdateOrNot();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  void getUpdateOrNot() {
    if (Get.arguments[2] == 1) {
      getUpdateAddressList.value = Get.arguments[1] as Address;
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

  Future<void> saveOrUpdateAddress(BuildContext context) async {
    isValidation = true;

    update(["address"]);
    if ((formKey.currentState?.validate() ?? false) && checkCountryAndState()) {
      isLoading.value = true;
      if (isFromAddAddress) {
        await addAddress(context);
        isLoading.value = false;
      } else {
        await updateAddress(context);
        isLoading.value = false;
      }
      isLoading.value = false;
    }
  }

  Future<void> addAddress(context) async {
    try {
      await addressListAPIRepository.addNewAddress(
          getAddressList!,
          AddAddressRequest(
              region: Region(
                  regionCode: selectedState.value.code,
                  region: selectedState.value.name,
                  regionId: int.parse(selectedState.value.id ?? "0")),
              countryId: selectedCoutry.value.id.toString(),
              street: [
                (address1Controller.value.text.toString()),
                (address2Controller.value.text.toString()),
                (address3Controller.value.text.toString()),
              ],
              firstname: firstNameController.value.text.toString(),
              lastname: lastNameController.value.text.toString(),
              telephone:
                  "+$countryCodeNumber${phoneNumberController.value.text.toString()}",
              postcode: zipPovinceController.value.text.toString(),
              city: cityController.value.text.toString(),
              defaultShipping: false,
              defaultBilling: false));
      Get.back(result: true);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> updateAddress(context) async {
    try {
      isScreenLoading.value = true;
      AddressListModal? address = await addressListAPIRepository.updateAddress(
          getAddressList!,
          AddAddressRequest(
              region: Region(regionCode: "TX", region: "Texas", regionId: 12),
              countryId: selectedCoutry.value.id.toString(),
              street: [
                (address1Controller.value.text.toString()),
                (address2Controller.value.text.toString()),
                (address3Controller.value.text.toString()),
              ],
              firstname: firstNameController.value.text.toString(),
              lastname: lastNameController.value.text.toString(),
              telephone: phoneNumberController.value.text.toString(),
              postcode: zipPovinceController.value.text.toString(),
              city: cityController.value.text.toString(),
              defaultShipping: true,
              defaultBilling: true),
          addressId);
      if (address != null) {
        Get.back(result: true);
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    }
    isScreenLoading.value = false;
  }
}
