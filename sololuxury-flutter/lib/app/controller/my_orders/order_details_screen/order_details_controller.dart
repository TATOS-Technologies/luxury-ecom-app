import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:solo_luxury/app/controller/my_orders/widgets/order_tracking_dialog.dart';
import 'package:solo_luxury/app/controller/my_orders/widgets/show_success_dialog.dart';
import 'package:solo_luxury/app/controller/my_orders/widgets/show_ticket_response.dart';

import '../../../../all_imports.dart';

class OrderDetailsController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  final ReturnAPIRepository myOrdersAPIRepository =
      ReturnAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final OrderConfirmationApiRepository orderConfirmationApiRepository =
      OrderConfirmationApiRepository(baseUrl: AppConstants.apiEndPointLogin);

  OrderDetailsController();

  RxList<ReturnReasonModel> returnReasonList = RxList<ReturnReasonModel>();
  RxList<OrderTrackingModel> orderTrackingList = RxList<OrderTrackingModel>();
  final MyOrdersController ordersController = Get.find();

  RxBool isLoading = true.obs;
  final MyOrdersDataItem? myOrdersDataItem =
      Get.arguments[1] is MyOrdersDataItem
          ? Get.arguments[1] as MyOrdersDataItem
          : null;

  @override
  void onInit() {
    getOrderTrackingList();
    ordersController.argumentData12 = myOrdersDataItem ?? MyOrdersDataItem();
    super.onInit();
  }

  Rx<ReturnReasonModel> selectReturnReason = ReturnReasonModel().obs;

  Future<void> getReturnReasonList() async {
    try {
      debugPrint("getStoreDataFromApi -> ");
      List<ReturnReasonModel> returnReasonListData =
          await myOrdersAPIRepository.getReturnReasonResponse();
      returnReasonList.value = returnReasonListData;
      debugPrint("Reason list Get $returnReasonList");
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOrderTrackingList() async {
    try {
      isLoading.value = true;
      debugPrint("getStoreDataFromApi -> ");
      List<OrderTrackingModel> returnReasonListData =
          await orderConfirmationApiRepository.getOrderTrackingResponse(
        myOrdersDataItem?.incrementId.toString() ?? '',
      );
      orderTrackingList.value = returnReasonListData;
      debugPrint("OrderTracking  list Get $orderTrackingList");
      debugPrint("$orderTrackingList");
      await getReturnReasonList();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  //Post Return Item Data
  // fixme enable when needed
  /*Future<void> postReturnItem(order, BuildContext context) async {
    try {
      Map<String, dynamic> postReturnItem =
          await myOrdersAPIRepository.postReturnItemAPIResponse(
              order[0]?.itemId.toString() ?? '',
              order[0]?.sku.toString() ?? '',
              order[1]?.customerEmail.toString() ?? '',
              selectReturnReason.value.reason.toString(),
              localStore.currentCode */ /*"gb-en"*/ /*);
      debugPrint("Response Is $postReturnItem");
      if (postReturnItem["message"] ==
          "Order return request successfully sent, you will get updates soon.") {
        Get.to<dynamic>(const ReturnReasonScreen());
      } else {
        Get.back;
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
              content: CommonTextPoppins(
                  (postReturnItem["message"] ?? '').toString())),
        );
        // Get.to<dynamic>(ReturnReasonScreen());
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }*/

//Order Tracking Dialog Box
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

  //showReturn Reason Dialog
  void showTextDialog() {
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return const ShowSuccessDialog();
      },
    );
  }

  //showReturn Reason Dialog
  void showTicketResponseDialog(BuildContext context, String message) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return ShowTicketResponse(
          message: message,
        );
      },
    );
  }
}
