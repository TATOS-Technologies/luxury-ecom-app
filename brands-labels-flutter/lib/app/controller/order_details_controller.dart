import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/screens/my_orders/order_details/return_reson_submit_screen.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/order_confirmation_api_repository.dart';
import 'package:meta_package/api/api_repository/return_api_repository.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';
import 'package:meta_package/api/models/return_reason/return_reason_model.dart';

class OrderDetailsController extends GetxController {
  RxInt index = 0.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final ReturnAPIRepository myOrdersAPIRepository =
      ReturnAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final OrderConfirmationApiRepository orderConfirmationApiRepository =
      OrderConfirmationApiRepository(baseUrl: AppConstants.apiEndPointLogin);

  OrderDetailsController();

  RxList<ReturnReasonModel> returnReasonList = RxList<ReturnReasonModel>();
  RxList<OrderTrackingModel> orderTrackingList = RxList<OrderTrackingModel>();
  var isLoading = true.obs;
  final MyOrdersDataItem? myOrdersDataItem =
      Get.arguments[1] is MyOrdersDataItem
          ? Get.arguments[1] as MyOrdersDataItem
          : null;

  @override
  void onInit() {
    getOrderTrackingList();
    getReturnReasonList();
    super.onInit();
  }

  Rx<ReturnReasonModel> selectReturnReason = ReturnReasonModel().obs;

