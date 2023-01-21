import 'dart:developer';

import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/models/my_ticket/cancel_reason_request.dart';
import 'package:meta_package/api/models/my_ticket/create_ticket_request.dart';
import 'package:meta_package/api/models/my_ticket/return_item_request.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/controller/my_orders/widgets/create_ticket_dialog.dart';
import 'package:solo_luxury/app/controller/my_orders/widgets/select_reason_dialog.dart';
import 'package:solo_luxury/app/controller/my_orders/widgets/show_success_dialog.dart';

class MyOrdersController extends GetxController {
  RxInt index = 0.obs;
  Rx<MyOrdersData>? myOrdersModel = MyOrdersData().obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  final MyOrdersAPIRepository myOrdersAPIRepository =
      MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));
  RxList<String> cancelReasonList = <String>[].obs;
  RxString selectedCancelString = ''.obs;
  RxList<String> returnReasonList = <String>[].obs;
  RxString selectedReturnString = ''.obs;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController urlOfImageController = TextEditingController();
  MyOrdersDataItem argumentData12 = MyOrdersDataItem();

  MyOrdersController();

  var isLoading = true.obs;

  MyAccountDetails userDetail = MyAccountDetails();

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  final GlobalKey<FormState> ticketFormKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    getMyOrders();
    getCancelReasonList();
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

  void onCancelTap(MyOrdersDataItem? orderData) {
    argumentData12 = orderData ?? MyOrdersDataItem();
    if ((orderData?.extensionAttributes?.isCancellable ?? '0') == '1') {
      showDialogBoxOpen(order: orderData?.items?.first);
    } else {
      createTicketDialog();
    }
  }

  Future<void> getCancelReasonList() async {
    debugPrint("getStoreDataFromApi -> ");
    try {
      List<String> returnReasonListData =
          await myOrdersAPIRepository.getCancelReasonResponse();
      debugPrint(
          "getStoreDataFromApi returnReasonListData -> $returnReasonListData");
      cancelReasonList.value = returnReasonListData;
      debugPrint("Cancel list Get $cancelReasonList");
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      debugPrint("$e");
    }
  }

  Future<void> getReturnReasonList() async {
    debugPrint("getStoreDataFromApi -> ");
    try {
      List<String> returnReasonListData =
          await myOrdersAPIRepository.getReturnReasonResponse();
      debugPrint(
          "getStoreDataFromApi returnReasonListData -> $returnReasonListData");
      returnReasonList.value = returnReasonListData;
      debugPrint("Cancel list Get $returnReasonList");
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      debugPrint("$e");
    }
  }

  Future<void> getMyOrders() async {
    isLoading.value = true;
    try {
      MyOrdersData data = await myOrdersAPIRepository
          .getMyOrdersApiResponse(localStore.userDetail.email);
      myOrdersModel?.value = data;
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      debugPrint("$e");
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  void clickChatEvent({String? name, String? email}) {
    Livechat.beginChat(
        AppConstants.licenceId,
        '1',
        name ?? userDetail.firstname.toString().trim(),
        email ?? userDetail.email.toString().trim(), {});
  }

  Future<bool> postCancellationReason(int? orderID) async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");

    try {
      Map<String, dynamic> returnReasonListData = await myOrdersAPIRepository
          .postCancellationReasonResponse(CancelReasonForm(CancelReasonRequest(
        orderId: orderID,
        reason: selectedCancelString.value,
        langCode: localStore.currentCode,
      ).toJson()));
      debugPrint(
          "getStoreDataFromApi postCancellationReason -> $returnReasonListData");
      isLoading.value = false;
      debugPrint("Cancel postCancellationReason list Get $cancelReasonList");
      return (returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return false;
  }

  Future<String> createMyTicketForCancelOrder() async {
    isLoading.value = true;
    String style =
        (argumentData12.items ?? []).map((e) => e.sku).toList().join(",");
    debugPrint("createMyTicketForCancelOrder -> 00 :- >>$style");

    try {
      Map<String, dynamic> returnReasonListData = await myTicketAPIRepository
          .postCreateMyTickets(TicketForm(CreateTicketRequest(
                  name: localStore.userDetail.firstname,
                  lastName: localStore.userDetail.lastname,
                  email: localStore.userDetail.email,
                  phone: phoneNumberController.text,
                  brand: "Order # : ${argumentData12.incrementId ?? ''}",
                  style: style,
                  keyword: "Order Request",
                  imageUrl: urlOfImageController.text,
                  remarks:
                      "Order Request for Order : #${argumentData12.incrementId ?? ''} ,Reason :${remarksController.text}",
                  langCode: localStore.currentCode,
                  customerId: localStore.userDetail.id,
                  ticketType: 3)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelOrder -> $returnReasonListData");
      isLoading.value = false;
      return returnReasonListData['message'].toString();
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return '';
  }

  void showDialogBoxOpen({
    bool fromItem = false,
    ParentItemElement? order,
  }) {
    selectedCancelString.value = "";
    showDialog<dynamic>(
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
              Get.back<dynamic>();
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
    phoneNumberController.text = argumentData12.billingAddress?.telephone ?? '';
    urlOfImageController.clear();
    remarksController.clear();
    if (fromItem) {
      urlOfImageController.text =
          order?.extensionAttributess?.productImage ?? '';
    }
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return CreateTicketDialog(
          key: ticketFormKey,
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
              TextEditingController(text: argumentData12.incrementId ?? ''),
          skuController: TextEditingController(
            text: fromItem
                ? (order?.sku ?? '')
                : (argumentData12.items ?? [])
                    .map((e) => e.sku ?? '')
                    .toList()
                    .join(","),
          ),
          onTap: () async {
            String msg = '';
            if (ticketFormKey.currentState != null &&
                ticketFormKey.currentState!.validate()) {
              if (fromItem) {
                msg = await createMyTicketForCancelItemOrder(order);
              } else {
                msg = await createMyTicketForCancelOrder();
              }
              Get.back<dynamic>();
              log(msg, name: "msg");
              Get.toNamed<dynamic>(RoutesConstants.requestReceivedScreen);
            }

            // showTicketResponseDialog(Get.context!, msg);
          },
        );
      },
    );
  }

  void showTextDialog() {
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return const ShowSuccessDialog();
      },
    );
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
                  brand: "Order # : ${argumentData12.incrementId ?? ''}",
                  style: order?.sku ?? '',
                  keyword: "Order Request",
                  imageUrl: order?.extensionAttributess?.productImage ?? '',
                  remarks:
                      "Order Request for Order : #${argumentData12.incrementId ?? ''} ,Reason :$selectedCancelString",
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
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return '';
  }

  Future<bool> postItemCancellationReason(int? id, int? orderId) async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");

    try {
      Map<String, dynamic> returnReasonListData =
          await myOrdersAPIRepository.postItemCancellationReasonResponse(
              CancelReasonForm(CancelReasonRequest(
        itemId: id,
        orderId: orderId,
        reason: selectedCancelString.value,
        langCode: localStore.currentCode,
      ).toJson()));
      debugPrint(
          "getStoreDataFromApi postCancellationReason -> $returnReasonListData");
      isLoading.value = false;
      debugPrint("Cancel postCancellationReason list Get $cancelReasonList");
      return (returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return false;
  }

  ///Return FLow

  Future<bool> postReturnOrder(int? orderId) async {
    isLoading.value = true;
    debugPrint("postReturnOrder -> ");

    try {
      Map<String, dynamic> returnReasonListData = await myOrdersAPIRepository
          .postReturnOrder(ReturnItemForm(ReturnItemRequest(
                  orderId: orderId,
                  reason: selectedCancelString.value,
                  langCode: localStore.currentCode)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi postReturnOrder -> $returnReasonListData");
      isLoading.value = false;
      debugPrint("Cancel postReturnOrder list Get $cancelReasonList");
      return (returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return false;
  }

  void showReturnReasonSelectionDialog(
      {bool fromItem = false, ParentItemElement? order}) {
    selectedReturnString.value = "";
    showDialog<dynamic>(
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
              Get.back<dynamic>();
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

  void createTicketForReturnDialog(
      {ParentItemElement? order, bool fromItem = false}) {
    phoneNumberController.text = argumentData12.billingAddress?.telephone ?? '';
    urlOfImageController.clear();
    remarksController.clear();
    if (fromItem) {
      urlOfImageController.text =
          order?.extensionAttributess?.productImage ?? '';
    }
    showDialog<dynamic>(
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
            Get.back<dynamic>();
            Get.toNamed<dynamic>(RoutesConstants.requestReceivedScreen);
            // showTicketResponseDialog(Get.context!, msg);
          },
        );
      },
    );
  }

  Future<String> createMyTicketForReturnOrder() async {
    isLoading.value = true;
    String style =
        (argumentData12.items ?? []).map((e) => e.sku).toList().join(",");
    debugPrint("createMyTicketForReturnOrder -> 00 :- >>$style");

    try {
      Map<String, dynamic> returnReasonListData = await myTicketAPIRepository
          .postCreateMyTickets(TicketForm(CreateTicketRequest(
                  name: localStore.userDetail.firstname,
                  lastName: localStore.userDetail.lastname,
                  email: localStore.userDetail.email,
                  phone: phoneNumberController.text,
                  brand: "Order # : ${argumentData12.incrementId ?? ''}",
                  style: style,
                  keyword: "Order Request",
                  imageUrl: urlOfImageController.text,
                  remarks:
                      "Order Request for Order : #${argumentData12.incrementId ?? ''} ,Reason :${remarksController.text}",
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
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return '';
  }

  Future<bool> postItemReturnReason(int? id, int? orderID) async {
    isLoading.value = true;
    debugPrint("postItemReturnReason -> ");

    try {
      Map<String, dynamic> returnReasonListData = await myOrdersAPIRepository
          .postItemReturnReasonResponse(ReturnItemForm(ReturnItemRequest(
                  itemId: id,
                  orderId: orderID,
                  reason: selectedCancelString.value,
                  langCode: localStore.currentCode)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi postItemReturnReason -> $returnReasonListData");
      isLoading.value = false;
      debugPrint("Cancel postItemReturnReason list Get $cancelReasonList");
      return (returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    }
    isLoading.value = false;
    return false;
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
        brand: "Order # : ${argumentData12.incrementId ?? ''}",
        style: order?.sku ?? '',
        keyword: "Order Request",
        imageUrl: order?.extensionAttributess?.productImage ?? '',
        remarks:
            "Order Request for Order : #${argumentData12.incrementId ?? ''} ,Reason :$selectedCancelString",
        langCode: localStore.currentCode,
        customerId: localStore.userDetail.id,
        ticketType: 1,
      ).toJson()));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelItemOrder -> $returnReasonListData");
      isLoading.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelItemOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return '';
  }
}
