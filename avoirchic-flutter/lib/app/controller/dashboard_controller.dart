// ignore_for_file: duplicate_import

import 'dart:async';

import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/presentation/screens/brand_list/brand_binding.dart';
import 'package:avoirchic/app/presentation/screens/home/home_binding.dart';
import 'package:avoirchic/app/presentation/screens/my_account/my_account_binding.dart';
import 'package:avoirchic/app/presentation/screens/product_listing/product_list_binding.dart';
import 'package:avoirchic/app/presentation/screens/profile/profile_binding.dart';
import 'package:avoirchic/app/presentation/screens/search/search_binding.dart';
import 'package:avoirchic/app/presentation/screens/wishlist/wishlist_binding.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/menu_api_repository.dart';
import 'package:meta_package/api/models/home/menu_model.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';
import '../presentation/screens/checkout_order/checkout_binding.dart';
import '../presentation/screens/home/home_binding.dart';
import '../presentation/screens/my_account/my_account_binding.dart';
import '../presentation/screens/product_detail/product_detail_binding.dart';
import '../presentation/screens/product_listing/product_list_binding.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late Rx<TabController> tabController;

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  Rx<MenuModel>? menuModel = MenuModel().obs;
  RxString appbarTitle = "".obs;

  final MenuAPIRepository menuAPIRepository =
      MenuAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  var isConnected = false.obs;

  DashboardController();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    ).obs;
    HomeBindings().dependencies();
    CheckoutOrderBindings().dependencies();
    ProfileBindings().dependencies();
    ProductListBinding().dependencies();
    CheckoutOrderBindings().dependencies();
    WishlistBindings().dependencies();
    MyAccountBinding().dependencies();
    ProductDetailsBindings().dependencies();
    BrandBinding().dependencies();
    SearchBinding().dependencies();
    getMenuDataFromApi();

    tabController.value.addListener(() {
      tabController.refresh();
    });

    initConnectivity();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> getMenuDataFromApi() async {
    debugPrint("getMenuDataFromApi -> ");

    try {
      MenuModel data = await menuAPIRepository.getMenuAPIResponse();
      menuModel?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    SearchBinding().dependencies();
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
