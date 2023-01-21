import 'dart:collection';
import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/brand_list_api_repository.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';
import 'package:meta_package/helper/brand_grouping_helper.dart';

class BrandController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> scaffoldKey2 = GlobalKey<ScaffoldState>();

  RxList<BrandModel>? getbrandList = <BrandModel>[].obs;
  var brandList = <BrandModel>[].obs;
  RxBool isSearchEnable = false.obs;
  List<BrandModel> testDataList = <BrandModel>[].obs;
  List<BrandModel> testDataList2 = <BrandModel>[].obs;
  List<BrandModel> testDataListForDetail = <BrandModel>[].obs;
  List<BrandModel> testDataList2ForDetail = <BrandModel>[].obs;
  TextEditingController searchController = TextEditingController();
  RxBool isSearchEnableForDetail = false.obs;
  List<String> list = [];
  RxList<String> filtersearchAlllist = <String>[].obs;
  RxInt index = 0.obs;

  var isLoading = true.obs;
  var filterAlllist = [].obs;

  var isClick = false.obs;
  Rx<String> brandDetails = "".obs;
  HashMap<String, List<BrandModel>> brandData = HashMap();

  bool checkBrandListEmpty() {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail.isNotEmpty;
    } else {
      return listDisplay(brandDetails.value).isNotEmpty;
    }
  }

  void continueShoppingTap() {
    searchController.text = '';
    filtersearchAlllist.value = [];
    update();
    isSearchEnable.value = false;
    getBrandList();
  }

  int getBrandListLengthForBrandDetailList() {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail.length;
    } else {
      return listDisplay(brandDetails.value).length;
    }
  }

  int getBrandListlengthForBrandPage(String text) {
    if (isSearchEnable.value) {
      return (testDataList2.length > 10) ? 10 : testDataList2.length;
    } else {
      return (listDisplay(text).length > 10) ? 10 : listDisplay(text).length;
    }
  }

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

  Future<void> getBrandList() async {
    isLoading.value = true;
    try {
      final List<BrandModel> data =
          await brandListAPIRepository.getBrandListResponse();
      if (data.isNotEmpty == true) {
        brandData = await groupHelper.getBrandGroupList(data);
        filterAlllist.value = groupHelper.keys;
      }
      debugPrint("brands list Get $getbrandList");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
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

        filtersearchAlllist.add("${value[0].toString().trimLeft()}");
        if (testDataList2.isEmpty) {
          filtersearchAlllist.clear();
          filterAlllist.clear();
        }
        update();
      });
    }
  }

  void resetMethod() {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      filtersearchAlllist.value = [];
      update();
      isSearchEnable.value = false;
      getBrandList();
    });
  }

  BrandModel getBrandDetail(int index1) {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail[index1];
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
        testDataListForDetail = listDisplay(value[0].toString().trimLeft());
        debugPrint(testDataList.toString());

        testDataList2ForDetail = testDataListForDetail
            .where((word) => word.name.contains(value))
            .toList();
        update();
      });
    }
  }
}
