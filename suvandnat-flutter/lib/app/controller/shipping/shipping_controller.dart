import 'dart:developer';

import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/shipping_repository.dart';
import 'package:meta_package/api/models/shipping/shipping_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

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
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
