import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:suvandnat/app/data/local_data/local_store.dart';
import 'package:suvandnat/app/helper/deep_linking_service.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:meta_package/api/api_repository/splash_api_repository.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import '../../helper/notification_service.dart';

class SplashController extends GetxController {
  SplashAPIRepository splashAPIRepository =
      SplashAPIRepository(baseUrl: AppConstants.apiCountryGet);
  Rx<Color> backgroundColorValue = Colors.transparent.obs;

  SplashController();

  @override
  void onInit() async {
    super.onInit();
    await setLocalStore();
  }

  Future<void> setLocalStore() async {
    try {
      await getFCMToken();
      await localStore.getToken();
      await localStore.getGuestToken();
      localStore.checkGuest();
      bool isCall = await localStore.getStore();
      if (!isCall) {
        String countryCode = await splashAPIRepository.getSplashAPIResponse();
        if (countryCode.isNotEmpty == true) {
          await LocalStore.setPrefStringValue(
              kLocalStoreCountryCodeKey, countryCode.toString());
        }
      }
      String countryCode =
          LocalStore.getPrefStringValue(kLocalStoreCountryCodeKey);

      Get.put(
          CountryController(countryCode: countryCode, isShowDialog: !isCall),
          permanent: true);
      _navigate();
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error : e);
    }
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