  Future<void> getReturnReasonList() async {
    isLoading.value = true;
    try {
      debugPrint("getStoreDataFromApi -> ");
      List<ReturnReasonModel> returnReasonListData =
          await myOrdersAPIRepository.getReturnReasonResponse();
      returnReasonList.value = returnReasonListData;
      debugPrint("Reason list Get $returnReasonList");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  bool checkStatusDate(int index) {
    return orderTrackingList[index].statusDate.toString() == "null" ||
        orderTrackingList[index].statusDate.toString() == "";
  }

  Future<void> getOrderTrackingList() async {
    isLoading.value = true;
    try {
      debugPrint("getStoreDataFromApi -> ");
      List<OrderTrackingModel> returnReasonListData =
          await orderConfirmationApiRepository.getOrderTrackingResponse(
        myOrdersDataItem?.incrementId.toString() ?? '',
      );
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
    // await getReturnReasonList();
  }

  Future<void> postReturnItem(BuildContext context) async {
    try {
      Map<String, dynamic> postReturnItem =
          await myOrdersAPIRepository.postReturnItemAPIResponse(
        myOrdersDataItem?.items?[0].itemId.toString() ?? '',
        myOrdersDataItem?.items?[0].sku.toString() ?? '',
        myOrdersDataItem?.customerEmail.toString() ?? '',
        selectReturnReason.value.reason.toString(),
        "gb-en",
      );
      debugPrint("Response Is $postReturnItem");
      if (postReturnItem["message"] ==
          "Order return request successfully sent, you will get updates soon.") {
        Get.to(const ReturnReasonScreen());
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
              content: CommonTextPoppins(postReturnItem["message"].toString())),
        );
        // Get.to(ReturnReasonScreen());
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    }
  }

//Order Tracking Dialog Box
  void showOrderTrackingDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => CommonAlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            backgroundColor: Colors.white,
            radius: 0,
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
                        child: const Icon(
                          Icons.close,
                          color: Color(
                            0xff4848ba,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20.0,
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              List.generate(orderTrackingList.length, (index) {
                            return Stack(
                              children: [
                                (index + 1) != orderTrackingList.length
                                    ? Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 6,
                                            ),
                                            height: 50,
                                            width: 4,
                                            color: checkStatusDate(index)
                                                ? const Color(
                                                    0xff7e7a79,
                                                  )
                                                : darkBlue,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 6,
                                            ),
                                            height: 30,
                                            width: 4,
                                            color: checkStatusDate(index + 1)
                                                ? const Color(
                                                    0xff7e7a79,
                                                  )
                                                : const Color(
                                                    0xff7d675c,
                                                  ),
                                          )
                                        ],
                                      )
                                    : const SizedBox(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipOval(
                                      child: Material(
                                        color: checkStatusDate(index)
                                            ? const Color(
                                                0xff7e7a79,
                                              )
                                            : darkBlue, // Button color
                                        child: SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: Center(
                                            child: Text(
                                              "${index + 1}",
                                              style: const TextStyle(
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
                                    SizedBox(
                                      // color: Colors.red,
                                      width: Get.width * 0.75,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${orderTrackingList[index].statusTitle}",
                                            style: TextStyle(
                                              color: checkStatusDate(index)
                                                  ? const Color(
                                                      0xff7e7a79,
                                                    )
                                                  : darkBlue,
                                              fontSize: 14,
                                            ),
                                          ),
                                          // const SizedBox(width: 40),
                                          checkStatusDate(index)
                                              ? const Text("")
                                              : Text(
                                                  "${orderTrackingList[index].statusDate}",
                                                  style: const TextStyle(
                                                    color: darkBlue,
                                                    fontSize: 14,
                                                    fontFamily: AppConstants
                                                        .fontPoppins,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
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

  //showReturn Reason Dialog

  void showDialogBoxOpen(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => CommonAlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            radius: 30,
            contentWidget: SizedBox(
              width: double.maxFinite,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.close,
                          size: 22,
                          color: Color(0xff000080),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15.6,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: const Color(0xff000080),
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<ReturnReasonModel>(
                        dropdownColor: backGroundColor,
                        items: returnReasonList
                            .map(
                              (value) => DropdownMenuItem<ReturnReasonModel>(
                                value: value,
                                child: Text(value.reason.toString()),
                              ),
                            )
                            .toList(),
                        isExpanded: true,
                        hint: selectReturnReason.value.reason.toString() ==
                                "null"
                            ? Text(
                                LanguageConstants.reasonReturnText.tr,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontPoppins,
                                  color:
                                      const Color(0xFF6B6B6B).withOpacity(0.6),
                                  fontSize: 14,
                                ),
                              )
                            : Text(
                                selectReturnReason.value.reason.toString(),
                                style: const TextStyle(
                                    fontFamily: AppConstants.fontPoppins,
                                    color: Colors.black),
                              ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 22,
                          color: Color(0xff000080),
                        ),
                        iconEnabledColor: Colors.transparent,
                        onChanged: (value) {
                          selectReturnReason.value = value!;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                CommonButton(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () {
                    if (selectReturnReason.value.reason.toString() == "null") {
                      ScaffoldMessenger.of(Get.context!).showSnackBar(
                        SnackBar(
                          content: CommonTextPoppins(
                            LanguageConstants.pleaseSelectReturnReasonItem.tr,
                          ),
                        ),
                      );
                    } else {
                      postReturnItem(context);
                    }
                  },
                  elevation: 0.0,
                  color: darkBlue,
                  borderRadius: 0.0,
                  child: CommonTextPoppins(
                    LanguageConstants.returnItemText.tr,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
              ]),
            ),
          ),
        );
      },
    );
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
        ? "${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.city ?? ''}, ${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.postcode ?? ''}\n${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.countryId ?? ''}\nT:${myOrdersDataItem?.extensionAttributes?.shippingAssignments![0].shipping?.address?.telephone ?? ''}"
        : '';
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

  String getPaymentMethod() {
    return myOrdersDataItem?.payment?.method?.toString() ?? '';
  }

  String getIncrementId() {
    return myOrdersDataItem?.incrementId?.toString() ?? '';
  }

  String getPrice(int index) {
    return '${myOrdersDataItem?.orderCurrencyCode?.toString() ?? ''} ${myOrdersDataItem?.items?[index].price?.toString() ?? ''}';
  }

  String getSubTotal(int index) {
    return '${myOrdersDataItem?.orderCurrencyCode?.toString() ?? ''} ${myOrdersDataItem?.items?[index].rowTotal?.toString() ?? ''}';
  }
}
