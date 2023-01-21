import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_account_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';

class MyAccountInformationController extends GetxController {
  RxBool isLoading = true.obs;

  Rx<MyAccountDetails> myAccountModel = MyAccountDetails().obs;
  String defaultBilling = "";
  String billingTelephone = "";
  String defaultShipping = "";
  String shippingTelephone = "";
  Addresses defaultShippingAddress = Addresses();
  Addresses defaultBillingAddress = Addresses();
  MyAccountAPIRepository myAccountAPIRepository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  MyAccountInformationController();

  @override
  Future<void> onInit() async {
    super.onInit();
    localStore.checkGuest();
    if (!localStore.isGuest) {
      await getMyAccountDataFromApi();
    }
  }

  Future<void> getMyAccountDataFromApi() async {
    try {
      isLoading.value = true;

      MyAccountDetails myAccountDetails =
          await myAccountAPIRepository.getAccountDetailsResponse();
      myAccountModel.value = myAccountDetails;
      myAccountModel.value.addresses?.forEach((element) {
        if (myAccountModel.value.defaultShipping.toString() ==
            element.id.toString()) {
          defaultShipping =
              "${element.firstname}, ${element.lastname}, ${element.street?.first ?? ''}, ${element.city}, ${element.postcode}";
          shippingTelephone = element.telephone ?? '';
          defaultShippingAddress = element;
          log(element.id.toString(), name: "ID");
          log(myAccountModel.value.defaultShipping.toString(),
              name: "defaultShipping");
        }

        if (myAccountModel.value.defaultBilling.toString() ==
            element.id.toString()) {
          defaultBilling =
              "${element.firstname}, ${element.lastname}, ${element.street?.first ?? ''}, ${element.city}, ${element.postcode}";
          billingTelephone = element.telephone ?? '';
          defaultBillingAddress = element;
        }
      });
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
  }
}
