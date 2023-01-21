import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/product_list_api_repository.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';

class FilterController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  var isLoading = true.obs;

  ProductListAPIRepository productListAPIRepository =
      ProductListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  FilterController();

  var id = "0".obs;

  // RxInt checked = 0.obs;
  RxInt currentCategoryIndex = 0.obs;
  Rx<FilterModel>? filterModel = FilterModel().obs;
  RxList<FilterModel>? filterModelList = <FilterModel>[].obs;
  RxList<FilterModel>? saveFilterModelList = <FilterModel>[].obs;
  RxList<Category>? subCategoryList = <Category>[].obs;
  RxList<Category>? saveSubCategoryList = <Category>[].obs;
  Rx<TextEditingController> searchEditingController =
      TextEditingController().obs;

  var isFilterLoading = false.obs;
  RxMap<String, List> selectedMap = <String, List>{}.obs;
  Rx<FilterModel> selectedCategory = FilterModel().obs;

  @override
  void onInit() {
    super.onInit();
    id.value = Get.arguments.toString();
    getFilterList();
  }

  Future<void> getFilterList() async {
    try {
      debugPrint("Id Is ${id.value}");
      isLoading.value = true;
      isLoading.value = true;

      List<FilterModel> data =
          await productListAPIRepository.getFilterListApiResponse(id.value);
      if (data.isNotEmpty == true) {
        filterModelList?.value = data;
        saveFilterModelList = filterModelList;
        filterModel?.value = filterModelList?.first ?? FilterModel();
        debugPrint("model -> ${filterModel?.value.toJson()}");
        subCategoryList?.value = filterModel?.value.category ?? [];
        selectedCategory.value = filterModelList?.first ?? FilterModel();
        saveSubCategoryList?.value = filterModel?.value.category ?? [];
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  void changedData(int index) {
    currentCategoryIndex.value = index;
    searchEditingController.value.text = "";
    for (int i = 0; i < (filterModelList?.length ?? 0); i++) {
      if (i == currentCategoryIndex.value) {
        filterModel?.value = filterModelList![i];
        debugPrint("model->${filterModel?.value.toJson()}");
        subCategoryList?.value = filterModel?.value.category ?? [];
        saveSubCategoryList?.value = filterModel?.value.category ?? [];
      }
    }
  }

  void searchFilter(String itemTitle) {
    List<Category> results = [];
    if (itemTitle.isNotEmpty) {
      subCategoryList?.value = saveSubCategoryList!;
      results = subCategoryList!
          .where((element) => element.display!
              .toLowerCase()
              .toString()
              .contains(itemTitle.toLowerCase()))
          .toList();
      subCategoryList?.value = results;
      debugPrint(
          "Results: ${results.length.toString()} ${subCategoryList?.length.toString()}");
    } else {
      for (int i = 0; i < (filterModelList?.length ?? 0); i++) {
        if (i == currentCategoryIndex.value) {
          filterModel?.value = filterModelList![i];
          subCategoryList?.value = filterModel?.value.category ?? [];
        }
      }
    }
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
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "price") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredPriceProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "size_v2") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredSizeProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "color_v2") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredColorProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      } else if (key == "brands") {
        if (value.isNotEmpty) {
          url = url +
              AppConstants.filteredBrandProductListEndPoint +
              value
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .removeAllWhitespace;
        }
      }
    });

    debugPrint(url);
    try {
      ProductModel data = await productListAPIRepository
          .getFilteredProductListApiResponse("${id.value}$url");
      Get.back(result: data);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isFilterLoading.value = false;
    }
  }
}
