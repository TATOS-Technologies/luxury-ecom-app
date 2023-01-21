import 'dart:convert';

import 'package:avoirchic/app/controller/country_controller.dart';
import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/contact_us_response_model.dart';

import '../core/utils/app_routes.dart';
import '../core/utils/lang_directory/language_constant.dart';
import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class ContactUsController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxInt index = 0.obs;
  final AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ContactUsController();

  RxString chosenValue = LanguageConstants.typeOfEnquiryText.tr.obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> surnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> confirmEmailController =
      TextEditingController().obs;
  Rx<TextEditingController> subjectController = TextEditingController().obs;
  Rx<TextEditingController> onyourmindController = TextEditingController().obs;
  bool isSubmitButtonPressed = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxString chosenCountry = ''.obs;
  bool isValidation = false;
  String countryCode = '1';

  List<String> data = [
    LanguageConstants.typeOfEnquiryText.tr,
    LanguageConstants.deliveryText.tr,
    LanguageConstants.ordersText.tr,
    LanguageConstants.paymentText.tr,
    LanguageConstants.productText.tr,
    LanguageConstants.promotionText.tr,
    LanguageConstants.returnsContactText.tr,
    LanguageConstants.shipping.tr,
    LanguageConstants.technicalText.tr,
  ];
  Rx<ContactUsResponseModel> contactUsResponseModel =
      ContactUsResponseModel().obs;
  RxList<ContactUsResponseModel> getRersponse =
      RxList<ContactUsResponseModel>();

  final CountryController countryController = Get.find();

  @override
  Future<void> onInit() async {
    chosenCountry.value = countryController.storeWebsitesList
            .firstWhere((element) =>
                element.websiteId.toString() == localStore.websiteId)
            .name ??
        '';
  }

  String getName() {
    if (nameController.value.text == '' && isSubmitButtonPressed) {
      return LanguageConstants.firstNameIsRequired.tr;
    } else {
      return LanguageConstants.firstNameText.tr;
    }
  }

  String getSurName() {
    if (surnameController.value.text == '' && isSubmitButtonPressed) {
      return LanguageConstants.surnameIsRequired.tr;
    } else {
      return LanguageConstants.surNameText.tr;
    }
  }

  String getEmail() {
    if (emailController.value.text == '' && isSubmitButtonPressed) {
      return LanguageConstants.emailIsRequired.tr;
    } else {
      return LanguageConstants.emailText.tr;
    }
  }

  String getConfirmEmail() {
    if (confirmEmailController.value.text == '' && isSubmitButtonPressed) {
      return LanguageConstants.confirmationEmailRequired.tr;
    } else {
      return LanguageConstants.confirmEmailText.tr;
    }
  }

  String getSubject() {
    if (subjectController.value.text == '' && isSubmitButtonPressed) {
      return LanguageConstants.enterSubject.tr;
    } else {
      return LanguageConstants.subjectText.tr;
    }
  }

  String getDescription() {
    if (onyourmindController.value.text == '' && isSubmitButtonPressed) {
      return LanguageConstants.descriptionIsRequired.tr;
    } else {
      return LanguageConstants.whatsonyourmindText.tr;
    }
  }

  Future<void> contactUsPost(context) async {
    isSubmitButtonPressed = true;
    update();

    try {
      List<ContactUsResponseModel> response =
          (await aboutAPIRepository.getContactUsApiResponse(
              jsonEncode(''),
              '10000',
              chosenCountry.value,
              subjectController.value.text,
              onyourmindController.value.text,
              'mobile',
              '1234567890',
              chosenValue.value,
              emailController.value.text,
              nameController.value.text,
              surnameController.value.text));
      debugPrint("contactUsResponseModel -> $response");
      // var jsonList = json.decode(response);
      // debugPrint("Respons eJson $jsonList");
      getRersponse.value = response;
      Get.toNamed(RoutesConstants.contactUsSubmissionScreen);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }
}
