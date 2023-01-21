import 'dart:collection';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/helper/brand_grouping_helper.dart';
import 'package:solo_luxury/all_imports.dart';

class BrandController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  Rx<GlobalKey<ScaffoldState>> scaffoldKey2 = GlobalKey<ScaffoldState>().obs;
  RxBool isLoading = true.obs;
  RxList<String> filtersearchAlllist = <String>[].obs;
  List<BrandModel> testDataList = <BrandModel>[].obs;
  List<BrandModel> testDataList2 = <BrandModel>[].obs;
  RxBool isSearchEnable = false.obs;
  RxString lista = "A".obs;
  RxInt index = 0.obs;
  RxBool isSearchEnableForDetail = false.obs;
  List<BrandModel> testDataListForDetail = <BrandModel>[].obs;
  List<BrandModel> testDataList2ForDetail = <BrandModel>[].obs;
  HashMap<String, List<BrandModel>> brandData = HashMap();

  RxString brandDetails = "".obs;

  var filterAlllist = <String>[].obs;

  BrandListAPIRepository brandListAPIRepository =
      BrandListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;
  TextEditingController searchController = TextEditingController();
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
    isLoading.value = true;
    try {
      final List<BrandModel> data =
          await brandListAPIRepository.getBrandListResponse();
      if (data.isNotEmpty == true) {
        brandData = await groupHelper.getBrandGroupList(data);
        filterAlllist.value = groupHelper.keys;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
  }

  List<BrandModel> listDisplay(String alphabet) {
    debugPrint('Value ==== $alphabet');
    return brandData[alphabet.toUpperCase()]?.toList() ?? [];
  }

  //Loading Widgets
  void setSerchwithAlphabatic(String value) {
    //isLoading.value = true;
    if (value == "") {
      filtersearchAlllist.clear();
      isSearchEnable.value = false;
      // update();
      // isLoading.value = false;
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        isSearchEnable.value = true;
        // update();
        filtersearchAlllist.clear();

        testDataList = listDisplay(value[0].trimLeft());
        debugPrint(testDataList.toString());
        //  var value2 = value.toLowerCase();
        testDataList2 = testDataList
            .where((word) => word.name.contains(value.toLowerCase()))
            .toList();
        debugPrint(testDataList2.length.toString());

        filtersearchAlllist.add(value[0]);
        if (testDataList2.isEmpty) {
          filtersearchAlllist.clear();
          filterAlllist.clear();
        }
        // isLoading.value = false;
      });
    }
  }

  int getBrandListLengthForBrandDetailList() {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail.length;
    } else {
      return listDisplay(brandDetails.value).length;
    }
  }

  bool checkBrandListEmpty() {
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail.isNotEmpty;
    } else {
      return listDisplay(brandDetails.value).isNotEmpty;
    }
  }

  void setSerchwithAlphabaticForDetail(String value, String value2) {
    //isLoading.value = true;
    if (value == "") {
      isSearchEnableForDetail.value = false;
      // update();
      // isLoading.value = false;
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        isSearchEnableForDetail.value = true;
        update();
        testDataListForDetail = listDisplay(value2);
        debugPrint(testDataList.toString());
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

  BrandModel getBrandDetail(int index1) {
    debugPrint('brandDetails --- $brandDetails');
    if (isSearchEnableForDetail.value) {
      return testDataList2ForDetail[index1];
    } else {
      return listDisplay(brandDetails.value)[index1];
    }
  }

  void continueShoppingTap() {
    searchController.text = '';
    filtersearchAlllist.value = [];
    update();
    isSearchEnable.value = false;
    getBrandList();
  }
}
