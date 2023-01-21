import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/special_request_repository.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/error_dialog.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import '../../presentation/app_routes.dart';

class SpecialRequestController extends GetxController {
  String countryCode = '1';
  RxBool isSubmitButtonPressed = false.obs;
  SpecialRequestRepository specialRequestRepository =
      SpecialRequestRepository(baseUrl: AppConstants.apiEndPointLogin);

  SpecialRequestController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    brandNameController.text = (Get.arguments[0] ?? '').toString();

    if (localStore.userDetail.email != null) {
      emailController.text = localStore.userDetail.email ?? '';
      nameController.text = localStore.userDetail.firstname ?? '';
      lastNameController.text = localStore.userDetail.lastname ?? '';
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController styleController = TextEditingController();
  TextEditingController keywordController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  bool isValidation = false;

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  Future<void> contactUsPost(context) async {
    try {
      isSubmitButtonPressed.value = true;
      isLoading.value = true;
      isValidation = true;
      if (validation()) {
        if (nameController.value.text != '' &&
            lastNameController.value.text != '' &&
            emailController.value.text != '' &&
            phoneNumberController.value.text != '' &&
            brandNameController.value.text != '' &&
            styleController.value.text != "" &&
            keywordController.value.text != "" &&
            imageUrlController.value.text != "" &&
            remarkController.value.text != "") {
          Map<String, dynamic> response =
              (await specialRequestRepository.getSpecialRequestApiResponse(
                  nameController.value.text,
                  lastNameController.value.text,
                  emailController.value.text,
                  "+$countryCode${phoneNumberController.value.text}",
                  brandNameController.value.text,
                  styleController.value.text,
                  keywordController.value.text,
                  imageUrlController.value.text,
                  remarkController.value.text,
                  localStore.userDetail.id.toString(),
                  localStore.currentCode));
          if (response.containsKey('message')) {
            Get.toNamed(RoutesConstants.requestReceivedScreen);
          }
        }
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      Validators.appCatchError(error : e);
    } finally {
      isLoading.value = false;
    }
  }
}
