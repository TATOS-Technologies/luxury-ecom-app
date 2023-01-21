import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/returns_refunds/returns_refunds_model.dart';
import 'package:solo_luxury/all_imports.dart';

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
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }
}
