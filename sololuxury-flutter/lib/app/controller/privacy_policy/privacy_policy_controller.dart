import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';
import 'package:solo_luxury/all_imports.dart';

class PrivacyPolicyController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  CmsPageModel? privacyPolicy;

  RxInt index = 0.obs;

  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;

  var isLoading = true.obs;

  PrivacyPolicyController({this.countryCode});

  @override
  void onInit() {
    getPrivacyPolicy();
    super.onInit();
  }

  //CountrList
  Future<void> getPrivacyPolicy() async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");
    try {
      privacyPolicy = await aboutAPIRepository.getPrivacyPolicyResponse();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
