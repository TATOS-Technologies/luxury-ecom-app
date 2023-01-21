import 'dart:async';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/home_api_repository.dart';
import 'package:meta_package/api/models/home/home_model.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  RxList homeList = [].obs;
  Rx<HomeModel>? homeModel = HomeModel().obs;

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  final HomeAPIRepository homeAPIRepository =
      HomeAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  HomeController();

  List<String> brandListIMG = [
    'assets/images/m_logo.png',
    'assets/images/Ralph-Lauren-Symbol 1.png',
    'assets/images/Tory_Burch_logo 1.png'
  ];

  @override
  void onInit() {
    super.onInit();
    localStore.getUserDetail();
    getMenuDataFromApi();
  }

  Future<void> getMenuDataFromApi() async {
    try {
      homeList.value = [];
      final List data = await homeAPIRepository.getHomeAPIResponse();
      if (data.isNotEmpty == true) {
        homeList.value = data;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }
}
