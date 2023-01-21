import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/shipping_repository.dart';
import 'package:meta_package/api/models/shipping/shipping_model.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class ShippingController extends GetxController {
  RxList<CmsText> getShippingList = <CmsText>[].obs;
  RxBool isLoading = false.obs;

  final ShippingAPIRepository shippingAPIRepository =
      ShippingAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ShippingController();

  @override
  void onInit() {
    getShippingContent();
    super.onInit();
  }

  Future<void> getShippingContent() async {
    debugPrint("Get Shipping Contect ===>");
    isLoading(true);
    try {
      List<CmsText> itemsData =
          await shippingAPIRepository.getShippingApiResponse();
      if (itemsData.isNotEmpty == true) {
        getShippingList.value = itemsData;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading(false);
  }
}
