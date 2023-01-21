import 'dart:developer';

import 'package:avoirchic/app/controller/my_orders_controller.dart';
import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/order_confirmation_api_repository.dart';
import 'package:meta_package/api/api_repository/return_api_repository.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';
import 'package:meta_package/api/models/return_reason/return_reason_model.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';
import '../presentation/screens/order_confirmation/widget/order_tracking_dialog.dart';

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
  List<ParentItemElement> argumentData =
      (Get.arguments[1] as MyOrdersDataItem).items ?? [];
  final MyOrdersController ordersController = Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getOrderTrackingList();
    ordersController.myOrdersDataItem = myOrdersDataItem ?? MyOrdersDataItem();
  }

  Future<void> getReturnReasonList() async {
    isLoading.value = true;
    try {
      debugPrint("getStoreDataFromApi -> ");
      List<ReturnReasonModel> returnReasonListData =
          await myOrdersAPIRepository.getReturnReasonResponse();
      if (returnReasonListData.isNotEmpty == true) {
        returnReasonList.value = returnReasonListData;
      }
      debugPrint("Reason list Get $returnReasonList");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
  }

  Future<void> getOrderTrackingList() async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");
    try {
      List<OrderTrackingModel> returnReasonListData =
          await orderConfirmationApiRepository.getOrderTrackingResponse(
        (myOrdersDataItem?.incrementId ?? '').toString(),
      );
      if (returnReasonListData.isNotEmpty == true) {
        orderTrackingList.value = returnReasonListData;
        debugPrint("OrderTracking  list Get $orderTrackingList");
        debugPrint("$orderTrackingList");
      }
      debugPrint("OrderTracking  list Get $orderTrackingList");
      debugPrint("$orderTrackingList");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    // isLoading.value = false;
    await getReturnReasonList();
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

  String getCreatedDate() {
    return myOrdersDataItem?.createdAt != null
        ? DateFormat.yMMMMd().format(
            DateTime.parse(
              myOrdersDataItem?.createdAt?.toString() ?? '',
            ),
          )
        : "";
  }

  String getEstimatedShipping() {
    return myOrdersDataItem?.extensionAttributes?.estimatedShipping ?? '';
  }

  String getProductImage(int index) {
    return myOrdersDataItem?.items?[index].extensionAttributess?.productImage ??
        '';
  }

  String getItemNameCapitalizeFirst(int index) {
    return myOrdersDataItem?.items?[index].name.toString().capitalizeFirst ??
        '';
  }

  String getQtyOrdered(int index) {
    return myOrdersDataItem?.items?[index].qtyOrdered?.toString() ?? '';
  }

  String getShippingAssignments() {
    return myOrdersDataItem?.extensionAttributes?.shippingAssignments![0] !=
            null
        ? "${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.city ?? ''}, ${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.postcode ?? ''}\n\n${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.countryId ?? ''}\n\nT:${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.telephone ?? ''}"
        : '';
  }

  String getProductPrice(int index) {
    return myOrdersDataItem?.items?[index].price?.toString() ?? '';
  }

  String rawTotal(int index) {
    return myOrdersDataItem?.items?[index].rowTotal?.toString() ?? '';
  }

  void returnOnTap(int index) {
    log("${argumentData[index].extensionAttributess?.isReturnable}",
        name: "ID");

    if ((argumentData[index].extensionAttributess?.isReturnable ?? '0') ==
        '1') {
      ordersController.showReturnReasonSelectionDialog(
        fromItem: true,
        order: argumentData[index],
      );
    } else {
      ordersController.createTicketForReturnDialog(
        order: argumentData[index],
        fromItem: true,
      );
    }
  }

  void cancelOnTap(int index) {
    if ((argumentData[index].extensionAttributess?.isCancellable ?? '0') ==
        '1') {
      ordersController.showDialogBoxOpen(
        fromItem: true,
        order: argumentData[index],
      );
    } else {
      ordersController.createTicketDialog(
        order: argumentData[index],
        fromItem: true,
      );
    }
  }
}
