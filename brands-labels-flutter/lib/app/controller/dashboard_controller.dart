import 'dart:async';
import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/presentation/screens/brand_list/brand_binding.dart';
import 'package:brandslabels/app/presentation/screens/checkout_order/checkout_binding.dart';
import 'package:brandslabels/app/presentation/screens/filter/filter_binding.dart';
import 'package:brandslabels/app/presentation/screens/home/home_binding.dart';
import 'package:brandslabels/app/presentation/screens/my_account/my_account_binding.dart';
import 'package:brandslabels/app/presentation/screens/product_detail/widgets/product_detail_binding.dart';
import 'package:brandslabels/app/presentation/screens/product_listing/product_list_binding.dart';
import 'package:brandslabels/app/presentation/screens/profile/profile_binding.dart';
import 'package:brandslabels/app/presentation/screens/search/search_binding.dart';
import 'package:brandslabels/app/presentation/screens/wishlist/wishlist_binding.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/dashboard_api_repository.dart';
import 'package:meta_package/api/api_repository/menu_api_repository.dart';
import 'package:meta_package/api/models/home/currency_model.dart';
import 'package:meta_package/api/models/home/logo_model.dart';
import 'package:meta_package/api/models/home/menu_model.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TabController>? tabController;
  RxList logoList = [].obs;
  RxList homeList = [].obs;
  Rx<LogoModel>? logoModel = LogoModel().obs;
  Rx<CurrencyModel>? currencyModel = CurrencyModel().obs;

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  Rx<MenuModel>? menuModel = MenuModel().obs;
  RxString appbarTitle = "".obs;

  final DashboardAPIRepository dashboardAPIRepository =
      DashboardAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final MenuAPIRepository menuAPIRepository =
      MenuAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  var isConnected = false.obs;

  DashboardController();

  @override
  void onInit() {
    tabController = TabController(initialIndex: 0, length: 5, vsync: this).obs;
    HomeBindings().dependencies();
    ProductListBinding().dependencies();
    CheckoutOrderBindings().dependencies();
    WishlistBindings().dependencies();
    ProfileBindings().dependencies();
    SearchBinding().dependencies();
    MyAccountBinding().dependencies();
    FilterBinding().dependencies();
    ProductDetailsBindings().dependencies();
    BrandBinding().dependencies();
    getMenuDataFromApi();

    initConnectivity();
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    tabController?.value.addListener(() {
      tabController?.refresh();
      appbarTitle.refresh();
    });
    super.onInit();
  }

  Future<void> getMenuDataFromApi() async {
    try {
      debugPrint("getMenuDataFromApi -> ");
      MenuModel data = await menuAPIRepository.getMenuAPIResponse();
      menuModel?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    try {
      LogoModel data1 = await dashboardAPIRepository.getLogoAPIResponse();
      log('logoModel?.value is:-->> 00 :-> ${logoModel?.value.logoUrl}');
      logoModel?.value = data1;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }

    try {
      CurrencyModel currencyModelResponse =
          await dashboardAPIRepository.getCurrencyAPIResponse();

      currencyModel?.value = currencyModelResponse;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    _updateConnectionStatus(connectivityResult);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile) {
      debugPrint('mobile');
      isConnected.value = true;
    } else if (result == ConnectivityResult.wifi) {
      debugPrint('wifi');
      isConnected.value = true;
    } else {
      debugPrint('no');
      isConnected.value = false;
    }

    isConnected.refresh();
  }
}
