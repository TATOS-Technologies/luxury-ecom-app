import 'dart:async';

import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/home_api_repository.dart';
import 'package:meta_package/api/models/home/home_model.dart';

import '../../gen/assets.gen.dart';
import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt index = 0.obs;
  Rx<HomeModel> homePageModel = HomeModel().obs;
  final HomeAPIRepository homeAPIRepository =
      HomeAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final List<String> brandIcons = [
    Assets.images.brands.celine.path,
    Assets.images.brands.diesel.path,
    Assets.images.brands.juicy.path,
    Assets.images.brands.katespade.path,
    Assets.images.brands.kenzo.path,
    Assets.images.brands.michael.path,
    Assets.images.brands.moschino.path,
    Assets.images.brands.stoneisland.path,
    Assets.images.brands.thenorthface.path,
    Assets.images.brands.toryburch.path,
    Assets.images.brands.yeezy.path,
    Assets.images.brands.boss.path,
  ];

  PageController banner1Controller = PageController();
  PageController banner2Controller = PageController();

  HomeController();

  @override
  Future<void> onInit() async {
    super.onInit();
    await localStore.getUserDetail();
    // getMenuDataFromApi();
  }

  Future<void> getMenuDataFromApi() async {
    try {
      final HomeModel data =
          await homeAPIRepository.getAvoirHomePageMenuResponse();
      homePageModel.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }
}
