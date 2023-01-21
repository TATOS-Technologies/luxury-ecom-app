import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/product_list_api_repository.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/main/main.common.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class FilterController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isLoading = true.obs;
  RxList<FilterModel>? getfilterList = <FilterModel>[].obs;
  RangeValues currentRangeValues = const RangeValues(20, 60);

  ProductListAPIRepository productListAPIRepository = ProductListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  FilterController();

  RxBool isNullable = false.obs;
  RxString erroMessage = "".obs;
  List<Category>? data = [];

  RxString id = "0".obs;

  RxInt currentCategoryIndex = 0.obs;
  bool isSearch = false;

  Rx<FilterModel>? filterModel = FilterModel().obs;
  RxList<FilterModel>? filterModelList = <FilterModel>[].obs;
  RxList<FilterModel>? saveFilterModelList = <FilterModel>[].obs;
  RxList<Category>? subCategoryList = <Category>[].obs;
  RxList<Category>? saveSubCategoryList = <Category>[].obs;
  TextEditingController searchEditingController = TextEditingController();

  RxBool isFilterLoading = false.obs;
  RxMap<String, List> selectedMap = <String, List>{}.obs;
  Rx<FilterModel> selectedCategory = FilterModel().obs;

  @override
  void onInit() {
    super.onInit();
    getFilterList();
  }

  Future<void> getFilteredProducts() async {
    isFilterLoading.value = true;
    String url = "";
    selectedMap.forEach((key, value) {
      if (key == "cat") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredCatProductListEndPoint +
              value
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  )
                  .removeAllWhitespace +
              AppConstants.filteredCatProductListInConditionEndPoint;
        }
      } else if (key == "price") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredPriceProductListEndPoint +
              value
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  )
                  .removeAllWhitespace;
        }
      } else if (key == "size_v2") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredSizeProductListEndPoint +
              value
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  )
                  .removeAllWhitespace +
              AppConstants.filteredSizeProductListInConditionEndPoint;
        }
      } else if (key == "color_v2") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredColorProductListEndPoint +
              value
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  )
                  .removeAllWhitespace +
              AppConstants.filteredColorProductListInConditionEndPoint;
        }
      } else if (key == "brands") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredBrandProductListEndPoint +
              value
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  )
                  .removeAllWhitespace +
              AppConstants.filteredBrandProductListInConditionEndPoint;
        }
      }
    });
    url = url +
        AppConstants.filteredPriceProductListEndPointForPriceRangeFrom +
        currentRangeValues.start.toString() +
        AppConstants.filteredPriceFromProductListEndPoint +
        AppConstants.filteredPriceProductListEndPointForPriceRangeTo +
        currentRangeValues.end.toString() +
        AppConstants.filteredPriceToProductListEndPoint;

    debugPrint(url);

    try {
      ProductModel data = await productListAPIRepository.getFilteredProductListApiResponse(id.value + url);

      Get.back(result: data);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    } finally {
      isFilterLoading.value = false;
    }
  }

  String getPriceRangeWithCurrencyForFilter() {
    if (localStore.currentCurrency == 'EUR') {
      return '€${currentRangeValues.start.round().toString()} - €${currentRangeValues.end.round().toString()}';
    } else {
      return '${localStore.currentCurrency} ${currentRangeValues.start.round().toString()} - ${localStore.currentCurrency} ${currentRangeValues.end.round().toString()}';
    }
  }

  void checkUncheckOptions(List<Category>? childCategory2, int i) {
    childCategory2![i].isSelected.value = !childCategory2[i].isSelected.value;
    if (childCategory2[i].isSelected.value) {
      selectedMap.containsKey(
        selectedCategory.value.attrCode,
      )
          ? selectedMap.update(
              selectedCategory.value.attrCode!,
              (value) {
                List tempVal = value;
                // debugPrint( value.toString().replaceAll("[", "").replaceAll("]", "").removeAllWhitespace);
                value.contains(childCategory2[i].value)
                    ? tempVal.remove(childCategory2[i].value)
                    : tempVal.add(
                        childCategory2[i].value,
                      );
                return tempVal;
              },
            )
          : selectedMap.addAll(
              {
                selectedCategory.value.attrCode!: [
                  childCategory2[i].value,
                ]
              },
            );
    } else {
      selectedMap.containsKey(
        selectedCategory.value.attrCode,
      )
          ? selectedMap.update(
              selectedCategory.value.attrCode!,
              (value) {
                List tempVal = value;
                value.contains(
                  childCategory2[i].value,
                )
                    ? tempVal.remove(
                        childCategory2[i].value,
                      )
                    : tempVal.add(
                        childCategory2[i].value,
                      );
                return tempVal;
              },
            )
          : selectedMap.addAll(
              {
                selectedCategory.value.attrCode!: [
                  childCategory2[i].value,
                ]
              },
            );
    }
  }

  Future<void> getFilterList() async {
    id.value = Get.arguments.toString();
    debugPrint("Id Is ${id.value}");
    isLoading.value = true;

    try {
      List<FilterModel> data = await productListAPIRepository.getFilterListApiResponse(id.value);
      if (data.isNotEmpty == true) {
        filterModelList?.value = data;
        saveFilterModelList = filterModelList!;
        filterModel?.value = filterModelList?.first ?? FilterModel();
        debugPrint("model -> ${filterModel?.value.toJson()}");
        subCategoryList?.value = filterModel?.value.category ?? [];
        saveSubCategoryList?.value = filterModel?.value.category ?? [];
        selectedCategory.value = filterModel?.value ?? FilterModel();
      }
      int i = filterModelList?.indexWhere((element) => element.attrCode == 'price') ?? 0;
      if (i != -1) {
        currentRangeValues = RangeValues(
          filterModelList![i].minPrice,
          filterModelList![i].maxPrice,
        );
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  List<Category> searchFilter(String itemTitle, List<Category>? cat) {
    List<Category> results = [];
    if (itemTitle.isNotEmpty) {
      isSearch = true;
      update();

      results = cat!
          .where((element) => (element.display?.toLowerCase().toString().contains(itemTitle.toLowerCase())) ?? false)
          .toList();
      cat = results;
      debugPrint(
        "Results: ${results.length.toString()} ${cat.length.toString()}",
      );
    } else {
      isSearch = false;
      update();
      for (int i = 0; i < (filterModelList?.length ?? 0); i++) {
        if (i == currentCategoryIndex.value) {
          filterModel?.value = filterModelList![i];
          cat = filterModel?.value.category!;
        }
      }
    }
    return results;
  }
}
