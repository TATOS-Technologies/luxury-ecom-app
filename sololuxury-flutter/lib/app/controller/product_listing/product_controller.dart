import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_endpoint/product_api.dart';
import 'package:meta_package/api/api_repository/generate_cart_repo.dart';
import 'package:meta_package/api/models/product/product_model.dart'
    as product_model;
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/screens/search/widget/search_dialog.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  RxString productId = "".obs;
  RxInt selectedSortIndex = 0.obs;
  Rx<SortValue> selectedSortVal = SortValue("Relevance", "DESC").obs;
  RxList<SortValue> sortTypeList = <SortValue>[
    SortValue("Relevance", "DESC"),
    SortValue("New Arrivals", "DESC"),
    SortValue("Price(highest first)", "DESC"),
    SortValue("Price(lowest first)", "ASC"),
    SortValue("Discount(highest first)", "DESC"),
    SortValue("Discount(lowest first)", "ASC"),
  ].obs;
  Rx<FilterModel> selectedCategory = FilterModel().obs;
  Rx<product_model.ProductModel>? productModel =
      product_model.ProductModel().obs;
  RxList<product_model.ProductItem> itemList =
      <product_model.ProductItem>[].obs;
  RxString title = "".obs;
  RangeValues currentRangeValues = const RangeValues(20, 60);
  bool visibleLoader = false;

  RxInt currentCategoryIndex = 0.obs;
  List<Category>? data = [];

  RxMap<String, List> selectedMap = <String, List>{}.obs;
  bool isSearch = false;
  Rx<FilterModel>? filterModel = FilterModel().obs;
  RxList<FilterModel>? filterModelList = <FilterModel>[].obs;
  RxList<FilterModel>? saveFilterModelList = <FilterModel>[].obs;
  RxList<Category>? subCategoryList = <Category>[].obs;
  RxList<Category>? saveSubCategoryList = <Category>[].obs;
  TextEditingController searchEditingController = TextEditingController();
  MyAccountDetails userDetail = MyAccountDetails();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  RxString getCartToken = "".obs;
  RxList<SizeModel> sizeList = RxList([]);
  RxString slectSize = "".obs;
  RxList<SizeModel> chooseOption = RxList([]);
  RxList<SizeModel> listOfChoose = RxList([]);
  List<List<bool>> dotsList = [];
  List<List<String>> productImageList = [];
  RxList<RecommendedProductModel> recommendationList = RxList([]);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? argument;

  RxInt productCount = 0.obs;
  RxInt currentPage = 0.obs;
  RxBool productLoading = false.obs;
  RxBool productIsEnded = false.obs;
  RxBool fromSorting = false.obs;
  RxBool fromFilter = false.obs;
  final ScrollController scrollController = ScrollController();

  RxBool dropdownValidator = false.obs;
  RxBool dialogLoader = false.obs;

  final RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final ProductListAPIRepository productListAPIRepository =
      ProductListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  final CartGenerateAddRepository cartGenerateAddRepository;

  ProductController(this.cartGenerateAddRepository);

  @override
  void onInit() async {
    currentPage.value = 0;
    productCount.value = 0;
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    if (Get.arguments != null) {
      log('Test Argument is:->${Get.arguments[0].toString()}');
      argument = Get.arguments[0].toString();
      if (Get.arguments[0].toString() == "brand") {
        getHomeProducts(Get.arguments[1].toString(), true);
      } else {
        getHomeProducts(Get.arguments[1].toString(), false);
      }

      title.value =
          Get.arguments[2] is String ? Get.arguments[2] as String : '';
      productId.value = Get.arguments[1].toString();
    } else {
      getHomeProducts('', false);
      title.value = LanguageConstants.advancedSearchText.tr;
    }
    ProductDetailsBindings().dependencies();
    getSizeApiRes();
    getFilterData();
    super.onInit();
  }

  bool scrollNotificationData(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.pixels ==
            scrollNotification.metrics.maxScrollExtent &&
        scrollNotification.metrics.axisDirection == AxisDirection.down &&
        !productLoading.value &&
        !productIsEnded.value) {
      if (fromFilter.value) {
        getFilteredProducts();
      } else if (fromSorting.value) {
        getSortedProducts();
      } else {
        getHomeProducts(
          productId.value,
          false,
        );
      }
    }
    return true;
  }

  void onFilterClick() {
    for (var i = 0; i < (filterModelList?.length ?? 0); i++) {
      filterModelList![i].isSelected = false;
    }
    productIsEnded.value = false;
    currentPage.value = 0;
    productCount.value = 0;
    itemList.clear();
    getFilteredProducts();
    Get.back<dynamic>();
  }

  void onSortingClick() {
    productIsEnded.value = false;
    currentPage.value = 0;
    productCount.value = 0;
    itemList.clear();
    getSortedProducts();
    Get.back<dynamic>();
  }

  void clickChatEvent({String? name, String? email}) {
    Livechat.beginChat(
      AppConstants.licenceId,
      '1',
      name ?? userDetail.firstname.toString().trim(),
      email ?? userDetail.email.toString().trim(),
      {},
    );
  }

  Future<void> recommendationTap(
      int index, CartController cartController) async {
    product_model.ProductItem tempProduct = product_model.ProductItem(
      id: int.parse(recommendationList[index].productId.toString()),
      sku: recommendationList[index].sku,
    );
    Get.back<dynamic>();
    product_model.ProductItem? tempItem = await getProductDetail(tempProduct);
    if (tempItem != null) {
      Get.toNamed<dynamic>(
        RoutesConstants.productDetailsScreen,
        arguments: [tempItem, argument],
      )?.whenComplete(
        () {
          cartController.getGenerateCart();
        },
      );
    }
  }

  Future<void> addToCartPopUPTap(
      product_model.ProductItem item, CartController cartController) async {
    if (item.typeId.toString() == "configurable") {
      if (sizeList.isEmpty) {
        dropdownValidator.value = true;
      } else {
        dropdownValidator.value = false;
        dialogLoader.value = true;
        await addToCart(
            item: item,
            optionId: item.extensionAttributes?.configurableProductOptions
                    ?.first.attributeId ??
                '',
            optionValue: (item.extensionAttributes?.configurableProductOptions
                        ?.first.values?.isEmpty ==
                    true)
                ? "0"
                : (sizeList.first.value ?? '').toString());
        await cartController.fetchCart();
        dialogLoader.value = false;
      }
    } else {
      dropdownValidator.value = false;
      dialogLoader.value = true;
      await addToCart(item: item, optionId: "", optionValue: "");
      await cartController.fetchCart();
      dialogLoader.value = false;
    }
  }

  String getPriceRangeWithCurrencyForFilter() {
    if (localStore.currentCurrency == 'EUR') {
      return '€${currentRangeValues.start.round().toString()} - €${currentRangeValues.end.round().toString()}';
    } else {
      return '${localStore.currentCurrency} ${currentRangeValues.start.round().toString()} - ${localStore.currentCurrency} ${currentRangeValues.end.round().toString()}';
    }
  }

  Future<void> getHomeProducts(String val, bool isBrand) async {
    try {
      if (currentPage.value == 0) isLoading.value = true;
      productLoading.value = true;
      if (currentPage.value == 0) await getOptionsFromAPI();
      product_model.ProductModel productModelData =
          await productListAPIRepository.getProductListApiResponse(val, isBrand,
              currentPage: currentPage.value + 1,
              pageSize: 20,
              currentCurrency: localStore.currentCurrency);
      productModel?.value = productModelData;
      itemList.addAll(productModel?.value.items ?? []);
      itemList.refresh();
      productCount += (productModel?.value.items?.length ?? 0);
      currentPage.value++;
      fillValueInDotsList(itemList);
      productLoading.value = false;
      if ((productModel?.value.totalCount == productCount.value)) {
        productIsEnded.value = true;
        productLoading.value = false;
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  void fillValueInDotsList(RxList<product_model.ProductItem>? itemList) {
    dotsList = [];
    productImageList = [];
    for (product_model.ProductItem item in itemList ?? []) {
      List<String> tempImg = [];
      if (item.mediaGalleryEntries != null) {
        List<product_model.MediaGalleryEntry> tempList = item
                .mediaGalleryEntries
                ?.where((element) => element.mediaType == "image")
                .toList() ??
            [];

        for (var element in tempList) {
          if (element.file != null) {
            tempImg.add(element.file!);
          }
        }

        List<bool> list = List.generate(tempList.length, (index) => false);
        if (list.isNotEmpty) {
          list.first = true;
          dotsList.add(list);
          productImageList.add(tempImg);
        } else {
          dotsList.add(list);
          productImageList.add(tempImg);
        }
        /*productImageList = tempList.map<String>((e) => e.file ?? '')
            .toList();*/
      }
    }
  }

  Future<void> getSortedProducts() async {
    try {
      fromSorting.value = true;
      fromFilter.value = false;
      if (currentPage.value == 0) isLoading.value = true;
      productLoading.value = true;
      if (currentPage.value == 0) await getOptionsFromAPI();
      product_model.ProductModel data =
          await productListAPIRepository.getSortedProductListApiResponse(
        "$productId${ProductApi.sortedProductListEndPoint}${selectedSortVal.value.value!}",
        currentPage: currentPage.value + 1,
        pageSize: 20,
      );
      productModel?.value = data;
      itemList.addAll(productModel?.value.items ?? []);
      itemList.refresh();
      productCount += (productModel?.value.items?.length ?? 0);
      currentPage.value++;
      fillValueInDotsList(itemList);
      productLoading.value = false;
      if ((productModel?.value.totalCount == productCount.value)) {
        productIsEnded.value = true;
        productLoading.value = false;
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getFilteredProducts() async {
    try {
      fromFilter.value = true;
      fromSorting.value = false;
      if (currentPage.value == 0) isLoading.value = true;
      productLoading.value = true;
      if (currentPage.value == 0) await getOptionsFromAPI();
      String url = "";
      selectedMap.forEach((key, value) {
        if (key == "cat") {
          if (value.isNotEmpty) {
            url = url +
                ProductApi.filteredCatProductListEndPoint +
                value
                    .toString()
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .removeAllWhitespace;
          }
        } else if (key == "price") {
          if (value.isNotEmpty) {
            url = url +
                ProductApi.filteredPriceProductListEndPoint +
                value
                    .toString()
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .removeAllWhitespace;
          }
        } else if (key == "size_v2") {
          if (value.isNotEmpty) {
            url = url +
                ProductApi.filteredSizeProductListEndPoint +
                value
                    .toString()
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .removeAllWhitespace;
          }
        } else if (key == "color_v2") {
          if (value.isNotEmpty) {
            url = url +
                ProductApi.filteredColorProductListEndPoint +
                value
                    .toString()
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .removeAllWhitespace;
          }
        } else if (key == "brands") {
          if (value.isNotEmpty) {
            url = url +
                ProductApi.filteredBrandProductListEndPoint +
                value
                    .toString()
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .removeAllWhitespace;
          }
        }
      });
      url = url +
          ProductApi.filteredPriceProductListEndPointForPriceRangeFrom +
          currentRangeValues.start.toString() +
          ProductApi.filteredPriceFromProductListEndPoint +
          ProductApi.filteredPriceProductListEndPointForPriceRangeTo +
          currentRangeValues.end.toString() +
          ProductApi.filteredPriceToProductListEndPoint;
      debugPrint(url);
      product_model.ProductModel productValue =
          await productListAPIRepository.getFilteredProductListApiResponse(
        "$productId$url",
        currentPage: currentPage.value + 1,
        pageSize: 20,
      );
      productModel?.value = productValue;
      itemList.addAll(productModel?.value.items ?? []);
      itemList.refresh();
      productCount += (productModel?.value.items?.length ?? 0);
      currentPage.value++;
      fillValueInDotsList(itemList);
      productLoading.value = false;
      if ((productModel?.value.totalCount == productCount.value)) {
        productIsEnded.value = true;
        productLoading.value = false;
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  void checkUncheckOptions(List<Category>? childCategory2, int i) {
    childCategory2![i].isSelected.value = !childCategory2[i].isSelected.value;
    if (childCategory2[i].isSelected.value) {
      selectedMap.containsKey(selectedCategory.value.attrCode)
          ? selectedMap.update(
              selectedCategory.value.attrCode!,
              (value) {
                List tempVal = value;
                // debugPrint( value.toString().replaceAll("[", "").replaceAll("]", "").removeAllWhitespace);
                value.contains(childCategory2[i].value)
                    ? tempVal.remove(childCategory2[i].value)
                    : tempVal.add(childCategory2[i].value);
                return tempVal;
              },
            )
          : selectedMap.addAll(
              {
                selectedCategory.value.attrCode!: [childCategory2[i].value]
              },
            );
    } else {
      selectedMap.containsKey(selectedCategory.value.attrCode)
          ? selectedMap.update(
              selectedCategory.value.attrCode!,
              (value) {
                List tempVal = value;
                value.contains(childCategory2[i].value)
                    ? tempVal.remove(childCategory2[i].value)
                    : tempVal.add(childCategory2[i].value);
                return tempVal;
              },
            )
          : selectedMap.addAll(
              {
                selectedCategory.value.attrCode!: [childCategory2[i].value]
              },
            );
    }
  }

  Future<void> getOptionsFromAPI() async {
    try {
      if (GlobalSingleton().optionList.isEmpty) {
        List<dynamic> data =
            await productListAPIRepository.getOptionsListApiResponse();
        GlobalSingleton().optionList = data;
      }
      debugPrint("OptionList -> ${GlobalSingleton().optionList.length}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> getFilterData() async {
    try {
      if (Get.arguments != null) {
        List<FilterModel> data = await productListAPIRepository
            .getFilterListApiResponse(Get.arguments[1].toString());
        log('getFilterData Data is:-->>>$data');
        filterModelList?.value = data;
        saveFilterModelList = filterModelList!;
        filterModel?.value = filterModelList?.first ?? FilterModel();
        debugPrint("model -> ${filterModel?.value.toJson()}");
        subCategoryList?.value = filterModel?.value.category ?? [];
        saveSubCategoryList?.value = filterModel?.value.category ?? [];
        selectedCategory.value = filterModel?.value ?? FilterModel();
        int i = filterModelList
                ?.indexWhere((element) => element.attrCode == 'price') ??
            0;
        log('Index value is $i');
        if (i != -1) {
          currentRangeValues = RangeValues(
              filterModelList![i].minPrice, filterModelList![i].maxPrice);
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> deleteWishListData(String? getId, int? index) async {
    try {
      bool deleteToWishData = await wishListAPIRepository.deleteWishList(
        getId ?? '',
        localStore.userDetail.email ?? '',
      );
      if (deleteToWishData) {
        productModel?.value.items![index!].isWishList.value = false;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> postAddToWishlistData(
      context, dataName, customImage, String sku, int index) async {
    try {
      debugPrint("Here Customer Post");
      bool addToWishData = await wishListAPIRepository.addToWishList(
          sku, localStore.userDetail.email ?? '');
      debugPrint("Add To Cart Data $addToWishData");
      if (addToWishData) {
        productModel?.value.items?[index].isWishList.value = true;
        // return showWishlistDialog(context, dataName, customImage);
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      visibleLoader = false;
      update(['visibleLoader']);
    }
  }

  void changedData(int index) {
    currentCategoryIndex.value = index;
    searchEditingController.text = "";
    for (int i = 0; i < (filterModelList?.length ?? 0); i++) {
      if (i == currentCategoryIndex.value) {
        filterModel?.value = filterModelList![i];
        debugPrint("model->${filterModel?.value.toJson()}");
        subCategoryList?.value = filterModel?.value.category ?? [];
        saveSubCategoryList?.value = filterModel?.value.category ?? [];
      }
    }
  }

  List<Category>? searchFilter(String itemTitle, List<Category>? cat) {
    List<Category>? results = [];
    if (itemTitle.isNotEmpty) {
      isSearch = true;
      update();

      results = cat
          ?.where((element) =>
              (element.display
                  ?.toLowerCase()
                  .toString()
                  .contains(itemTitle.toLowerCase())) ??
              false)
          .toList();
      cat = results;
      debugPrint(
          "Results: ${results?.length.toString()} ${cat?.length.toString()}");
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

  Future<void> getSizeApiRes() async {
    try {
      List<SizeModel> data =
          await recommendedProductsAPIRepository.getChooseInSizeList();
      chooseOption.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> getChooseOption(product_model.ProductItem item) async {
    visibleLoader = true;
    update(['visibleLoader']);
    try {
      listOfChoose.value = [];
      sizeList.value = [];

      if (item.extensionAttributes?.configurableProductOptions?.isNotEmpty ??
          false) {
        item.extensionAttributes?.configurableProductOptions?.first.values
            ?.forEach((element) {
          final SizeModel sizeModel = chooseOption.firstWhere((element2) =>
              element.valueIndex.toString() == element2.value.toString());
          listOfChoose.add(sizeModel);
        });
      }
      listOfChoose.add(SizeModel(
          label: 'Size missing? Be notified when it is back in',
          value: 'Missing'));

      debugPrint("Choose Option Selecte 3 List $listOfChoose");
      await getRecommendedProductDataFromApi(item);
      visibleLoader = false;
      update(['visibleLoader']);
      debugPrint("Choose Option List 3$chooseOption");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      visibleLoader = false;
      update(['visibleLoader']);
    }
  }

  Future<void> getRecommendedProductDataFromApi(
      product_model.ProductItem item) async {
    try {
      List<RecommendedProductModel> data =
          await recommendedProductsAPIRepository
              .getRecommendedProductResponse(item.sku.toString());
      recommendationList.value = data;

      debugPrint(
          "CONTROLLER DATA ==============${recommendationList[0].typeId}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> addToCart({
    required product_model.ProductItem item,
    required String optionId,
    required String optionValue,
  }) async {
    try {
      String cartID = await cartGenerateAddRepository.addtoCart(item, sizeList);
      debugPrint(cartID);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  void showAddDialog(String? dataname, String? customimage) {
    Get.dialog<dynamic>(
      CommonAlertDialog(
        elevation: 6.0,
        radius: 0,
        contentPadding: const EdgeInsets.all(14.0),
        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        backgroundColor: const Color(0xffFBECE5),
        contentWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.clear,
                    size: 22,
                    color: appColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14.0),
            Text(
              "${LanguageConstants.youaddCartText.tr} $dataname ${LanguageConstants.youaddCartEndText.tr}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: appColor),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(color: appColor),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "${AppConstants.productImageUrl}$customimage",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0,
                                    vertical: 10.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: appColor,
                                  ),
                                  child: Text(
                                    LanguageConstants.viewCartText.tr
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  debugPrint("click");
                                  Get.toNamed<dynamic>(
                                      RoutesConstants.cartScreen);
                                  // Get.to<dynamic>(
                                  //   () => const CartScreen(),
                                  // );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          InkWell(
                            onTap: Get.back,
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14.0,
                                vertical: 10.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: appColor,
                              ),
                              child: Text(
                                LanguageConstants.continueShoppingText.tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14.0),
          ],
        ),
      ),
    );
  }

  Future<product_model.ProductItem?> getProductDetail(
      product_model.ProductItem item) async {
    visibleLoader = true;
    update(['visibleLoader']);
    try {
      product_model.ProductItem data = await recommendedProductsAPIRepository
          .getProductDetailApi(item.sku.toString());
      visibleLoader = false;
      update(['visibleLoader']);
      return data;
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    visibleLoader = false;
    update(['visibleLoader']);
    return null;
  }

  String productImage(int index) {
    return "${AppConstants.productImageUrl}${productImageList[index].first}";
  }

  Future<void> wishListOnTap(
      {product_model.ProductItem? product, int? index}) async {
    try {
      visibleLoader = true;
      update(['visibleLoader']);

      if (!itemList[index!].isWishList.value) {
        if (localStore.customerToken.isNotEmpty) {
          bool addToWishData = await wishListAPIRepository.addToWishList(
              product?.sku ?? '', localStore.userDetail.email ?? '');
          if (addToWishData) {
            visibleLoader = false;
            update(['visibleLoader']);
            itemList[index].isWishList.value = true;
            SearchDialog.showWishlistDialog(
                product?.name ?? '', productImage(index));
          }
        } else {
          WishListProductModel mainDataObj = WishListProductModel();
          mainDataObj = await localStore.getWishListData();

          ItemProduct itemProduct = ItemProduct();
          WishlistItem objProduct = WishlistItem();
          product_model.ExtensionAttributesProduct extensionAttributes =
              product_model.ExtensionAttributesProduct();
          product_model.StockItem stockItems = product_model.StockItem();
          List<ItemProduct>? lstItemProduct = mainDataObj.items ?? [];
          objProduct.id = product?.id;
          objProduct.sku = product?.sku;
          objProduct.name = product?.name;
          objProduct.attributeSetId = product?.attributeSetId;
          objProduct.price = product?.price;
          objProduct.status = product?.status;
          objProduct.visibility = product?.visibility;
          objProduct.typeId = product?.typeId;
          objProduct.createdAt = product?.createdAt;
          objProduct.updatedAt = product?.updatedAt;
          objProduct.productLinks = product?.productLinks;
          objProduct.tierPrices = product?.tierPrices;
          objProduct.customAttributes = [];
          extensionAttributes.configurableProductOptions = [];
          for (product_model.CustomAttributes element
              in product?.customAttributes ?? []) {
            product_model.CustomAttributes customAttribute =
                product_model.CustomAttributes();
            customAttribute.value = element.value.toString();
            customAttribute.attributeCode = element.attributeCode;
            objProduct.customAttributes?.add(customAttribute);
          }

          stockItems =
              convertStockItem(product?.extensionAttributes?.stockItem);

          extensionAttributes.configurableProductOptions =
              getConfigurableProduct(
                  product?.extensionAttributes?.configurableProductOptions);

          extensionAttributes.convertedRegularOldPrice =
              product?.extensionAttributes?.convertedRegularOldPrice;
          extensionAttributes.convertedRegularPrice =
              product?.extensionAttributes?.convertedRegularPrice;

          extensionAttributes.stockItem = stockItems;
          objProduct.extensionAttributes = extensionAttributes;
          itemProduct.id = product?.id;
          itemProduct.product = objProduct;

          lstItemProduct.add(itemProduct);

          mainDataObj.itemsCount = mainDataObj.items == null
              ? 1
              : (mainDataObj.items?.length ?? 0) + 1;
          mainDataObj.items = lstItemProduct;

          await LocalStore.setPrefStringValue(
            kStorageConstWishListData,
            jsonEncode(mainDataObj),
          );
          itemList[index].isWishList.value = true;
          visibleLoader = false;
          update(['visibleLoader']);
          SearchDialog.showWishlistDialog(
              product?.name ?? '', productImage(index));
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      visibleLoader = false;
      update(['visibleLoader']);
    }
  }

  product_model.StockItem convertStockItem(product_model.StockItem? stockItem) {
    product_model.StockItem stockItems = product_model.StockItem();
    stockItems.itemId = stockItem?.itemId;
    stockItems.productId = stockItem?.productId;
    stockItems.stockId = stockItem?.stockId;
    stockItems.qty = stockItem?.qty;
    stockItems.isInStock = stockItem?.isInStock;
    stockItems.isQtyDecimal = stockItem?.isQtyDecimal;
    stockItems.showDefaultNotificationMessage =
        stockItem?.showDefaultNotificationMessage;
    stockItems.useConfigMinQty = stockItem?.useConfigMinQty;
    stockItems.minQty = stockItem?.minQty;
    stockItems.useConfigMinSaleQty = stockItem?.useConfigMinSaleQty;
    stockItems.minSaleQty = stockItem?.minSaleQty;
    stockItems.useConfigMaxSaleQty = stockItem?.useConfigMaxSaleQty;
    stockItems.maxSaleQty = stockItem?.maxSaleQty;
    stockItems.useConfigBackorders = stockItem?.useConfigBackorders;
    stockItems.backorders = stockItem?.backorders;
    stockItems.useConfigNotifyStockQty = stockItem?.useConfigNotifyStockQty;
    stockItems.notifyStockQty = stockItem?.notifyStockQty;
    stockItems.useConfigQtyIncrements = stockItem?.useConfigQtyIncrements;
    stockItems.qtyIncrements = stockItem?.qtyIncrements;
    stockItems.useConfigEnableQtyInc = stockItem?.useConfigEnableQtyInc;
    stockItems.enableQtyIncrements = stockItem?.enableQtyIncrements;
    stockItems.useConfigManageStock = stockItem?.useConfigManageStock;
    stockItems.manageStock = stockItem?.manageStock;
    stockItems.isDecimalDivided = stockItem?.isDecimalDivided;
    stockItems.stockStatusChangedAuto = stockItem?.stockStatusChangedAuto;
    return stockItems;
  }

  List<product_model.ConfigurableProductOption> getConfigurableProduct(
      List<product_model.ConfigurableProductOption>?
          configurableProductOptions) {
    List<product_model.ConfigurableProductOption> configurableProductList = [];
    for (product_model.ConfigurableProductOption element
        in configurableProductOptions ?? []) {
      product_model.ConfigurableProductOption configurableProductOption =
          product_model.ConfigurableProductOption();
      List<product_model.Values> valuesList = [];

      configurableProductOption.id = element.id;
      configurableProductOption.label = element.label;
      configurableProductOption.attributeId = element.attributeId;
      configurableProductOption.position = element.position;
      configurableProductOption.productId = element.productId;

      element.values?.forEach((valueData) {
        product_model.Values values =
            product_model.Values(valueIndex: valueData.valueIndex);
        valuesList.add(values);
      });

      configurableProductOption.values = valuesList;

      configurableProductList.add(configurableProductOption);
    }
    return configurableProductList;
  }
}

class SortValue {
  final String? name;
  final String? value;

  SortValue(this.name, this.value);
}
