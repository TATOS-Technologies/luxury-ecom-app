import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_repository/home_api_repository.dart';
import 'package:meta_package/api/api_repository/menu_api_repository.dart';
import 'package:meta_package/api/api_repository/product_list_api_repository.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';

final CarouselController carouselController = CarouselController();
final List<String> imgList = [
  LanguageConstants.changeTHEWORLDWithYourPurchaseText.tr,
];

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt index = 0.obs;
  RxBool isLoading = true.obs;
  Rx<MenuModel>? menuModel = MenuModel().obs;
  Rx<ProductModel>? productModel = ProductModel().obs;
  RxList<ProductModel?> homeTileModel =RxList();

  RxList list = [].obs;
  final HomeAPIRepository homeAPIRepository =
      HomeAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final MenuAPIRepository menuAPIRepository = MenuAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
   final ProductListAPIRepository productListAPIRepository =
      ProductListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  HomeController();

  late TabController bannerController;

  @override
  void onInit() {
    super.onInit();
    bannerController = TabController(length: 3, vsync: this);
    getMenuDataFromApi();
  }


  
  Future<void> getMenuDataFromApi() async {
    isLoading(true);
    debugPrint("CONTROLLER DATA ==============$menuModel");
    try {
      MenuModel data = await menuAPIRepository.getMenuAPISearchResponse();
      data.childrenData!.forEach((element) async {
        print('-----${element.name}');
        homeTileModel.value.add(await getHomeProducts(element.id.toString(), false));
        homeTileModel.refresh();

      });

      menuModel?.value = data;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      Validators.appCatchError(error: e);
    } finally {
      
    }
  }

  Future<ProductModel?> getHomeProducts(String val, bool isBrand) async {
    try {
      ProductModel productModelData =
          await productListAPIRepository.getProductListApiResponse(val, isBrand,
              currentPage: 0,
              pageSize: 10,
              currentCurrency: localStore.currentCurrency);
      productModel?.value = productModelData;
      return productModelData;

      // isLoading.value = false;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
