import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/store_api_repository.dart';
import 'package:meta_package/api/models/store_credit/store_credit_model.dart';

class StoreCreditController extends GetxController {
  RxInt index = 0.obs;

  var shoopingbiling = false.obs;

  StoreAPIRepository storeAPIRepository =
      StoreAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;

  StoreCreditController({this.countryCode});

  RxList<StoreCreditModel>? getStoreCreditList = <StoreCreditModel>[].obs;

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
    await localStore.getUserDetail();
    debugPrint(localStore.userDetail.id.toString());

    try {
      // todo verify response structure and update the response
      List<StoreCreditModel> storeCredit =
          await storeAPIRepository.getStoreCreditResponse();
      getStoreCreditList?.value = storeCredit;
      nodata.value = false;
      shoopingbiling.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }
}
