import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/menu_api_repository.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:suvandnat/app/presentation/screens/brand_list/brand_binding.dart';
import 'package:suvandnat/app/presentation/screens/checkout_order/checkout_binding.dart';
import 'package:suvandnat/app/presentation/screens/home/bindings/home_binding.dart';
import 'package:suvandnat/app/presentation/screens/my_account/my_account_binding.dart';
import 'package:suvandnat/app/presentation/screens/product_detail/product_detail_binding.dart';
import 'package:suvandnat/app/presentation/screens/product_listing/product_list_binding.dart';
import 'package:suvandnat/app/presentation/screens/search/search_binding.dart';
import 'package:suvandnat/app/presentation/screens/wishlist/wishlist_binding.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TabController>? tabController;
  RxDouble height = 25.0.obs;

  RxObjectMixin<MenuModel>? menuModel = MenuModel().obs;

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  final MenuAPIRepository menuAPIRepository =
      MenuAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxString appbarTitle = "".obs;

  var isConnected = false.obs;

  DashboardController();

  final ScrollController scrollController = ScrollController();

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this).obs;
    HomeBindings().dependencies();
    CheckoutOrderBindings().dependencies();
    MyAccountBinding().dependencies();
    WishlistBindings().dependencies();
    ProductListBinding().dependencies();
    ProductDetailsBindings().dependencies();
    SearchBinding().dependencies();
    BrandBinding().dependencies();
    getMenuDataFromApi();

    initConnectivity();

    tabController?.value.addListener(() {
      tabController?.refresh();
    });
  }

  Future<void> getMenuDataFromApi() async {
    try {
      MenuModel menuData = await menuAPIRepository.getMenuAPIResponse();
      menuModel?.value = menuData;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
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
