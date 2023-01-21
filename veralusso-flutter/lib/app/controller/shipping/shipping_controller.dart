import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/shipping_repository.dart';
import 'package:meta_package/api/models/shipping/shipping_model.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';

class ShippingController extends GetxController {
  RxList<CmsText> getShippingList = <CmsText>[].obs;
  RxBool isLoading = false.obs;

  final ShippingAPIRepository shippingAPIRepository =
      ShippingAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ShippingController();

  @override
  void onInit() {
    super.onInit();
    getShippingContent();
  }

  Future<void> getShippingContent() async {
    debugPrint("Get Shipping Contect ===>");
    isLoading.value = true;

    try {
      List<CmsText> itemsData =
          await shippingAPIRepository.getShippingApiResponse();
      if (itemsData.isNotEmpty == true) {
        getShippingList.value = itemsData;
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }

    debugPrint("ok");
    isLoading.value = false;
  }
}
