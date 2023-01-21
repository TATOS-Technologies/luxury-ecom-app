import 'dart:convert';

import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/add_address_request/add_address_request.dart';
import 'package:meta_package/api/models/address_list/address_list.dart';
import 'package:meta_package/api/services/add_address_service.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class AddressBookController extends GetxController {
  RxInt index = 0.obs;

  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  var isLoading = true.obs;
  List visibleMonth = [].obs;
  List visibleshiping = [].obs;
  Rx<AddressListModal> getAdressList = AddressListModal().obs;

  AddressBookController({this.countryCode});

  @override
  void onInit() {
    getAddressList();
    super.onInit();
  }

//CountrList
  Future<void> getAddressList() async {
    isLoading.value = true;
    try {
      final AddressListModal? data =
          await addressListAPIRepository.getAddressListResponse();
      debugPrint("Details Of Address $data");
      if (data != null) {
        getAdressList.value = data;
        debugPrint("Address List Is ${getAdressList.value.addresses?.length}");
        for (var i = 0; i < (getAdressList.value.addresses?.length ?? 0); i++) {
          visibleMonth.add(false);
          visibleshiping.add(false);
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
  }

  String getTextForName(Address? getAddress) {
    return "${getAddress?.firstname}, ${getAddress?.lastname}, ${getAddress?.street?.first}, ${getAddress?.city}, ${getAddress?.postcode}";
  }

  Future<void> addAddress() async {
    var getList = [].obs;
    for (var i in getAdressList.value.addresses!) {
      getList.add(AddAddressRequest(
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
          .toJson());
    }

    postaddress(getList);
  }

  Future<void> postaddress(getaddress) async {
    debugPrint("Add Address $getaddress");
    var addaddressPost = CustomerData(
        customer: CustomerDetails(
      email: getAdressList.value.email.toString(),
      firstname: getAdressList.value.firstname.toString(),
      lastname: getAdressList.value.lastname.toString(),
      websiteId: getAdressList.value.websiteId,
      addresses: getaddress,
    )).toJson();
    try {
      AddressListModal data = await addressListAPIRepository
          .postAddAddressApiResponse(json.encode(addaddressPost));
      getAdressList.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> billingCheckButtonOnTap(Address? address) async {
    if (getAdressList.value.defaultBilling != null &&
        address?.id.toString() != getAdressList.value.defaultBilling) {
      getAdressList.value.addresses
          ?.firstWhere((element) =>
              element.id ==
              int.parse(getAdressList.value.defaultBilling ?? '0'))
          .defaultBilling = false;
    }
    getAdressList.value.addresses
        ?.firstWhere((element) => element.id == address?.id)
        .defaultBilling = !(address?.defaultBilling ?? false);
    addAddress();
  }

  Future<void> shippingCheckButtonOnTap(Address? address) async {
    if (getAdressList.value.defaultShipping != null &&
        address?.id.toString() != getAdressList.value.defaultShipping) {
      getAdressList.value.addresses
          ?.firstWhere((element) =>
              element.id ==
              int.parse(getAdressList.value.defaultShipping ?? '0'))
          .defaultShipping = false;
    }
    getAdressList.value.addresses
        ?.firstWhere((element) => element.id == address?.id)
        .defaultShipping = !(address?.defaultShipping ?? false);
    addAddress();
  }
}
