import 'dart:convert';
import 'dart:developer';

import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/screens/my_orders/widget/create_ticket_dialog.dart';
import 'package:avoirchic/app/presentation/screens/my_orders/widget/select_reason_dialog.dart';
import 'package:avoirchic/app/presentation/screens/my_orders/widget/show_success_dialog.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_orders_api_repository.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/models/my_ticket/create_ticket_request.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:meta_package/translations/translations.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class MyOrdersController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  Rx<MyOrdersData>? myOrdersModel = MyOrdersData().obs;
  final MyOrdersAPIRepository myOrdersAPIRepository =
      MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  MyOrdersController();

  MyOrdersDataItem myOrdersDataItem = MyOrdersDataItem();
  RxString selectedReturnString = ''.obs;
  RxList<String> returnReasonList = <String>[].obs;
  RxString selectedCancelString = ''.obs;
  RxList<String> cancelReasonList = <String>[].obs;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController urlOfImageController = TextEditingController();

  RxBool isLoading = true.obs;
  MyAccountDetails userDetail = MyAccountDetails();
  final MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));

  @override
  Future<void> onInit() async {
    super.onInit();
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    getMyOrders();
    getCancelReasonList();
    getReturnReasonList();
  }

  Future<void> getMyOrders() async {
    isLoading.value = true;
    try {
      MyOrdersData data = await myOrdersAPIRepository
          .getMyOrdersApiResponse(localStore.userDetail.email);
      myOrdersModel?.value = data;
      log(myOrdersDataItem.incrementId ?? '', name: "Value");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
  }

  Future<void> getCancelReasonList() async {
    debugPrint("getStoreDataFromApi -> ");
    try {
      List<String> returnReasonListData =
          await myOrdersAPIRepository.getCancelReasonResponse();
      debugPrint(
          "getStoreDataFromApi returnReasonListData -> $returnReasonListData");
      if (returnReasonListData.isNotEmpty == true) {
        cancelReasonList.value = returnReasonListData;
        debugPrint("Cancel list Get $cancelReasonList");
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> getReturnReasonList() async {
    debugPrint("getStoreDataFromApi -> ");
    try {
      List<String> returnReasonListData =
          await myOrdersAPIRepository.getReturnReasonResponse();
      debugPrint(
          "getStoreDataFromApi returnReasonListData -> $returnReasonListData");
      if (returnReasonListData.isNotEmpty == true) {
        returnReasonList.value = returnReasonListData;
        debugPrint("Cancel list Get $returnReasonList");
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  String getProductPrice({MyOrdersDataItem? orderData}) {
    return '${orderData?.subtotal?.toString() ?? '-'} ${orderData?.orderCurrencyCode ?? ''}';
  }

  void onReturnTap(MyOrdersDataItem? orderData) {
    myOrdersDataItem = orderData ?? MyOrdersDataItem();
    if ((orderData?.extensionAttributes?.isReturnable ?? '0') == '1') {
      showReturnReasonSelectionDialog(order: orderData?.items?.first);
    } else {
      createTicketForReturnDialog();
    }
  }

  void onCancelTap(MyOrdersDataItem? orderData) {
    myOrdersDataItem = orderData ?? MyOrdersDataItem();
    if ((orderData?.extensionAttributes?.isCancellable ?? '0') == '1') {
      showDialogBoxOpen(order: orderData?.items?.first);
    } else {
      createTicketDialog();
    }
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
              try {
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
              } on ApiException catch (e) {
                ExceptionHandler.apiExceptionError(e: e);
              } catch (e) {
                debugPrint(e.toString());
                ExceptionHandler.appCatchError(error: e);
              }
            }
          },
        );
      },
    );
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
      debugPrint("Cancel postItemReturnReason list Get $cancelReasonList");
      return returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return false;
  }

  Future<bool> postReturnOrder(int? orderId) async {
    isLoading.value = true;
    debugPrint("postReturnOrder -> ");
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
      debugPrint("Cancel postReturnOrder list Get $cancelReasonList");
      return returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return false;
  }

  void createTicketForReturnDialog(
      {ParentItemElement? order, bool fromItem = false}) {
    phoneNumberController.text =
        myOrdersDataItem.billingAddress?.telephone ?? '';
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
          orderController: TextEditingController(
              text: myOrdersDataItem.incrementId?.toString() ?? ''),
          skuController: TextEditingController(
            text: fromItem
                ? (order?.sku ?? '')
                : (myOrdersDataItem.items ?? [])
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

  Future<String> createMyTicketForReturnItemOrder(
      ParentItemElement? order) async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");

    try {
      Map<String, dynamic> returnReasonListData = await myTicketAPIRepository
          .postCreateMyTickets(TicketForm(CreateTicketRequest(
                  name: localStore.userDetail.firstname,
                  lastName: localStore.userDetail.lastname,
                  email: localStore.userDetail.email,
                  phone: phoneNumberController.text,
                  brand: "Order # : ${myOrdersDataItem.incrementId ?? ''}",
                  style: order?.sku ?? '',
                  keyword: "Order Request",
                  imageUrl: order?.extensionAttributess?.productImage ?? '',
                  remarks: "",
                  langCode: localStore.currentCode,
                  customerId: localStore.userDetail.id,
                  ticketType: 1)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelItemOrder -> $returnReasonListData");
      isLoading.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelItemOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return '';
  }

  Future<String> createMyTicketForReturnOrder() async {
    isLoading.value = true;
    String style =
        (myOrdersDataItem.items ?? []).map((e) => e.sku).toList().join(",");
    debugPrint("createMyTicketForReturnOrder -> 00 :- >>$style");

    try {
      Map<String, dynamic> returnReasonListData = await myTicketAPIRepository
          .postCreateMyTickets(TicketForm(CreateTicketRequest(
                  name: localStore.userDetail.firstname,
                  lastName: localStore.userDetail.lastname,
                  email: localStore.userDetail.email,
                  phone: phoneNumberController.text,
                  brand: "Order # : ${myOrdersDataItem.incrementId ?? ''}",
                  style: style,
                  keyword: "Order Request",
                  imageUrl: urlOfImageController.text,
                  remarks:
                      "Order Request for Order : #${myOrdersDataItem.incrementId ?? ''} ,Reason :${remarksController.text}",
                  langCode: localStore.currentCode,
                  customerId: localStore.userDetail.id,
                  ticketType: 1)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelOrder -> $returnReasonListData");
      isLoading.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return '';
  }

  Future<bool> postItemCancellationReason(int? id, int? orderId) async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");
    final map = {
      "cancelForm": {
        "item_id": id,
        "order_id": orderId,
        "reason": selectedCancelString.value,
        "lang_code": localStore.currentCode,
      }
    };
    try {
      Map<String, dynamic> returnReasonListData = await myOrdersAPIRepository
          .postItemCancellationReasonResponse(jsonEncode(map));
      debugPrint(
          "getStoreDataFromApi postCancellationReason -> $returnReasonListData");
      isLoading.value = false;
      debugPrint("Cancel postCancellationReason list Get $cancelReasonList");
      return returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return false;
  }

  Future<bool> postCancellationReason(int? orderID) async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");
    final map = {
      "cancelForm": {
        "order_id": orderID,
        "reason": selectedCancelString.value,
        "lang_code": localStore.currentCode,
      }
    };
    try {
      Map<String, dynamic> returnReasonListData = await myOrdersAPIRepository
          .postCancellationReasonResponse(jsonEncode(map));
      debugPrint(
          "getStoreDataFromApi postCancellationReason -> $returnReasonListData");
      isLoading.value = false;
      debugPrint("Cancel postCancellationReason list Get $cancelReasonList");
      return returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return false;
  }

  Future<String> createMyTicketForCancelItemOrder(
      ParentItemElement? order) async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");

    try {
      Map<String, dynamic> returnReasonListData = await myTicketAPIRepository
          .postCreateMyTickets(TicketForm(CreateTicketRequest(
                  name: localStore.userDetail.firstname,
                  lastName: localStore.userDetail.lastname,
                  email: localStore.userDetail.email,
                  phone: phoneNumberController.text,
                  brand: "Order # : ${myOrdersDataItem.incrementId ?? ''}",
                  style: order?.sku ?? '',
                  keyword: "Order Request",
                  imageUrl: order?.extensionAttributess?.productImage ?? '',
                  remarks:
                      "Order Request for Order : #${myOrdersDataItem.incrementId ?? ''} ,Reason :$selectedCancelString",
                  langCode: localStore.currentCode,
                  customerId: localStore.userDetail.id,
                  ticketType: 2)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelItemOrder -> $returnReasonListData");
      isLoading.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelItemOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return '';
  }

  Future<String> createMyTicketForCancelOrder() async {
    isLoading.value = true;
    String style =
        (myOrdersDataItem.items ?? []).map((e) => e.sku).toList().join(",");
    debugPrint("createMyTicketForCancelOrder -> 00 :- >>$style");
    try {
      Map<String, dynamic> returnReasonListData = await myTicketAPIRepository
          .postCreateMyTickets(TicketForm(CreateTicketRequest(
                  name: localStore.userDetail.firstname,
                  lastName: localStore.userDetail.lastname,
                  email: localStore.userDetail.email,
                  phone: phoneNumberController.text,
                  brand: "Order # : ${myOrdersDataItem.incrementId ?? ''}",
                  style: style,
                  keyword: "Order Request",
                  imageUrl: urlOfImageController.text,
                  remarks: "",
                  langCode: localStore.currentCode,
                  customerId: localStore.userDetail.id,
                  ticketType: 3)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelOrder -> $returnReasonListData");
      isLoading.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return '';
  }

  void showDialogBoxOpen({
    bool fromItem = false,
    ParentItemElement? order,
  }) {
    selectedCancelString.value = "";
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return SelectReasonDialog(
          reasonList: cancelReasonList,
          selectedReason: selectedCancelString,
          onTap: () async {
            if (selectedCancelString.value == "") {
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
                value = await postItemCancellationReason(
                    order?.itemId, order?.orderId);
              } else {
                value = await postCancellationReason(order?.orderId);
              }
              Get.back();
              if (value) {
                showTextDialog();
              } else {
                log('createMyTicketForCancelOrder is:-->>$fromItem');
                createTicketDialog(order: order, fromItem: fromItem);
              }
              // postReturnItem(order, context);
            }
          },
        );
      },
    );
  }

  void createTicketDialog({ParentItemElement? order, bool fromItem = false}) {
    phoneNumberController.text =
        myOrdersDataItem.billingAddress?.telephone ?? '';
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
          phoneNumberController: phoneNumberController,
          emailController:
              TextEditingController(text: localStore.userDetail.email),
          firstNameController:
              TextEditingController(text: localStore.userDetail.firstname),
          lastNameController:
              TextEditingController(text: localStore.userDetail.lastname),
          orderCancelController: TextEditingController(
              text: LanguageConstants.orderCancelRequest.tr),
          imageUrlController: urlOfImageController,
          remarksController: remarksController,
          orderController:
              TextEditingController(text: myOrdersDataItem.incrementId ?? ''),
          skuController: TextEditingController(
            text: fromItem
                ? (order?.sku ?? '')
                : (myOrdersDataItem.items ?? [])
                    .map((e) => e.sku)
                    .toList()
                    .join(","),
          ),
          onTap: () async {
            String msg = '';
            if (fromItem) {
              msg = await createMyTicketForCancelItemOrder(order);
            } else {
              msg = await createMyTicketForCancelOrder();
            }
            Get.back();
            log(msg, name: "msg");
            Get.toNamed(RoutesConstants.requestReceivedScreen);
            // showTicketResponseDialog(Get.context!, msg);
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

  Color returnableIconColor(ItemExtensionAttributes? extensionAttributes) {
    return (extensionAttributes?.isReturnable ?? '0') == '1'
        ? avoirChickTheme.withOpacity(0.6)
        : blackColor.withOpacity(0.5);
  }

  Color cancelIconColor(ItemExtensionAttributes? extensionAttributes) {
    return (extensionAttributes?.isReturnable ?? '0') == '1'
        ? avoirChickTheme.withOpacity(0.6)
        : blackColor.withOpacity(0.5);
  }
}
