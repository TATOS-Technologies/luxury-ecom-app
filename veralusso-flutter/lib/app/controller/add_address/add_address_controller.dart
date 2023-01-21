import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/add_address_request/add_address_request.dart';
import 'package:meta_package/api/models/address_list/address_list.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';

class AddAddressController extends GetxController {
  RxString phoneErrorMsg = "".obs;

  RxInt index = 0.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> nameCategoryList = ["Mr", "Mrs", "Ms"];

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController zipPovinceController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController address3Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  RxBool isValidation = false.obs;

  RxList<CountryListModel> getcountryList = <CountryListModel>[].obs;
  AddressListModal? getAddressList = Get.arguments[0] is AddressListModal
      ? Get.arguments[0] as AddressListModal
      : null;
  String addressId = '';
  RxBool isScreenLoading = false.obs;

  Rx<Address> getUpdateAddressList = Address().obs;
  RxBool isLoading = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool getFirstName = false.obs;

  Rx<CountryListModel> selectedCoutry = CountryListModel().obs;
  Rx<AvailableRegion> selectedState = AvailableRegion().obs;
  bool isFromAddAddress = Get.arguments[2] == 0;

  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;

  AddAddressController({this.countryCode});

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
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
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

      firstNameController.text =
          getUpdateAddressList.value.firstname.toString();
      lastNameController.text = getUpdateAddressList.value.lastname.toString();
      phoneNumberController.text =
          getUpdateAddressList.value.telephone.toString();
      zipPovinceController.text =
          getUpdateAddressList.value.postcode.toString();
      address1Controller.text =
          getUpdateAddressList.value.street?.first.toString() ?? '';
      address2Controller.text =
          getUpdateAddressList.value.street![0].toString();
      address3Controller.text =
          getUpdateAddressList.value.street![0].toString();
      cityController.text = getUpdateAddressList.value.city.toString();
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

  Future<void> addAddress(context, formKey) async {
    if (firstNameController.text != "" &&
        lastNameController.text != "" &&
        phoneNumberController.text != "" &&
        zipPovinceController.text != "" &&
        address1Controller.text != "" &&
        address2Controller.text != "" &&
        address3Controller.text != "" &&
        cityController.text != "") {
      try {
        await addressListAPIRepository.addNewAddress(
            getAddressList!,
            AddAddressRequest(
                region: Region(
                    regionCode: selectedState.value.code ?? '',
                    region: selectedState.value.name ?? '',
                    regionId: int.parse(selectedState.value.id ?? "0")),
                countryId: selectedCoutry.value.id.toString(),
                street: [(address1Controller.text), (address2Controller.text)],
                firstname: firstNameController.text,
                lastname: lastNameController.text,
                telephone: "+$countryCode${phoneNumberController.text}",
                postcode: zipPovinceController.text,
                city: cityController.text,
                defaultShipping: false,
                defaultBilling: false));
        Get.back(result: true);
      } on ApiException catch (e) {
        Validators.apiExceptionError(e: e);
      } catch (e) {
        debugPrint(e.toString());
        Validators.appCatchError(error: e);
      }
    }
  }

  Future<void> updateAddress(context) async {
    try {
      isScreenLoading.value = true;
      if (phoneNumberController.text.isEmpty) {
        phoneErrorMsg.value = LanguageConstants.contactRequired.tr;
      } else {
        phoneErrorMsg.value = "";
      }

      if (formKey.currentState?.validate() ?? false) {
        AddressListModal? address =
            await addressListAPIRepository.updateAddress(
                getAddressList!,
                AddAddressRequest(
                    region: Region(
                        regionCode: selectedState.value.code,
                        region: selectedState.value.name,
                        regionId: int.parse(selectedState.value.id ?? "0")),
                    countryId: selectedCoutry.value.id.toString(),
                    street: [
                      (address1Controller.text.toString()),
                      (address1Controller.text.toString()),
                      (address1Controller.text.toString()),
                    ],
                    firstname: firstNameController.text,
                    lastname: lastNameController.text,
                    telephone: "+$countryCode${phoneNumberController.text}",
                    postcode: zipPovinceController.text.toString(),
                    city: cityController.value.text.toString(),
                    defaultShipping: true,
                    defaultBilling: true),
                addressId);
        if (address != null) {
          Get.back(result: true);
        }
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }
}
