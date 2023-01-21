import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/order_confirmation_api_repository.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';
import '../presentation/screens/order_confirmation/widget/order_tracking_dialog.dart';

class OrderConfirmationController extends GetxController {
  Rx<OrderConfirmationModel> orderConfirmationData =
      OrderConfirmationModel().obs;
  Rx<Address> address = Address().obs;

  RxString orderId = "1".obs;
  RxList<OrderTrackingModel> orderTrackingList = RxList<OrderTrackingModel>();

  final OrderConfirmationApiRepository orderConfirmationApiRepository =
      OrderConfirmationApiRepository(baseUrl: AppConstants.apiEndPointLogin);

  OrderConfirmationController();

  @override
  void onInit() {
    if (Get.arguments != null) {
      orderId.value = Get.arguments is String ? Get.arguments.toString() : '';
    }
    getOrderConfirmationDataFromApi(orderId.value);
    super.onInit();
  }

  RxBool isLoading = true.obs;

  var dateVal = "".obs;

  Future<void> getOrderConfirmationDataFromApi(String id) async {
    isLoading(true);
    try {
      OrderConfirmationModel? orderConfirmationVal =
          await orderConfirmationApiRepository
              .getOrderConfirmationApiResponse(id);
      debugPrint("this is orderConfirm value ; $orderConfirmationVal");
      isLoading(false);
      orderConfirmationData(orderConfirmationVal);
      debugPrint('${orderConfirmationData.value.baseDiscountAmount}');
      dateVal.value = orderConfirmationData.value.createdAt.toString();
      address.value = orderConfirmationData.value.extensionAttributes
              ?.shippingAssignments?.first.shipping?.address ??
          Address();
      getOrderTrackingList(orderConfirmationData.value.incrementId ?? '');
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("this is error while $e");
      isLoading(false);
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading(false);
  }

  Future<void> getOrderTrackingList(String id) async {
    isLoading.value = true;
    try {
      debugPrint("getStoreDataFromApi -> ");
      List<OrderTrackingModel> returnReasonListData =
          await orderConfirmationApiRepository.getOrderTrackingResponse(id);
      orderTrackingList.value = returnReasonListData;
      debugPrint("OrderTracking  list Get $orderTrackingList");
      debugPrint("$orderTrackingList");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    // await getReturnReasonList();
  }

  void showOrderTrackingDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OrderTrackingDialog(
          orderTrackingList: orderTrackingList,
        );
      },
    );
  }
}
