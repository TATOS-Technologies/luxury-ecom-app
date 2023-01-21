import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/add_address_request/add_address_request.dart';
import 'package:meta_package/api/models/address_list/address_list.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class MyAddressController extends GetxController {
  RxInt index = 0.obs;

  AddressAPIRepository addressListAPIRepository =
      AddressAPIRepository(addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  RxBool isLoading = true.obs;
  Rx<AddressListModal> getAdressList = AddressListModal().obs;

  MyAddressController({this.countryCode});

  @override
  void onInit() {
    getAddressList();
    super.onInit();
  }

  Future<void> getAddressList() async {
    try {
      isLoading.value = true;
      AddressListModal? data = await addressListAPIRepository.getAddressListResponse();
      if (data != null) {
        getAdressList.value = data;
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addAddress() async {
    var getList = [].obs;
    for (var i in getAdressList.value.addresses!) {
      getList.add({
        AddAddressRequest(
                region: i.region,
                countryId: "${i.countryId}",
                street: i.street,
                firstname: "${i.firstname}",
                lastname: "${i.lastname}",
                telephone: "${i.telephone}",
                postcode: "${i.postcode}",
                city: "${i.city}",
                defaultShipping: i.isShipping?.value ?? false,
                defaultBilling: i.isBilling?.value ?? false)
            .toJson()
      });
    }

    AddressListModal? address = await postAddress(getList);
    if (address != null) {
      getAdressList.value = address;
    }
  }

  Future<AddressListModal?> postAddress(getaddress) async {
    try {
      debugPrint("Add Address $getaddress");
      var addaddressPost = {
        "customer": {
          "email": getAdressList.value.email.toString(),
          "firstname": getAdressList.value.firstname.toString(),
          "lastname": getAdressList.value.lastname.toString(),
          "website_id": getAdressList.value.websiteId.toString(),
          "addresses": getaddress,
        }
      };
      AddressListModal? addressListModel =
          await addressListAPIRepository.postAddAddressApiResponse(json.encode(addaddressPost));
      return addressListModel;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> billingCheckButtonOnTap(Address? address) async {
    if (getAdressList.value.defaultBilling != null && address?.id.toString() != getAdressList.value.defaultBilling) {
      getAdressList.value.addresses
          ?.firstWhere((element) => element.id == int.parse(getAdressList.value.defaultBilling ?? '0'))
          .defaultBilling = false;
    }
    getAdressList.value.addresses?.firstWhere((element) => element.id == address?.id).defaultBilling =
        !(address?.defaultBilling ?? false);
    addAddress();
  }

  Future<void> shippingCheckButtonOnTap(Address? address) async {
    if (getAdressList.value.defaultShipping != null && address?.id.toString() != getAdressList.value.defaultShipping) {
      getAdressList.value.addresses
          ?.firstWhere((element) => element.id == int.parse(getAdressList.value.defaultShipping ?? '0'))
          .defaultShipping = false;
    }
    getAdressList.value.addresses?.firstWhere((element) => element.id == address?.id).defaultShipping =
        !(address?.defaultShipping ?? false);
    addAddress();
  }
}
