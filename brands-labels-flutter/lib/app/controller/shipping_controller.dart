import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/shipping_repository.dart';
import 'package:meta_package/api/models/shipping/shipping_model.dart';

class ShippingController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CmsText> getShippingList = <CmsText>[].obs;

  final ShippingAPIRepository shippingAPIRepository =
      ShippingAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ShippingController();

  @override
  void onInit() {
    super.onInit();
    getShippingContent();
  }

  Future<void> getShippingContent() async {
    try {
      debugPrint("Get Shipping Contect ===>");
      isLoading(true);
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
    } finally {
      isLoading.value = false;
    }
  }
}
