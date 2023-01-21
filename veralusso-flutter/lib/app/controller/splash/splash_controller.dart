import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_repository/splash_api_repository.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/core/const/constants.dart';
import 'package:veralusso/app/data/local_data/local_store.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';

import '../../helper/notification_service.dart';

class SplashController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  SplashAPIRepository splashAPIRepository =
      SplashAPIRepository(baseUrl: AppConstants.apiCountryGet);

  SplashController();

  @override
  Future<void> onInit() async {
    await setLocalStore();

    super.onInit();
  }

  Future<void> setLocalStore() async {
    await getFCMToken();
    await localStore.getToken();
    localStore.checkGuest();
    bool isCall = await localStore.getStore();
    debugPrint("isCall -> $isCall");
    if (!isCall) {
      try {
        String countryCode = await splashAPIRepository.getSplashAPIResponse();
        if (countryCode.isNotEmpty == true) {
          await LocalStore.setPrefStringValue(
              kLocalStoreCountryCodeKey, countryCode);
        }
      } on ApiException catch (e) {
        Validators.apiExceptionError(e: e);
      } catch (e) {
        debugPrint(e.toString());
        Validators.appCatchError(error: e);
      }
    }

    String countryCode =
        LocalStore.getPrefStringValue(kLocalStoreCountryCodeKey);

    Get.put(CountryController(countryCode: countryCode, isShowDialog: !isCall),
        permanent: true);
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      Get.offAllNamed(RoutesConstants.dashboardScreen);
    });
  }
}
