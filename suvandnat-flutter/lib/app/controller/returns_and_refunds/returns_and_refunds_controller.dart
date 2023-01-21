import 'dart:developer';

import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/return_api_repository.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:meta_package/api/models/returns_refunds/returns_refunds_model.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

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

  var isSelected1 = false.obs;
  var isSelected2 = false.obs;
  var isSelected3 = false.obs;
  var isSelected4 = false.obs;
  var isSelected5 = false.obs;

  Future<void> getReturnsRefundsContent() async {
    try {
      List<CmsText> itemsData =
          await refundAPIRepository.getReturnsRefundsApiResponse();
      if (itemsData.isNotEmpty == true) {
        getReturnsList.value = itemsData;
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error : e);
    }
  }
}
