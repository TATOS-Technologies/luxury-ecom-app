import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/shipping/shipping_model.dart';
import 'package:solo_luxury/all_imports.dart';

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
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
    // faqModel=JsonDecoder(itemsData);
  }
}
