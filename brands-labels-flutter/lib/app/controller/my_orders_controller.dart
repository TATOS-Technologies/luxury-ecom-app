import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_orders_api_repository.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

class MyOrdersController extends GetxController {
  RxInt index = 0.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<MyOrdersData>? myOrdersModel = MyOrdersData().obs;

  final MyOrdersAPIRepository myOrdersAPIRepository =
      MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxBool isLoading = true.obs;

  MyOrdersController();

  @override
  void onInit() {
    super.onInit();
    getMyOrders();
  }

  Future<void> getMyOrders() async {
    isLoading.value = true;
    try {
      MyOrdersData data = await myOrdersAPIRepository
          .getMyOrdersApiResponse(localStore.userDetail.email);
      myOrdersModel?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }

    debugPrint("MyOrder List Is ${myOrdersModel?.value}");
  }

  bool isOrderIsEmpty() {
    return myOrdersModel?.value.items == null ||
        (myOrdersModel?.value.items?.isEmpty ?? true);
  }
}
