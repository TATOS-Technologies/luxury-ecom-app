import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/data/api/api_endpoint/about_api.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class PrivacyPolicyController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  CmsPageModel? privacyPolicy;
  var isLoading = true.obs;

  RxInt index = 0.obs;

  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;

  PrivacyPolicyController({this.countryCode});

  @override
  void onInit() {
    getPrivacyPolicy();
    super.onInit();
  }

  var nodata = false.obs;
  var messageData = "".obs;

//CountrList
  Future<void> getPrivacyPolicy() async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");
    try {
      privacyPolicy = await aboutAPIRepository.getPrivacyPolicyResponse(
          endpoint: AboutApi.privacyPolicyApi);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("$e");
      Validators.appCatchError(error: e);
    }
    isLoading.value = false;
  }
}
