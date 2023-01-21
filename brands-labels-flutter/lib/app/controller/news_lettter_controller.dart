import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/dashboard_api_repository.dart';
import 'package:meta_package/api/models/home/logo_model.dart';

class NewsLetterController extends GetxController {
  Rx<LogoModel>? logoModel = LogoModel().obs;
  DashboardAPIRepository dashboardAPIRepository =
      DashboardAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  NewsLetterController();

  Future<void> getMenuDataFromApi() async {
    debugPrint("getMenuDataFromApi -> ");
    try {
      LogoModel data1 = await dashboardAPIRepository.getLogoAPIResponse();
      logoModel?.value = data1;
      log('logoModel?.value is:-->>${logoModel?.value}');
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  @override
  void onInit() {
    getMenuDataFromApi();
    super.onInit();
  }
}
