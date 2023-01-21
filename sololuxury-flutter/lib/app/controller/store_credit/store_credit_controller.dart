import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/store_api_repository.dart';
import 'package:meta_package/api/models/store_credit/store_credit_model.dart';
import 'package:solo_luxury/all_imports.dart';

class StoreCreditController extends GetxController {
  RxInt index = 0.obs;
  Rx<ExpandableController> aboutUsExpandableController =
      ExpandableController().obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  var shoopingbiling = true.obs;

  RxList<StoreCreditModel>? getStoreCreditList = <StoreCreditModel>[].obs;

  StoreAPIRepository storeAPIRepository =
      StoreAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;

  StoreCreditController({this.countryCode});

  @override
  void onInit() {
    getStoreCredit();
    super.onInit();
  }

  var nodata = false.obs;
  var messageData = "".obs;

//CountrList
  Future getStoreCredit() async {
    await localStore.getUserDetail();
    debugPrint("User Id -> ${localStore.userDetail.id}");
    shoopingbiling.value = true;
    try {
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
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      shoopingbiling.value = false;
    }
  }
}
