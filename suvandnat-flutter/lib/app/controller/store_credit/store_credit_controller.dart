import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/store_api_repository.dart';
import 'package:meta_package/api/models/store_credit/store_credit_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class StoreCreditController extends GetxController {
  RxInt index = 0.obs;

  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  var shoopingbiling = true.obs;

  RxList<StoreCreditModel>? getStoreCreditList = <StoreCreditModel>[].obs;

  StoreAPIRepository storeCreditAPIRepository =
      StoreAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;

  StoreCreditController({this.countryCode});

  @override
  void onInit() {
    getStoreCredit();
    super.onInit();
  }

  var nodata = false.obs;
  var messageData = "".obs;

//CountrList
  Future<void> getStoreCredit() async {
    shoopingbiling.value = true;
    try {
      await localStore.getUserDetail();
      // todo confirm the response structure on success and need to update response strucutre
      List<StoreCreditModel> storeCredit =
          await storeCreditAPIRepository.getStoreCreditResponse();

      debugPrint("temas_condition Get $storeCredit");
      getStoreCreditList!.value = storeCredit;
      nodata.value = false;
      shoopingbiling.value = false;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      shoopingbiling.value = false;
    }
  }
}
