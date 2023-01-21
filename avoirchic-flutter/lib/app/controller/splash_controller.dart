import 'dart:async';

import 'package:avoirchic/app/controller/country_controller.dart';
import 'package:avoirchic/app/core/consts/constants.dart';
import 'package:avoirchic/app/data/local_data/local_store.dart';
import 'package:avoirchic/app/helper/deep_linking_service.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/splash_api_repository.dart';

import '../core/utils/app_routes.dart';

class SplashController extends GetxController {
  SplashAPIRepository splashAPIRepository =
      SplashAPIRepository(baseUrl: AppConstants.apiCountryGet);
  Rx<Color> backgroundColorValue = Colors.transparent.obs;

  SplashController();

  @override
  void onInit() {
    setLocalStore();
    super.onInit();
  }

  Future<void> setLocalStore() async {
    await localStore.getToken();
    localStore.checkGuest();
    bool isCall = await localStore.getStore();
    debugPrint("isCall -> $isCall");

    if (!isCall) {
      try {
        String countryCode = await splashAPIRepository.getSplashAPIResponse();
        debugPrint("countryCode---> $countryCode && code is:-->$countryCode");
        if (countryCode.isNotEmpty == true) {
          await LocalStore.setPrefStringValue(
              kLocalStoreCountryCodeKey, countryCode.toString());
        }
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e) {
        debugPrint(e.toString());
        ExceptionHandler.appCatchError(error: e);
      }
    }

    String countryCode =
        LocalStore.getPrefStringValue(kLocalStoreCountryCodeKey);
    Get.put(CountryController(countryCode: countryCode, isShowDialog: !isCall),
        permanent: true);
    _navigate();
  }

  Future<void> _navigate() async {
    var r = await DynamicLinkingService.getInitDynamicLinks();
    // Check if app was opened with a deeplink
    if (r == null) {
      await Future.delayed(const Duration(seconds: 2), () async {
        Get.offAllNamed(RoutesConstants.dashboardScreen);
      });
    } else {
      // App opened with deep link, push dashboard and then product details
      // The delay is optional
      Get.offAllNamed(RoutesConstants.dashboardScreen);
      Timer(const Duration(milliseconds: 250), () {
        final paths = r.link.path;
        debugPrint("on init link $paths");
        Get.toNamed(paths);
      });
    }
  }
}
