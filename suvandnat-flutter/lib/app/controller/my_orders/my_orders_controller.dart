import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_orders_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/my_orders/widgets/create_ticket_dialog.dart';
import 'package:suvandnat/app/controller/my_orders/widgets/select_reason_dialog.dart';
import 'package:suvandnat/app/controller/my_orders/widgets/show_success_dialog.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/theme/colors.dart';

class MyOrdersController extends GetxController {
  RxBool dialogLoader = false.obs;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<MyOrdersData> myOrdersModel = MyOrdersData().obs;
  final MyOrdersAPIRepository myOrdersAPIRepository =
      MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  MyOrdersDataItem argumentData12 = MyOrdersDataItem();

  MyOrdersController();

  MyAccountDetails userDetail = MyAccountDetails();
  RxBool isLoading = true.obs;
  RxList<String> cancelReasonList = <String>[].obs;
  RxList<String> returnReasonList = <String>[].obs;
  RxString selectedReturnString = ''.obs;
  RxString selectedCancelString = ''.obs;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController urlOfImageController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    getMyOrders();
    getReturnReasonList();
  }

  void onReturnTap(MyOrdersDataItem? orderData) {
    argumentData12 = orderData ?? MyOrdersDataItem();
    if ((orderData?.extensionAttributes?.isReturnable ?? '0') == '1') {
      showReturnReasonSelectionDialog(order: orderData?.items?.first);
    } else {
      createTicketForReturnDialog();
    }
  }

  Future<void> getReturnReasonList() async {
    try {
      List<String> returnReasonListData =
          await myOrdersAPIRepository.getReturnReasonResponse();
      if (returnReasonListData.isNotEmpty == true) {
        returnReasonList.value = returnReasonListData;
      }
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
          orderCancelController:
              TextEditingController(text: LanguageConstants.orderReturnRequest.tr),
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
            // showTicketResponseDialog(Get.context!, msg);
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
      dialogLoader.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      dialogLoader.value = false;
      Validators.appCatchError(error: e);
    }
    dialogLoader.value = false;
    return '';
  }

  Future<bool> postItemReturnReason(id, orderID) async {
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

      dialogLoader.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelItemOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      dialogLoader.value = false;
      Validators.appCatchError(error: e);
    }
    dialogLoader.value = false;
    return '';
  }

  Future<void> getMyOrders() async {
    isLoading.value = true;
    try {
      await localStore.getUserDetail();
      userDetail = localStore.userDetail;
      MyOrdersData data = await myOrdersAPIRepository
          .getMyOrdersApiResponse(localStore.userDetail.email);
      myOrdersModel.value = data;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e, stackStrace) {
      log(e.toString());
      log(stackStrace.toString());
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  bool orderDataIsEmpty() {
    return myOrdersModel.value.items == null ||
       ( myOrdersModel.value.items?.isEmpty ?? false);
  }

  String getName(MyOrdersDataItem? orderData) {
    return '${orderData?.billingAddress?.firstname ?? ''} ${orderData?.billingAddress?.lastname ?? ''}';
  }

  String getSubTotal(MyOrdersDataItem? orderData) {
    return '${orderData?.subtotal?.toString() ?? '-'} ${orderData?.orderCurrencyCode?.toString() ?? ''}';
  }

  Color getReturnableColor(MyOrdersDataItem? orderData) {
    return (orderData?.extensionAttributes?.isReturnable ?? '0') == '1'
        ? blackColor
        : grey;
  }

  Color getCancellableColor(MyOrdersDataItem? orderData) {
    return (orderData?.extensionAttributes?.isCancellable ?? '0') == '1'
        ? blackColor
        : grey;
  }
}
