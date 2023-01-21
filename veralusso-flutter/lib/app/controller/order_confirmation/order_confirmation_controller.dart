import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta_package/api/api_repository/order_confirmation_api_repository.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:veralusso/app/core/const/app_constants.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class OrderConfirmationController extends GetxController {
  Rx<OrderConfirmationModel> orderConfirmationData =
      OrderConfirmationModel().obs;
  RxString orderId = "1".obs;

  Rx<ExtensionAttribute> extensionAttributes = ExtensionAttribute().obs;
  Rx<BillingAddress> billingAddress = BillingAddress().obs;
  Rx<Payment> paymentValue = Payment().obs;

  RxList<Items> items = <Items>[].obs;
  Rx<OrderConfirmationModel> orderConfirmationModel =
      OrderConfirmationModel().obs;
  RxList<OrderTrackingModel> orderTrackingList = RxList<OrderTrackingModel>();
  final OrderConfirmationApiRepository orderConfirmationApiRepository =
      OrderConfirmationApiRepository(baseUrl: AppConstants.apiEndPointLogin);

  OrderConfirmationController();

  @override
  void onInit() {
    super.onInit();
    orderId.value = Get.arguments is String ? Get.arguments as String : '';
    getOrderConfirmationDataFromApi(orderId.value);
  }

  RxBool isLoading = true.obs;

  RxString dateVal = "".obs;

  Future<void> getOrderConfirmationDataFromApi(String id) async {
    isLoading(true);

    try {
      OrderConfirmationModel orderConfirmationVal =
          await orderConfirmationApiRepository
              .getOrderConfirmationApiResponse(orderId.value);
      orderConfirmationModel.value = (orderConfirmationVal);
      isLoading(true);
      orderConfirmationData(orderConfirmationVal);
      dateVal.value = orderConfirmationData.value.createdAt.toString();
      dateVal.value = orderConfirmationData.value.createdAt.toString();
      items.value = orderConfirmationModel.value.items ?? [];
      billingAddress.value =
          orderConfirmationModel.value.billingAddress ?? BillingAddress();
      paymentValue.value = orderConfirmationModel.value.payment ?? Payment();
      extensionAttributes.value =
          orderConfirmationModel.value.extensionAttributes ??
              ExtensionAttribute();
      getOrderTrackingList(orderConfirmationModel.value.incrementId ?? '');
      isLoading(false);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("this is error $e");
      Validators.appCatchError(error: e);
      isLoading(false);
    }
  }

  Future<void> getOrderTrackingList(String id) async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");
    try {
      List<OrderTrackingModel> returnReasonListData =
          await orderConfirmationApiRepository.getOrderTrackingResponse(
        id,
      );
      orderTrackingList.value = returnReasonListData;
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("$e");
      Validators.appCatchError(error: e);
    }
    debugPrint("OrderTracking  list Get $orderTrackingList");
    debugPrint("$orderTrackingList");
  }

  String getPaymentValue() {
    return paymentValue.value.additionalInformation == null ||
            (paymentValue.value.additionalInformation?.isEmpty ?? true)
        ? ''
        : paymentValue.value.additionalInformation?.first ?? '';
  }

  String getBillingAddress() {
    return "${billingAddress.value.street?[0] ?? ''}\n\n${billingAddress.value.city}, ${billingAddress.value.region}, ${billingAddress.value.postcode}\n\nT: ${billingAddress.value.telephone}";
  }

  String getAddress(Address address) {
    return "${address.street?[0] ?? ''}\n\n${address.city ?? ''}, ${address.region ?? ''}, ${address.postcode ?? ''}\n\nT: ${address.telephone ?? ''}";
  }

  String getCreatedDate() {
    return DateFormat.yMMMMd().format(
      DateTime.parse(
        orderConfirmationModel.value.createdAt?.toString() ?? '',
      ),
    );
  }

  bool checkOrderTrackingList(int index) {
    return orderTrackingList[index].statusDate.toString() == "null" ||
        orderTrackingList[index].statusDate.toString() == "";
  }
}
