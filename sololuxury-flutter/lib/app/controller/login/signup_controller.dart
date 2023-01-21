import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_account_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_account/update_user_request_model.dart';
import 'package:meta_package/api/models/signup_response_model.dart';
import 'package:solo_luxury/all_imports.dart';

class SignupController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> dateOfBirthController = TextEditingController().obs;
  // Rx<TextEditingController> marriageAnniversaryController =
  // TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  RxBool newsLetter = false.obs;
  RxBool isAgred = false.obs;
  RxString mrms = 'Mr'.obs;
  RxBool isLoading = false.obs;
  RxBool isValidation = false.obs;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  Rx<SignUpResponseModel?> signUpResponseModel = SignUpResponseModel().obs;
  Rx<String> loginResponseModel = "".obs;
  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  RxBool? isRegister = false.obs;
  MyAccountDetails? getAddressList = Get.arguments[1] as MyAccountDetails;
  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  MyAccountAPIRepository repository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  SignupController();

  @override
  void onInit() {
    isRegister = (Get.arguments[0] == 1).obs;
    if (isRegister!.value == true) {
      emailController.value.text = getAddressList!.email.toString();
      lastNameController.value.text = getAddressList!.lastname.toString();
      firstNameController.value.text = getAddressList!.firstname.toString();
      dateOfBirthController.value.text = getAddressList!.dob.toString();
    }
    super.onInit();
  }

  Future<void> onSave(context) async {
    isValidation.value = true;

    UpdateUserRequest userData = UpdateUserRequest(
        customer: CustomerDetails(
      firstname: firstNameController.value.text,
      lastname: lastNameController.value.text,
      email: emailController.value.text,
    ));

    if (true) {
      isLoading.value = true;
      try {
        MyAccountDetails? responseData = await repository.updateUser(userData);
        if (responseData != null) {
          Get.back();
          Get.snackbar(LanguageConstants.alert.tr, LanguageConstants.userUpdateMsg.tr,
              backgroundColor: Colors.white, colorText: Colors.black);
        }
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e) {
        ExceptionHandler.appCatchError(error: e);
        log(e.toString(), name: "Error");
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> registerUser(context) async {
    isValidation.value = true;
    if (formKey.value.currentState!.validate()) {
      if (newsLetter.value) {
        isLoading.value = true;
        SignUpRequestModel signUpRequestModel = SignUpRequestModel(
          customer: Customer(
            addresses: [],
            firstname: firstNameController.value.text,
            lastname: lastNameController.value.text,
            email: emailController.value.text.trim(),
            websiteId: int.tryParse(localStore.websiteId),
            dob: dateOfBirthController.value.text,

            // extensionAttributes: RequestExtensionAttributes(
            //   dom: marriageAnniversaryController.value.text,
            // ),
          ),
          password: passwordController.value.text.trim(),
        );
        isLoading.value = true;
        try {
          MyAccountDetails? data =
              await authAPIRepository.signUpWithEmail(signUpRequestModel);
          if (data != null) {
            loginResponseModel.value = localStore.customerToken;
            Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
          }
        } on ApiException catch (e) {
          ExceptionHandler.apiExceptionError(e: e);
        } catch (e) {
          ExceptionHandler.appCatchError(error: e);
          log(e.toString(), name: "Error");
        } finally {
          isLoading.value = false;
        }
      } else {
        Get.snackbar(LanguageConstants.alert.tr,
            LanguageConstants.pleaseAgreeForNewsletter.tr,
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  Future<void> googleLogin() async {
    try {
      isLoading.value = true;
      MyAccountDetails? data = await authAPIRepository.loginWithGoogleSignIn();
      if (data != null) {
        loginResponseModel.value = localStore.customerToken;
        Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
      }
      isLoading.value = false;
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    }
  }

  Future<void> appleLogin() async {
    try {
      isLoading.value = true;
      await authAPIRepository.loginWithAppleSignIn();
      loginResponseModel.value = localStore.customerToken;
      Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
      isLoading.value = false;
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      isLoading.value = true;
      await authAPIRepository.loginWithFacebook();
      loginResponseModel.value = localStore.customerToken;
      Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
      isLoading.value = false;
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    }
  }

  Future<void> loginWithTwitter() async {
    try {
      isLoading.value = true;
      MyAccountDetails? data = await authAPIRepository.loginWithTwitter();
      if (data != null) {
        loginResponseModel.value = localStore.customerToken;
        Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
      }
      isLoading.value = false;
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    }
  }
}
