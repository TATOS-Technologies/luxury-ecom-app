import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/order_confirmation_api_repository.dart';
import 'package:meta_package/api/api_repository/return_api_repository.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';
import 'package:meta_package/api/models/return_reason/return_reason_model.dart';
import 'package:veralusso/app/controller/my_orders/my_orders_controller.dart';
import 'package:veralusso/app/controller/my_orders/widgets/order_tracking_dialog.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';

class OrderDetailsController extends GetxController {
  RxInt index = 0.obs;

  final ReturnAPIRepository myOrdersAPIRepository =
      ReturnAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final OrderConfirmationApiRepository orderConfirmationApiRepository =
      OrderConfirmationApiRepository(baseUrl: AppConstants.apiEndPointLogin);

  OrderDetailsController();

  RxList<ReturnReasonModel> returnReasonList = RxList<ReturnReasonModel>();
  RxList<OrderTrackingModel> orderTrackingList = RxList<OrderTrackingModel>();
  RxBool isLoading = true.obs;
  final MyOrdersDataItem? myOrdersDataItem =
      Get.arguments[1] is MyOrdersDataItem
          ? Get.arguments[1] as MyOrdersDataItem
          : null;
  final MyOrdersController ordersController = Get.find();

  @override
  void onInit() {
    getOrderTrackingList();
    ordersController.argumentData12 = myOrdersDataItem ?? MyOrdersDataItem();
    super.onInit();
  }

  Future<void> returnOnTap(int index) async {
    if ((myOrdersDataItem?.items?[index].extensionAttributess?.isReturnable ??
            '0') ==
        '1') {
      ordersController.showReturnReasonSelectionDialog(
        fromItem: true,
        order: myOrdersDataItem?.items?[index],
      );
    } else {
      ordersController.createTicketForReturnDialog(
        order: myOrdersDataItem?.items?[index],
        fromItem: true,
      );
    }
  }

  Future<void> getReturnReasonList() async {
    List<ReturnReasonModel> returnReasonListData =
        await myOrdersAPIRepository.getReturnReasonResponse();
    returnReasonList.value = returnReasonListData;
    debugPrint("Reason list Get $returnReasonList");
  }

  Future<void> getOrderTrackingList() async {
    try {
      isLoading.value = true;
      List<OrderTrackingModel> returnReasonListData =
          await orderConfirmationApiRepository.getOrderTrackingResponse(
        myOrdersDataItem?.incrementId.toString() ?? '',
      );
      orderTrackingList.value = returnReasonListData;
      await getReturnReasonList();
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  String getProductImage(int index) {
    return myOrdersDataItem?.items?[index].extensionAttributess?.productImage ??
        '';
  }

  String getOrderCurrencyCode(int index) {
    return myOrdersDataItem?.orderCurrencyCode?.toString() ?? '';
  }

  String getShippingAddress() {
    return myOrdersDataItem?.extensionAttributes?.shippingAssignments![0] ==
            null
        ? ""
        : "${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.city ?? ''}, ${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.postcode ?? ''}\n${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.countryId ?? ''}\nT:${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.telephone ?? ''}";
  }

  String getBillingAddress() {
    return "${myOrdersDataItem?.billingAddress?.street![0]},\n${myOrdersDataItem?.billingAddress?.city}, ${myOrdersDataItem?.billingAddress?.postcode}\n${myOrdersDataItem?.billingAddress?.countryId}\nT:${myOrdersDataItem?.billingAddress?.telephone}";
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
