import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import '../../data/api/api_endpoint/about_api.dart';

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

  var nodata = false.obs;
  var messageData = "".obs;

  //CountrList
  Future<void> getPrivacyPolicy() async {
    isLoading.value = true;
    try {
      privacyPolicy = await aboutAPIRepository.getPrivacyPolicyResponse(
          endpoint: AboutApi.privacyPolicyApi);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
