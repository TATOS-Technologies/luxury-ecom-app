import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/data/api/api_endpoint/about_api.dart';
import '../../presentation/common_widget/common_message/validator.dart';

class TeamsConditionController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  var collepnseIcon = [false].obs;
  CmsPageModel? teamsConditionList;

  static TeamsConditionController get to => Get.find();
  var isLoading = true.obs;

  String? countryCode;
  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  TeamsConditionController({this.countryCode});

  @override
  void onInit() {
    getTermsCondition();
    super.onInit();
  }

  var nodata = false.obs;
  var messageData = "".obs;

//CountrList
  Future<void> getTermsCondition() async {
    isLoading.value = true;
    try {
      // because of model response here instead of getTermsConditionResponse used getPrivacyPolicyResponse
      teamsConditionList = await aboutAPIRepository.getPrivacyPolicyResponse(
          endpoint: AboutApi.termAndConditionApi);
      collepnseIcon =
          (teamsConditionList?.cmsText?.map<bool>((v) => false).toList() ??
                  [false])
              .obs;
      if (teamsConditionList?.cmsText?.isEmpty == true) {
        nodata.value = false;
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
