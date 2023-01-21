import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_repository/return_api_repository.dart';
import 'package:meta_package/api/models/returns_refunds/returns_refunds_model.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:veralusso/app/core/const/app_constants.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class ReturnsAndRefundsController extends GetxController {
  RxList<CmsText> getReturnsList = RxList<CmsText>();
  ReturnAPIRepository refundAPIRepository =
      ReturnAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ReturnsAndRefundsController();

  @override
  void onInit() {
    super.onInit();
    getReturnsRefundsContent();
  }

  Future<void> getReturnsRefundsContent() async {
    try {
      List<CmsText>? itemsData =
          await refundAPIRepository.getReturnsRefundsApiResponse();
      if (itemsData.isNotEmpty == true) {
        getReturnsList.value = itemsData;
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }

    debugPrint("ITEAM DATA +++++++++++++++${getReturnsList.length}");
  }
}
