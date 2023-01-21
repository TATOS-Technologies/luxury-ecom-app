import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/menu_api_repository.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';
import 'package:veralusso/app/presentation/screens/brand_list/brand_binding.dart';
import 'package:veralusso/app/presentation/screens/checkout_order/checkout_binding.dart';
import 'package:veralusso/app/presentation/screens/home/home_binding.dart';
import 'package:veralusso/app/presentation/screens/my_account/my_account_binding.dart';
import 'package:veralusso/app/presentation/screens/product_detail/product_detail_binding.dart';
import 'package:veralusso/app/presentation/screens/product_listing/product_list_binding.dart';
import 'package:veralusso/app/presentation/screens/profile/profile_binding.dart';
import 'package:veralusso/app/presentation/screens/search/search_binding.dart';
import 'package:veralusso/app/presentation/screens/wishlist/wishlist_binding.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  final CarouselController carouselController = CarouselController();
  final List<String> imgList = [
    LanguageConstants.changeTHEWORLDWithYourPurchaseText.tr,
  ];

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  Rx<MenuModel>? menuModel = MenuModel().obs;
  RxString appbarTitle = "".obs;

  final MenuAPIRepository menuAPIRepository =
      MenuAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  var isConnected = false.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  DashboardController();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    HomeBindings().dependencies();
    CheckoutOrderBindings().dependencies();
    ProfileBindings().dependencies();
    WishlistBindings().dependencies();
    ProductListBinding().dependencies();
    MyAccountBinding().dependencies();
    SearchBinding().dependencies();
    BrandBinding().dependencies();
    ProductDetailsBindings().dependencies();
    getMenuDataFromApi();

    initConnectivity();
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> getMenuDataFromApi() async {
    debugPrint("getMenuDataFromApi -> ");

    try {
      MenuModel data = await menuAPIRepository.getMenuAPIResponse();
      menuModel?.value = data;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }
  }

  Future<void> initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    _updateConnectionStatus(connectivityResult);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile) {
      isConnected.value = true;
    } else if (result == ConnectivityResult.wifi) {
      isConnected.value = true;
    } else {
      isConnected.value = false;
    }

    isConnected.refresh();
  }
}
