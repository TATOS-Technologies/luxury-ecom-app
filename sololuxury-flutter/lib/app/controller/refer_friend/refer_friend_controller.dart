import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:solo_luxury/all_imports.dart';

class ReferFriendController extends GetxController {
  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  TextEditingController refFirstNameController = TextEditingController();
  TextEditingController refEmailController = TextEditingController();
  TextEditingController refPhoneController = TextEditingController();
  TextEditingController yourFirstNameController = TextEditingController();
  TextEditingController yourEmailController = TextEditingController();
  TextEditingController yourPhoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String countryCode = '1';
  String countryFriendCode = '1';

  ReferFriendController();

  RxString firstNameErrorMsg = "".obs;
  RxString emailErrorMsg = "".obs;
  RxString phoneErrorMsg = "".obs;
  RxString fiendNameErrorMsg = "".obs;
  RxString fiendEmailErrorMsg = "".obs;
  RxString fiendPhoneErrorMsg = "".obs;

  RxBool isSuccessfully = false.obs;
  RxBool isLoading = false.obs;
  RxString responseMsg = "".obs;
  bool isSubmitButtonPressed = false;

  Future<void> referAFriendOnTap() async {
    isSubmitButtonPressed = true;
    try {
      if (formKey.currentState?.validate() ?? false) {
        isLoading.value = true;
        String data = await aboutAPIRepository.getReferFriendAPIResponse(
            refFirstName: refFirstNameController.text,
            refEmail: refEmailController.text,
            refPhone: "+$countryFriendCode${refPhoneController.text}",
            yourFirstName: yourFirstNameController.text,
            yourEmail: yourEmailController.text,
            yourPhone: "+$countryCode${yourPhoneController.text}");
        if (data.isNotEmpty == true) {
          isSuccessfully.value = true;
          responseMsg.value = data;
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
