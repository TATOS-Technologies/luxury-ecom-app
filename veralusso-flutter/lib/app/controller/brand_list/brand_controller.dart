import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_repository/brand_list_api_repository.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/helper/brand_grouping_helper.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';

class BrandController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isSearchEnable = false.obs;
  RxList<String> filtersearchAlllist = <String>[].obs;
  RxInt index = 0.obs;
  RxBool isSearchEnableForDetail = false.obs;
  List<BrandModel> testDataListForDetail = <BrandModel>[].obs;
  List<BrandModel> testDataList2ForDetail = <BrandModel>[].obs;
  GlobalKey<ScaffoldState> scaffoldKey2 = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  RxList<String> filterAlllist = <String>[].obs;

  RxBool isLoading = true.obs;

  RxString brandDetails = "".obs;

  List<BrandModel> testDataList = <BrandModel>[].obs;
  List<BrandModel> testDataList2 = <BrandModel>[].obs;
  HashMap<String, List<BrandModel>> brandData = HashMap();

  List<BrandModel> listDisplay(String alphabet) {
    return brandData[alphabet.toUpperCase()]?.toList() ?? [];
  }

  BrandListAPIRepository brandListAPIRepository =
      BrandListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  late BrandGroupingHelper groupHelper;

  BrandController() {
    groupHelper = BrandGroupingHelper();
  }

  @override
  void onInit() {
    super.onInit();
    getBrandList();
  }

  void setSerchwithAlphabaticForDetail(String value, String value2) {
    if (value == "") {
      isSearchEnableForDetail.value = false;
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        isSearchEnableForDetail.value = true;
        update();
        testDataListForDetail = listDisplay(value2);
        debugPrint(testDataList.toString());
        //  var value2 = value.toLowerCase();
        testDataList2ForDetail = testDataListForDetail
            .where((word) => word.name.contains(value))
            .toList();
        update();
      });
    }
  }

  int getBrandListlengthForBrandPage(String text) {
    if (isSearchEnable.value) {
      return (testDataList2.length > 10) ? 10 : testDataList2.length;
    } else {
      return (listDisplay(text).length > 10) ? 10 : listDisplay(text).length;
    }
  }

  Future<void> getBrandList() async {
    debugPrint("TEst data ");
    try {
      isLoading.value = true;
      final List<BrandModel> data =
          await brandListAPIRepository.getBrandListResponse();
      if (data.isNotEmpty == true) {
        brandData = await groupHelper.getBrandGroupList(data);
        filterAlllist.value = groupHelper.keys;
      }
      debugPrint("brands list Get $brandData");
      isLoading.value = false;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
      isLoading.value = false;
    }
  }

  bool checkBrandListEmpty() {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail.isNotEmpty;
    } else {
      return listDisplay(brandDetails.value).isNotEmpty;
    }
  }

  int getBrandListLengthForBrandDetailList() {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail.length;
    } else {
      return listDisplay(brandDetails.value).length;
    }
  }

  void continueShoppingTap() {
    searchController.text = '';
    filtersearchAlllist.value = [];
    update();
    isSearchEnable.value = false;
    getBrandList();
  }

  BrandModel getBrandDetail(int index1) {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail[index1];
    } else {
      return listDisplay(brandDetails.value)[index1];
    }
  }

  void resetMehod() {
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) {
        filtersearchAlllist.value = [];
        update();
        isSearchEnable.value = false;
        getBrandList();
      },
    );
  }

  //Loading Widgets
  void setSerchwithAlphabatic(String value) {
    if (value == "") {
      filtersearchAlllist.clear();
      isSearchEnable.value = false;
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        isSearchEnable.value = true;
        update();
        filtersearchAlllist.clear();
        testDataList = listDisplay(value[0]);
        debugPrint(testDataList.toString());
        //  var value2 = value.toLowerCase();
        testDataList2 =
            testDataList.where((word) => word.name.contains(value)).toList();
        debugPrint(testDataList2.length.toString());

        filtersearchAlllist.add("${value[0]}");
        if (testDataList2.isEmpty) {
          filtersearchAlllist.clear();
          filterAlllist.clear();
        }
        update();
      });
    }
  }
}
