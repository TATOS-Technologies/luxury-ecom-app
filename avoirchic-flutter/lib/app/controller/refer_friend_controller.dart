import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class ReferFriendController extends GetxController {
  String countryCode = '1';
  String countryCodeFriend = '1';

  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  TextEditingController refFirstNameController = TextEditingController();
  TextEditingController refEmailController = TextEditingController();
  TextEditingController refPhoneController = TextEditingController();
  TextEditingController yourFirstNameController = TextEditingController();
  TextEditingController yourEmailController = TextEditingController();
  TextEditingController yourPhoneController = TextEditingController();
  bool isValidation = false;

  ReferFriendController();

  RxBool isSuccessfully = false.obs;
  RxString responseMsg = "".obs;

  Future<void> postData() async {
    try {
      isValidation = true;
      update(["refer"]);
      String data = await aboutAPIRepository.getReferFriendAPIResponse(
          refFirstName: refFirstNameController.text,
          refEmail: refEmailController.text,
          refPhone: "+$countryCodeFriend${refPhoneController.text}",
          yourFirstName: yourFirstNameController.text,
          yourEmail: yourEmailController.text,
          yourPhone: "+$countryCode${yourPhoneController.text}");
      debugPrint("message---> $data");
      if (data.isNotEmpty) {
        isSuccessfully.value = true;
        responseMsg.value = data;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    // ScaffoldMessenger.of(Get.context!).showSnackBar(
    //   SnackBar(content: CommonTextPoppins(message)),
    // );
  }
}
