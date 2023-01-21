import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:meta_package/api/api_repository/order_confirmation_api_repository.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class OrderConfirmationController extends GetxController {
  RxList<Items> items = <Items>[].obs;
  Rx<OrderConfirmationModel> orderConfirmationModel = OrderConfirmationModel().obs;
  RxBool isLoading = false.obs;
  var extensionAttributes = ExtensionAttribute().obs;
  var billingAddress = BillingAddress().obs;
  var paymentValue = Payment().obs;
  RxString orderId = "".obs;

  final OrderConfirmationApiRepository orderConfirmationApiRepository =
      OrderConfirmationApiRepository(baseUrl: AppConstants.apiEndPointLogin);

  OrderConfirmationController();

  RxList<OrderTrackingModel> orderTrackingList = RxList<OrderTrackingModel>();

  @override
  void onInit() {
    super.onInit();
    orderId.value = Get.arguments is String ? Get.arguments.toString() : '';
    getOrderConfirmationData(orderId: orderId.value);
  }

  Future<void> getOrderTrackingList(String id) async {
    isLoading.value = true;
    try {
      debugPrint("getStoreDataFromApi -> ");
      List<OrderTrackingModel> returnReasonListData = await orderConfirmationApiRepository.getOrderTrackingResponse(
        id,
      );
      orderTrackingList.value = returnReasonListData;
      debugPrint("OrderTracking  list Get $orderTrackingList");
      debugPrint("$orderTrackingList");
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> getOrderConfirmationData({String orderId = ''}) async {
    isLoading(true);
    try {
      OrderConfirmationModel orderConfirmationVal =
          await orderConfirmationApiRepository.getOrderConfirmationApiResponse(orderId);
      orderConfirmationModel.value = (orderConfirmationVal);
      items.value = orderConfirmationModel.value.items ?? [];
      billingAddress.value = orderConfirmationModel.value.billingAddress ?? BillingAddress();
      paymentValue.value = orderConfirmationModel.value.payment ?? Payment();
      try {
        extensionAttributes.value = orderConfirmationModel.value.extensionAttributes ?? ExtensionAttribute();
        log('extensionAttributes.value is 000:-->${extensionAttributes.value.shippingAssignments?.first.shipping?.address?.email ?? 'Data Null'}');
      } catch (e, st) {
        log('Error getOrderConfirmationData is:-->>$e && st :->$st');
        Validators.appCatchError(error: e);
      }
      log('Error getOrderConfirmationData is:-->>3333');
      isLoading(false);
      // debugPrint("DATADATTATATTA=======${items[0].name}");
      getOrderTrackingList(orderConfirmationModel.value.incrementId ?? '');
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
  }

  void showOrderTrackingDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => CommonAlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // titlePadding: EdgeInsets.zero,
            backgroundColor: backGroundColor,
            radius: 20,
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close, color: Color(0xff7e7a79))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20.0),
                    child: Row(
                      children: [
                        (orderTrackingList.isEmpty)
                            ? Container()
                            : Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          left: 6,
                                        ),
                                        height: 80,
                                        width: 4,
                                        color: orderTrackingList[0].statusDate.toString() == "null" ||
                                                orderTrackingList[0].statusDate.toString() == ""
                                            ? const Color(0xff7e7a79)
                                            : const Color(0xff7d675c),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const ClipOval(
                                            child: Material(
                                              color: brownColor, // Button color
                                              child: SizedBox(
                                                width: 18,
                                                height: 18,
                                                child: Center(
                                                  child: Text(
                                                    "1",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${orderTrackingList[0].statusTitle}",
                                                style: const TextStyle(
                                                  color: brownColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(width: 60),
                                              orderTrackingList[0].statusDate.toString() == "null" ||
                                                      orderTrackingList[0].statusDate.toString() == ""
                                                  ? const Text("")
                                                  : Text(
                                                      "${orderTrackingList[0].statusDate}",
                                                      style: const TextStyle(
                                                        color: brownColor,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        height: 50,
                                        width: 4,
                                        color: orderTrackingList[1].statusDate.toString() == "null" ||
                                                orderTrackingList[1].statusDate.toString() == ""
                                            ? const Color(0xff7e7a79)
                                            : const Color(0xff7d675c),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ClipOval(
                                              child: Material(
                                            color: orderTrackingList[1].statusDate.toString() == "null" ||
                                                    orderTrackingList[1].statusDate.toString() == ""
                                                ? const Color(0xff7e7a79)
                                                : brownColor, // Button color
                                            child: const SizedBox(
                                              width: 18,
                                              height: 18,
                                              child: Center(
                                                child: Text(
                                                  "2",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                          const SizedBox(width: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${orderTrackingList[1].statusTitle}",
                                                style: TextStyle(
                                                  color: orderTrackingList[1].statusDate.toString() == "null" ||
                                                          orderTrackingList[1].statusDate.toString() == ""
                                                      ? const Color(0xff7e7a79)
                                                      : brownColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(width: 60),
                                              orderTrackingList[1].statusDate.toString() == "null" ||
                                                      orderTrackingList[1].statusDate.toString() == ""
                                                  ? const Text("")
                                                  : Text(
                                                      "${orderTrackingList[1].statusDate}",
                                                      style: const TextStyle(
                                                        color: brownColor,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        height: 30,
                                        width: 4,
                                        color: orderTrackingList[2].statusDate.toString() == "null" ||
                                                orderTrackingList[2].statusDate.toString() == ""
                                            ? const Color(0xff7e7a79)
                                            : const Color(0xff7d675c),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        height: 80,
                                        width: 4,
                                        color: orderTrackingList[2].statusDate.toString() == "null" ||
                                                orderTrackingList[2].statusDate.toString() == ""
                                            ? const Color(0xff7e7a79)
                                            : const Color(0xff7d675c),
                                      ),
                                      Row(
                                        children: [
                                          ClipOval(
                                            child: Material(
                                              color: orderTrackingList[2].statusDate.toString() == "null" ||
                                                      orderTrackingList[2].statusDate.toString() == ""
                                                  ? const Color(0xff7e7a79)
                                                  : const Color(0xff7d675c),
                                              // Button color
                                              child: const SizedBox(
                                                width: 18,
                                                height: 18,
                                                child: Center(
                                                  child: Text(
                                                    "3",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${orderTrackingList[2].statusTitle}",
                                                style: TextStyle(
                                                  color: orderTrackingList[2].statusDate.toString() == "null" ||
                                                          orderTrackingList[2].statusDate.toString() == ""
                                                      ? const Color(0xff7e7a79)
                                                      : brownColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(width: 60),
                                              orderTrackingList[2].statusDate.toString() == "null" ||
                                                      orderTrackingList[2].statusDate.toString() == ""
                                                  ? const Text("")
                                                  : Text(
                                                      "${orderTrackingList[2].statusDate}",
                                                      style: const TextStyle(
                                                        color: brownColor,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        height: 10,
                                        width: 4,
                                        color: orderTrackingList[3].statusDate.toString() == "null" ||
                                                orderTrackingList[3].statusDate.toString() == ""
                                            ? const Color(0xff7e7a79)
                                            : const Color(0xff7d675c),
                                      ),
                                      Row(
                                        children: [
                                          ClipOval(
                                              child: Material(
                                                  color: orderTrackingList[3].statusDate.toString() == "null" ||
                                                          orderTrackingList[3].statusDate.toString() == ""
                                                      ? const Color(0xff7e7a79)
                                                      : const Color(0xff7d675c), // Button color
                                                  child: const SizedBox(
                                                    width: 18,
                                                    height: 18,
                                                    child: Center(
                                                      child: Text(
                                                        "4",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ))),
                                          const SizedBox(width: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${orderTrackingList[3].statusTitle}",
                                                style: TextStyle(
                                                  color: orderTrackingList[3].statusDate.toString() == "null" ||
                                                          orderTrackingList[3].statusDate.toString() == ""
                                                      ? const Color(0xff7e7a79)
                                                      : brownColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(width: 60),
                                              orderTrackingList[3].statusDate.toString() == "null" ||
                                                      orderTrackingList[3].statusDate.toString() == ""
                                                  ? const Text("")
                                                  : Text(
                                                      "${orderTrackingList[3].statusDate}",
                                                      style: const TextStyle(
                                                        color: brownColor,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
