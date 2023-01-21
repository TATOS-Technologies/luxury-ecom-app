import 'dart:developer';

/*import 'package:get_storage/get_storage.dart';*/
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_account_repository.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';

class MyAccountController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = true.obs;
  RxString countryCurrency = "".obs;
  bool isSubmitButtonPressed = false;
  Rx<MyAccountDetails>? accountDetail = MyAccountDetails().obs;

  final MyAccountAPIRepository myAccountAPIRepository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  @override
  void onInit() {
    super.onInit();
    getCountryData();
    localStore.checkGuest();

    if (!localStore.isGuest) {
      getAccountDetails();
    }
  }

  Future<void> getAccountDetails() async {
    debugPrint("getAccountDetailFromApi -> ");
    isLoading.value = true;
    try {
      MyAccountDetails data =
          await myAccountAPIRepository.getAccountDetailsResponse();
      accountDetail?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  bool validation() {
    if (!GetUtils.isEmail(emailController.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  Future<void> getCountryData() async {
    try {
      String data = LocalStore.getPrefStringValue(kLocalStoreModelKey);
      if (data.isNotEmpty) {
        LocalStoreModel localStoreModel =
            LocalStoreModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
        debugPrint("Get LocalMap -> ${jsonEncode(localStoreModel)}");
        countryCurrency.value =
            "${localStoreModel.name}";
      }
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
