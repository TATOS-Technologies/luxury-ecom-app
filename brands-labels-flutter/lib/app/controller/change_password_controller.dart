import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_account_repository.dart';
import 'package:meta_package/translations/translations.dart';

class ChangePasswordController extends GetxController {
  RxBool isLoading = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<TextEditingController> currentPasswordController =
      TextEditingController().obs;

  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  final MyAccountAPIRepository myAccountAPIRepository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ChangePasswordController();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> changePassword() async {
    try {
      isLoading.value = true;
      final result = await myAccountAPIRepository.changePasswordResponse(
          currentPasswordController.value.text.toString(),
          passwordController.value.text.toString());
      if (result) {
        Get.back<dynamic>();
        Get.snackbar(
          LanguageConstants.changePassword.tr,
          LanguageConstants.passwordSuccessfullyUpdated.tr,
        );
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
