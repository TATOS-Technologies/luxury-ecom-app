import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/store_api_repository.dart';
import 'package:meta_package/api/models/store_credit/store_credit_model.dart';

class StoreCreditController extends GetxController {
  RxInt index = 0.obs;

  var shoopingbiling = false.obs;

  List storeCreditLIst = [
    {
      "Date": " 3/21/2022",
      "Description":
          "Lorem ipsum is placeholder text commonly used in the graphic",
      "Account": "₹6,999",
      "Balance": "₹15,693",
      "Remarks": "1",
    },
    {
      "Date": " 3/21/2022",
      "Description":
          "Lorem ipsum is placeholder text commonly used in the graphic",
      "Account": "₹1,999",
      "Balance": "₹9,693",
      "Remarks": "2",
    },
    {
      "Date": " 3/21/2022",
      "Description":
          "Lorem ipsum is placeholder text commonly used in the graphic",
      "Account": "₹1,999",
      "Balance": "₹9,693",
      "Remarks": "2",
    },
    {
      "Date": " 3/21/2022",
      "Description":
          "Lorem ipsum is placeholder text commonly used in the graphic",
      "Account": "₹1,999",
      "Balance": "₹9,693",
      "Remarks": "2",
    },
  ];

  StoreAPIRepository storeAPIRepository =
      StoreAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;

  StoreCreditController({this.countryCode});

  RxList<StoreCreditModel>? getStoreCreditList = <StoreCreditModel>[].obs;

  @override
  void onInit() {
    getStoreCredit();
    super.onInit();
  }

  var nodata = false.obs;
  var messageData = "".obs;

//CountrList
  Future<void> getStoreCredit() async {
    try {
      shoopingbiling.value = true;
      await localStore.getUserDetail();
      debugPrint("User Id -> ${localStore.userDetail.id}");
      // todo confirm the response structure on success and need to update response strucutre
      List<StoreCreditModel> storeCredit =
          await storeAPIRepository.getStoreCreditResponse();

      debugPrint("temas_condition Get $storeCredit");
      getStoreCreditList?.value = storeCredit;

      nodata.value = false;
      shoopingbiling.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      nodata.value = false;
      shoopingbiling.value = false;
    }
  }
}
