import 'dart:async';

import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/data/local_data/local_store.dart';
import 'package:brandslabels/app/helper/deep_linking_service.dart';
import 'package:brandslabels/app/helper/notification_service.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/splash_api_repository.dart';

class SplashController extends GetxController {
  Rx<Color> backgroundColorValue = Colors.white.obs;
  SplashAPIRepository splashAPIRepository =
      SplashAPIRepository(baseUrl: AppConstants.apiCountryGet);

  SplashController();

  @override
  void onInit() async {
    super.onInit();
    await setLocalStore();
  }

  Future<void> setLocalStore() async {
    await getFCMToken();
    await localStore.getToken();
    localStore.checkGuest();
    bool isCall = await localStore.getStore();
    debugPrint(
        "isCall -> $isCall && ${localStore.customerToken} && ${localStore.userDetail.id}");
    if (!isCall) {
      try {
        String countryCode = await splashAPIRepository.getSplashAPIResponse();
        if (countryCode.isNotEmpty == true) {
          await LocalStore.setPrefStringValue(
              kLocalStoreCountryCodeKey, countryCode.toString());
          debugPrint("countryCode---> $countryCode");
        }
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e) {
        debugPrint(e.toString());
        ExceptionHandler.appCatchError(error: e);
      } finally {}
    }
    String countryCode =
        LocalStore.getPrefStringValue(kLocalStoreCountryCodeKey);

    Get.put(CountryController(countryCode: countryCode, isShowDialog: !isCall),
        permanent: true);
    await _navigate();
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
