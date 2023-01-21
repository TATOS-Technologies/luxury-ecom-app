import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/presentation/screens/order_confirmation/widget/order_tracking_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/order_confirmation_api_repository.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';

class OrderConfirmationController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  RxString orderId = "43".obs;
  RxBool isLoading = false.obs;
  Rx<OrderConfirmationModel> orderConfirmationModel =
      OrderConfirmationModel().obs;
  final OrderConfirmationApiRepository orderConfirmationApiRepository =
      OrderConfirmationApiRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxList<OrderTrackingModel> orderTrackingList = RxList<OrderTrackingModel>();

  OrderConfirmationController();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      orderId.value = Get.arguments is String ? Get.arguments.toString() : '';
    }
    getOrderConfirmationData(orderId: orderId.value);
  }

  Future<void> getOrderConfirmationData({String? orderId}) async {
    isLoading(true);
    try {
      OrderConfirmationModel? orderConfirmationVal =
          await orderConfirmationApiRepository
              .getOrderConfirmationApiResponse(orderId!);
      orderConfirmationModel.value = orderConfirmationVal;
      getOrderTrackingList(orderConfirmationModel.value.incrementId ?? '');

      debugPrint("DATADATTATATTA=======}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
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
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
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

  String getBillingAddress() {
    final BillingAddress billingAddress =
        orderConfirmationModel.value.billingAddress ?? BillingAddress();
    return "${(billingAddress.street?.isNotEmpty ?? false) ? billingAddress.street![0] : ''}\n${billingAddress.city ?? ''}, ${billingAddress.postcode ?? ''}";
  }

  String getAddress() {
    final Address address = orderConfirmationModel.value.extensionAttributes
            ?.shippingAssignments?.first.shipping?.address ??
        Address();
    return "${(address.street?.isNotEmpty ?? false) ? address.street![0] : ''}\n${address.city ?? ''}, ${address.region ?? ''}, ${address.postcode ?? ''}";
  }

  String getTelephone() {
    return "T: ${orderConfirmationModel.value.extensionAttributes?.shippingAssignments?.first.shipping?.address?.telephone ?? ''}";
  }
}
