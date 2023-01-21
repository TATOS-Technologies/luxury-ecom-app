import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/login/views/forget_password_menu/forgot_password_worng_email_screen.dart';

class ForgetPasswordMenuController extends GetxController {
  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ForgetPasswordMenuController();

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<bool> forgetPasswordResponseModel = false.obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  bool isValidation = false;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    debugPrint("INTSTATE");
    super.onInit();
  }

  Future<void> getForgetPasswordResponse(
      {required BuildContext context, String? email}) async {
    try {
      isLoading.value = true;
      final userData = {
        "email": email,
        "template": "email_reset",
        "websiteId": localStore.websiteId
      };
      debugPrint("INTSTATE123455");
      final bool data = (await authAPIRepository.putForgetPasswordApiResponse(
          forgetPasswordRequestJson: jsonEncode(userData)));
      if (data) {
        Get.to<dynamic>(() => const ForgetPasswordMenuScreen());
        forgetPasswordResponseModel.value = data;
        if (forgetPasswordResponseModel.value) {
          Get.snackbar(
              '',
              LanguageConstants
                  .forgotPasswordRequestSendedOnYourMailPleaseCheck.tr,
              colorText: Colors.black);
        }
      }
      log("loginResponseModel : $forgetPasswordResponseModel");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(
          e: e,
          callBack: (String errorMsg) {
            if (errorMsg.contains('User')) {
              Get.to<dynamic>(() => ForgetPasswordWrongEmailScreen());
            }
          });
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
