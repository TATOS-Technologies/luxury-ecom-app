import 'dart:developer';

import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/presentation/screens/track_your_order/track_your_nofounddata_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/track_your_order_repository.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class TrackYourOrderController extends GetxController {
  Rx<MyOrdersData> myOrdersModel = MyOrdersData().obs;
  RxBool isLoading = false.obs;
  TextEditingController orderNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidation = false;

  //1740027

  final TrackYourOrderAPIRepository trackYourOrderAPIRepository =
      TrackYourOrderAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  TrackYourOrderController();

  Future<void> getTrackYourOrder() async {
    debugPrint("Get getTrackYourOrder ===>");
    isLoading.value = true;

    try {
      MyOrdersData itemsData = await trackYourOrderAPIRepository
          .getTrackYourOrderApiResponse(orderNumberController.text);
      myOrdersModel.value = itemsData;
      log('Hello 123 :-->> ${(myOrdersModel.value.items?.isNotEmpty ?? false)}');
      if (myOrdersModel.value.items?.isNotEmpty ?? false) {
        Get.toNamed(RoutesConstants.orderDetailsScreen, arguments: [
          '',
          myOrdersModel.value.items?.first ?? MyOrdersDataItem()
        ]);
      } else {
        Get.to(() => const TrackYourRequestNegative());
      }
      isLoading.value = false;
      orderNumberController.clear();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(
          e: e,
          callBack: (String errorMsg) {
            Get.to(() => const TrackYourRequestNegative());
          });
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
