import 'dart:developer';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/brand_list_api_repository.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

import 'package:meta_package/helper/brand_grouping_helper.dart';

class BrandController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  RxList<BrandModel>? getbrandList = <BrandModel>[].obs;
  RxList<BrandModel>? getsearchList = <BrandModel>[].obs;

  RxBool isLoading = true.obs;
  RxList<String> filtersearchAlllist = <String>[].obs;
  RxBool isSearchEnable = false.obs;
  List<BrandModel> testDataList = <BrandModel>[].obs;
  List<BrandModel> testDataList2 = <BrandModel>[].obs;
  List<BrandModel> testDataListForDetail = <BrandModel>[].obs;
  List<BrandModel> testDataList2ForDetail = <BrandModel>[].obs;
  GlobalKey<ScaffoldState> scaffoldKey2 = GlobalKey<ScaffoldState>();
  RxBool isSearchEnableForDetail = false.obs;
  TextEditingController searchController = TextEditingController();
  RxInt index = 0.obs;
  HashMap<String, List<BrandModel>> brandData = HashMap();

  void continueShoppingTap() {
    searchController.text = '';
    filtersearchAlllist.value = [];
    update();
    isSearchEnable.value = false;
    getBrandList();
  }

  Rx<String> brandDetails = "".obs;

  List<BrandModel> listDisplay(String alphabet) {
    return brandData[alphabet.toUpperCase()]?.toList() ?? [];
  }

  var filterAlllist = [].obs;

  BrandListAPIRepository brandListAPIRepository =
      BrandListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;
  late BrandGroupingHelper groupHelper;

  BrandController({this.countryCode}) {
    groupHelper = BrandGroupingHelper();
  }

  @override
  void onInit() {
    getBrandList();
    super.onInit();
  }

//CountrList
  Future<void> getBrandList() async {
    try {
      isLoading.value = true;
      final List<BrandModel> data =
          await brandListAPIRepository.getBrandListResponse();
      if (data.isNotEmpty == true) {
        brandData = await groupHelper.getBrandGroupList(data);
        filterAlllist.value = groupHelper.keys;
      }
      debugPrint("brands list Get $getbrandList");
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  void setSerchwithAlphabaticForDetail(String value, String value2) {
    if (value == "") {
      isSearchEnableForDetail.value = false;
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        isSearchEnableForDetail.value = true;
        update();
        testDataListForDetail = listDisplay(
          value2,
        );
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

  bool checkBrandListEmpty() {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail.isNotEmpty;
    } else {
      return listDisplay(brandDetails.value).isNotEmpty;
    }
  }

  BrandModel getBrandDetail(int index1) {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail[index1];
    } else {
      return listDisplay(brandDetails.value)[index1];
    }
  }

  int getBrandListLengthForBrandDetailList() {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail.length;
    } else {
      return listDisplay(brandDetails.value).length;
    }
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
        update();
      });
    }
  }
}
