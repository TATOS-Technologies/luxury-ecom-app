import 'dart:async';
import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/helper/deep_linking_service.dart';

class SplashController extends GetxController {
  // Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<Color> backgroundColorValue = const Color(0xffFBECE5).obs;
  SplashAPIRepository splashAPIRepository =
      SplashAPIRepository(baseUrl: AppConstants.apiCountryGet);

  SplashController();

  @override
  Future<void> onInit() async {
    super.onInit();
    await setLocalStore();
  }

  Future<void> setLocalStore() async {
    await getFCMToken();
    await localStore.getToken();
    localStore.checkGuest();

    // package info to log error
    if (localStore.packageInfo.isEmpty) {
      await LocalStore.setPrefStringValue(kStorageConstPackageInfo,
          "${packageInfo.version}+${packageInfo.buildNumber}");
      localStore.getPackageInfo();
    }

    // device info to log error
    if (localStore.deviceInfo.isEmpty) {
      await LocalStore.setPrefStringValue(kStorageConstDeviceInfo, deviceModel);
      localStore.getDeviceInfo();
    }

    bool isCall = await localStore.getStore();
    debugPrint("isCall -> $isCall");
    if (true) {
      try {
        String countryCode = await splashAPIRepository.getSplashAPIResponse();
        if (countryCode.isNotEmpty == true) {
          await LocalStore.setPrefStringValue(
              kLocalStoreCountryCodeKey, countryCode);
        }
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e) {
        ExceptionHandler.appCatchError(error: e);
        log(e.toString(), name: "error");
      } finally {}
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
        Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
      });
    } else {
      // App opened with deep link, push dashboard and then product details
      // The delay is optional
      Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
      Timer(const Duration(milliseconds: 250), () {
        final paths = r.link.path;
        debugPrint("on init link $paths");
        Get.toNamed<dynamic>(paths);
      });
    }
  }
}
