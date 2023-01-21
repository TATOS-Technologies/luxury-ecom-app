import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_orders_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:veralusso/app/controller/my_orders/widgets/create_ticket_dialog.dart';
import 'package:veralusso/app/controller/my_orders/widgets/select_reason_dialog.dart';
import 'package:veralusso/app/controller/my_orders/widgets/show_success_dialog.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class MyOrdersController extends GetxController {
  String countryCode = '1';
  RxString phoneErrorMsg = "".obs;

  RxList<MyOrdersData> myOrdersList = <MyOrdersData>[].obs;
  RxInt index = 0.obs;
  MyAccountDetails userDetail = MyAccountDetails();
  RxList<String> cancelReasonList = <String>[].obs;
  RxList<String> returnReasonList = <String>[].obs;
  RxBool isLoading = true.obs;
  RxBool dialogLoader = false.obs;
  MyOrdersDataItem argumentData12 = MyOrdersDataItem();
  RxString selectedReturnString = ''.obs;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxString selectedCancelString = ''.obs;
  Rx<MyOrdersData> myOrdersModel = MyOrdersData().obs;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController urlOfImageController = TextEditingController();

  final MyOrdersAPIRepository myOrdersAPIRepository =
      MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  MyOrdersController();

  @override
  Future<void> onInit() async {
    super.onInit();
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    getMyOrders();
    getReturnReasonList();
  }

  Future<void> getMyOrders() async {
    isLoading.value = true;
    try {
      MyOrdersData data = await myOrdersAPIRepository
          .getMyOrdersApiResponse(localStore.userDetail.email);
      myOrdersModel.value = data;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString());
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  void onReturnTap(MyOrdersDataItem? orderData) {
    argumentData12 = orderData ?? MyOrdersDataItem();
    if ((orderData?.extensionAttributes?.isReturnable ?? '0') == '1') {
      showReturnReasonSelectionDialog(order: orderData?.items?.first);
    } else {
      createTicketForReturnDialog();
    }
  }

  Future<void> getCancelReasonList() async {
    try {
      List<String> returnReasonListData =
          await myOrdersAPIRepository.getCancelReasonResponse();
      debugPrint(
          "getStoreDataFromApi returnReasonListData -> $returnReasonListData");
      cancelReasonList.value = returnReasonListData;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("$e");
      Validators.appCatchError(error: e);
    }
  }

  Future<void> getReturnReasonList() async {
    try {
      List<String> returnReasonListData =
          await myOrdersAPIRepository.getReturnReasonResponse();
      debugPrint(
          "getStoreDataFromApi returnReasonListData -> $returnReasonListData");
      returnReasonList.value = returnReasonListData;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString());
      Validators.appCatchError(error: e);
    }
  }

  Future<bool> postReturnOrder(orderId) async {
    isLoading.value = true;
    final map = {
      "returnForm": {
        "order_id": orderId,
        "reason": selectedReturnString.value,
        "lang_code": localStore.currentCode,
      }
    };
    try {
      Map<String, dynamic> returnReasonListData =
          await myOrdersAPIRepository.postReturnOrder(jsonEncode(map));
      debugPrint(
          "getStoreDataFromApi postReturnOrder -> $returnReasonListData");
      isLoading.value = false;
      return (returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      debugPrint("$e");
      Validators.appCatchError(error: e);
    }
    isLoading.value = false;
    return false;
  }

  void showReturnReasonSelectionDialog(
      {bool fromItem = false, ParentItemElement? order}) {
    selectedReturnString.value = "";
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return SelectReasonDialog(
          fromReturn: true,
          reasonList: returnReasonList,
          selectedReason: selectedReturnString,
          onTap: () async {
            if (selectedReturnString.value == "") {
              ScaffoldMessenger.of(Get.context!).showSnackBar(
                SnackBar(
                  content: CommonTextPoppins(
                    LanguageConstants.pleaseSelectReturnReasonItem.tr,
                  ),
                ),
              );
            } else {
              bool value = false;
              if (fromItem) {
                value =
                    await postItemReturnReason(order?.itemId, order?.orderId);
              } else {
                value = await postReturnOrder(order?.orderId);
              }
              Get.back();
              if (value) {
                showTextDialog();
              } else {
                log('createMyTicketForCancelOrder is:-->>$fromItem');
                createTicketForReturnDialog(order: order, fromItem: fromItem);
              }
            }
          },
        );
      },
    );
  }

  void showTextDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return const ShowSuccessDialog();
      },
    );
  }

  void createTicketForReturnDialog(
      {ParentItemElement? order, bool fromItem = false}) {
    phoneNumberController.text = argumentData12.billingAddress?.telephone ?? '';
    urlOfImageController.clear();
    remarksController.clear();
    if (fromItem) {
      urlOfImageController.text =
          order?.extensionAttributess?.productImage ?? '';
    }
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CreateTicketDialog(
          fromItem: fromItem,
          fromReturn: true,
          phoneNumberController: phoneNumberController,
          emailController:
              TextEditingController(text: localStore.userDetail.email),
          firstNameController:
              TextEditingController(text: localStore.userDetail.firstname),
          lastNameController:
              TextEditingController(text: localStore.userDetail.lastname),
          orderCancelController: TextEditingController(
              text: LanguageConstants.orderReturnRequest.tr),
          imageUrlController: urlOfImageController,
          remarksController: remarksController,
          orderController:
              TextEditingController(text: argumentData12.incrementId ?? ''),
          skuController: TextEditingController(
            text: fromItem
                ? (order?.sku ?? '')
                : (argumentData12.items ?? [])
                    .map((e) => e.sku)
                    .toList()
                    .join(","),
          ),
          onTap: () async {
            if (fromItem) {
              await createMyTicketForReturnItemOrder(order);
            } else {
              await createMyTicketForReturnOrder();
            }
            Get.back();
            Get.toNamed(RoutesConstants.requestReceivedScreen);
          },
        );
      },
    );
  }

  Future<String> createMyTicketForReturnOrder() async {
    dialogLoader.value = true;
    String style =
        (argumentData12.items ?? []).map((e) => e.sku).toList().join(",");
    final map = {
      "ticketForm": {
        "name": localStore.userDetail.firstname,
        "last_name": localStore.userDetail.lastname,
        "email": localStore.userDetail.email,
        "phone": phoneNumberController.text,
        "brand": "Order # : ${argumentData12.incrementId ?? ''}",
        "style": style,
        "keyword": "Order Request",
        "image_url": urlOfImageController.text,
        "remarks":
            "Order Request for Order : #${argumentData12.incrementId ?? ''} ,Reason :${remarksController.text}",
        "lang_code": localStore.currentCode,
        "customer_id": localStore.userDetail.id,
        "ticket_type": 1
      }
    };
    try {
      Map<String, dynamic> returnReasonListData =
          await myOrdersAPIRepository.postCreateMyTickets(jsonEncode(map));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelOrder -> $returnReasonListData");
      isLoading.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      dialogLoader.value = false;
      debugPrint("$e");
      Validators.appCatchError(error: e);
    }
    dialogLoader.value = false;
    return '';
  }

  Future<bool> postItemReturnReason(int? id, int? orderID) async {
    isLoading.value = true;
    debugPrint("postItemReturnReason -> ");
    final map = {
      "returnForm": {
        "item_id": id,
        "order_id": orderID,
        "reason": selectedCancelString.value,
        "lang_code": localStore.currentCode,
      }
    };
    try {
      Map<String, dynamic> returnReasonListData = await myOrdersAPIRepository
          .postItemReturnReasonResponse(jsonEncode(map));
      debugPrint(
          "getStoreDataFromApi postItemReturnReason -> $returnReasonListData");
      isLoading.value = false;
      return (returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      Validators.appCatchError(error: e);
    }
    isLoading.value = false;
    return false;
  }

  Future<String> createMyTicketForReturnItemOrder(
      ParentItemElement? order) async {
    dialogLoader.value = true;
    final map = {
      "ticketForm": {
        "name": localStore.userDetail.firstname,
        "last_name": localStore.userDetail.lastname,
        "email": localStore.userDetail.email,
        "phone": phoneNumberController.text,
        "brand": "Order # : ${argumentData12.incrementId ?? ''}",
        "style": order?.sku ?? '',
        "keyword": "Order Request",
        "image_url": order?.extensionAttributess?.productImage ?? '',
        "remarks":
            "Order Request for Order : #${argumentData12.incrementId ?? ''} ,Reason :$selectedCancelString",
        "lang_code": localStore.currentCode,
        "customer_id": localStore.userDetail.id,
        "ticket_type": 1
      }
    };
    try {
      Map<String, dynamic> returnReasonListData =
          await myOrdersAPIRepository.postCreateMyTickets(jsonEncode(map));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelOrder -> $returnReasonListData");
      isLoading.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelItemOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      dialogLoader.value = false;
      debugPrint("$e");
      Validators.appCatchError(error: e);
    }
    dialogLoader.value = false;
    return '';
  }
}
