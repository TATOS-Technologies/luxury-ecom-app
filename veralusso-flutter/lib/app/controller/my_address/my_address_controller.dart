import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/address_list/address_list.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:veralusso/app/core/const/app_constants.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class MyAddressController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  var isLoading = true.obs;
  Rx<AddressListModal> getAdressList = AddressListModal().obs;
  List visibleMonth = [].obs;
  List visibleshiping = [].obs;

  MyAddressController({this.countryCode});

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
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }
    isLoading.value = false;
  }

  Future<void> addAddress() async {
    var getList = [].obs;
    for (var i in (getAdressList.value.addresses ?? [])) {
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

    postaddress(getList);
  }

  Future<void> postaddress(getaddress) async {
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
    try {
      AddressListModal addressList = await addressListAPIRepository
          .postAddAddressApiResponse(json.encode(addaddressPost));
      getAdressList.value = addressList;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }
  }

  void billingOnTap(Address address) {
    if (getAdressList.value.defaultBilling != null &&
        address.id.toString() != getAdressList.value.defaultBilling) {
      getAdressList.value.addresses
          ?.firstWhere((element) =>
              element.id ==
              int.parse(getAdressList.value.defaultBilling ?? '0'))
          .defaultBilling = false;
    }
    getAdressList.value.addresses
        ?.firstWhere((element) => element.id == address.id)
        .defaultBilling = !(address.defaultBilling ?? false);
    addAddress();
  }

  void shippingOnTap(Address address) {
    if (getAdressList.value.defaultShipping != null &&
        address.id.toString() != getAdressList.value.defaultShipping) {
      getAdressList.value.addresses
          ?.firstWhere((element) =>
              element.id ==
              int.parse(getAdressList.value.defaultShipping ?? '0'))
          .defaultShipping = false;
    }
    getAdressList.value.addresses
        ?.firstWhere((element) => element.id == address.id)
        .defaultShipping = !(address.defaultShipping ?? false);
    addAddress();
  }
}
