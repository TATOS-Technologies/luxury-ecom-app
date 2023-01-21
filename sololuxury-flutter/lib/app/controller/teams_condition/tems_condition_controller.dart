import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/terms_and_conditions/terms_and_condition_model.dart';
import 'package:solo_luxury/all_imports.dart';

class TermAndConditionController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  Rx<TermsAndConditionsModel> termsAndConditionsModel =
      TermsAndConditionsModel().obs;

  RxInt index = 0.obs;
  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;

  var isLoading = true.obs;

  TermAndConditionController({this.countryCode});

  @override
  void onInit() {
    getPrivacyPolicy();
    super.onInit();
  }

  //CountrList
  Future getPrivacyPolicy() async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");

    try {
      TermsAndConditionsModel privacyPolicy =
          await aboutAPIRepository.getTermsConditionResponse();
      termsAndConditionsModel.value = privacyPolicy;
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
