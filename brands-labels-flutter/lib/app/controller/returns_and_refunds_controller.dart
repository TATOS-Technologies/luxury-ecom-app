import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/return_api_repository.dart';
import 'package:meta_package/api/models/returns_refunds/returns_refunds_model.dart';

class ReturnsAndRefundsController extends GetxController {
  RxList<CmsText> getReturnsList = RxList<CmsText>();
  ReturnAPIRepository refundAPIRepository =
      ReturnAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ReturnsAndRefundsController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getReturnsRefundsContent();
  }

  Future<void> getReturnsRefundsContent() async {
    try {
      List<CmsText> itemsData =
          await refundAPIRepository.getReturnsRefundsApiResponse();
      if (itemsData.isNotEmpty == true) {
        getReturnsList.value = itemsData;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }
}
