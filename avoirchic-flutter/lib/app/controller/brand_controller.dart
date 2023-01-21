import 'dart:collection';

import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/brand_list_api_repository.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';
import 'package:meta_package/helper/brand_grouping_helper.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class BrandController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey2 = GlobalKey<ScaffoldState>();

  RxList<BrandModel>? getbrandList = <BrandModel>[].obs;

  RxBool isSearchEnable = false.obs;
  RxBool isSearchEnableForDetail = false.obs;

  List<BrandModel> testDataList = <BrandModel>[].obs;
  List<BrandModel> testDataList2 = <BrandModel>[].obs;
  TextEditingController searchController = TextEditingController();
  RxBool isLoading = true.obs;
  Rx<String> brandDetails = "".obs;

  RxList<String> filtersearchAlllist = <String>[].obs;

  var filterAlllist = [].obs;
  HashMap<String, List<BrandModel>> brandData = HashMap();

  BrandListAPIRepository brandListAPIRepository =
      BrandListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  late BrandGroupingHelper groupHelper;

  BrandController() {
    groupHelper = BrandGroupingHelper();
  }

  @override
  void onInit() {
    getBrandList();
    super.onInit();
  }

//CountrList
  Future<void> getBrandList() async {
    isLoading.value = true;
    try {
      final List<BrandModel> data =
          await brandListAPIRepository.getBrandListResponse();
      if (data.isNotEmpty == true) {
        brandData = await groupHelper.getBrandGroupList(data);
        filterAlllist.value = groupHelper.keys;
      }
      debugPrint("brands list Get $brandData");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
  }

  RxInt index = 0.obs;

  List<BrandModel> listDisplay(String alphabet) {
    return brandData[alphabet.toUpperCase()]?.toList() ?? [];
  }

  //Loading Widgets
  void setSerchwithAlphabatic(String value) {
    //isLoading.value = true;
    if (value == "") {
      filtersearchAlllist.clear();
      isSearchEnable.value = false;
    } else {
      Future.delayed(
          const Duration(
            milliseconds: 500,
          ), () {
        isSearchEnable.value = true;
        filtersearchAlllist.clear();
        testDataList = listDisplay(value[0].toString().trimLeft());
        debugPrint(testDataList.toString());

        testDataList2 =
            testDataList.where((word) => word.name.contains(value)).toList();
        debugPrint(testDataList2.length.toString());

        filtersearchAlllist.add(value[0].toString().trimLeft());
        if (testDataList2.isEmpty) {
          filtersearchAlllist.clear();
          filterAlllist.clear();
        }
      });
    }
  }

  void continueShoppingTap() {
    searchController.text = '';
    filtersearchAlllist.value = [];
    update();
    isSearchEnable.value = false;
    getBrandList();
  }

  int getBrandListlengthForBrandPage(String text) {
    if (isSearchEnable.value) {
      return (testDataList2.length > 10) ? 10 : testDataList2.length;
    } else {
      return (listDisplay(text).length > 10) ? 10 : listDisplay(text).length;
    }
  }

  bool checkBrandListEmpty() {
    if (isSearchEnableForDetail.value) {
      return testDataList2.isNotEmpty;
    } else {
      return listDisplay(brandDetails.value).isNotEmpty;
    }
  }

  int getBrandListLengthForBrandDetailList() {
    if (isSearchEnableForDetail.value) {
      return testDataList2.length;
    } else {
      return listDisplay(brandDetails.value).length;
    }
  }

  BrandModel getBrandDetail(int index1) {
    if (isSearchEnableForDetail.value) {
      return testDataList2[index1];
    } else {
      return listDisplay(brandDetails.value)[index1];
    }
  }

  void setSerchwithAlphabaticForDetail(String value) {
    if (value == "") {
      isSearchEnableForDetail.value = false;
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        isSearchEnableForDetail.value = true;
        update();
        testDataList = listDisplay(value[0].toString().trimLeft());
        debugPrint(testDataList.toString());
        testDataList2 =
            testDataList.where((word) => word.name.contains(value)).toList();
        update();
      });
    }
  }
}
