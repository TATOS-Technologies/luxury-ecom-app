import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/order_confirmation_api_repository.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';
import 'package:solo_luxury/app/core/const/app_constants.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_message/validator.dart';

import '../my_orders/widgets/order_tracking_dialog.dart';

class OrderConfirmationController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  RxList<Items> items = <Items>[].obs;
  Rx<OrderConfirmationModel> orderConfirmationModel =
      OrderConfirmationModel().obs;
  RxBool isLoading = false.obs;
  var extensionAttributes = ExtensionAttribute().obs;
  var billingAddress = BillingAddress().obs;
  var paymentValue = Payment().obs;

  RxString orderId = "".obs;
  final OrderConfirmationApiRepository orderConfirmationApiRepository =
      OrderConfirmationApiRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxList<OrderTrackingModel> orderTrackingList = RxList<OrderTrackingModel>();

  OrderConfirmationController();

  @override
  void onInit() {
    super.onInit();
    orderId.value = Get.arguments is String ? Get.arguments as String : '';
    getOrderConfirmationData(orderId: orderId.value);
  }

  Future<void> getOrderTrackingList(String id) async {
    try {
      isLoading.value = true;
      debugPrint("getStoreDataFromApi -> ");
      List<OrderTrackingModel> returnReasonListData =
          await orderConfirmationApiRepository.getOrderTrackingResponse(
        id,
      );
      orderTrackingList.value = returnReasonListData;
      debugPrint("OrderTracking  list Get $orderTrackingList");
      debugPrint("$orderTrackingList");
      // await getReturnReasonList();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOrderConfirmationData({String orderId = ''}) async {
    try {
      isLoading(true);
      OrderConfirmationModel orderConfirmationVal =
          await orderConfirmationApiRepository
              .getOrderConfirmationApiResponse(orderId);
      orderConfirmationModel.value = (orderConfirmationVal);
      items.value = orderConfirmationModel.value.items ?? [];
      billingAddress.value =
          orderConfirmationModel.value.billingAddress ?? BillingAddress();
      paymentValue.value = orderConfirmationModel.value.payment ?? Payment();
      try {
        extensionAttributes.value =
            orderConfirmationModel.value.extensionAttributes ??
                ExtensionAttribute();
        log('extensionAttributes.value is 000:-->${extensionAttributes.value.shippingAssignments?.first.shipping?.address?.email ?? 'Data Null'}');
      } catch (e, st) {
        log('Error getOrderConfirmationData is:-->>$e && st :->$st');
      }
      log('Error getOrderConfirmationData is:-->>3333');
      isLoading(false);
      getOrderTrackingList(orderConfirmationModel.value.incrementId ?? '');
      isLoading(false);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
    } finally {
      isLoading.value = false;
    }
  }

  void showOrderTrackingDialogBox(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return OrderTrackingDialog(
          orderTrackingList: orderTrackingList,
        );
      },
    );
  }

  String additionalInformation() {
    return paymentValue.value.additionalInformation == null ||
            (paymentValue.value.additionalInformation?.isEmpty ?? true)
        ? ''
        : paymentValue.value.additionalInformation?.first ?? '';
  }
}
