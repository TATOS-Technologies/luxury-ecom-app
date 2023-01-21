import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/contact_us_response_model.dart';

class ContactUsController extends GetxController {
  String countryCode = '1';
  RxString phoneErrorMsg = "".obs;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt index = 0.obs;
  final AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ContactUsController();

  RxString chosenTypeOfEnquiryValue = "".obs;
  RxString chosenCountry = "".obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final CountryController countryController = Get.find();

  RxList<String> status = ['Mr', 'Mrs'].obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController onYourMindController = TextEditingController();
  bool isValid = false;
  bool isSubmitButtonPressed = false;

  RxString nameErrorMsg = "".obs;
  RxString surnameErrorMsg = "".obs;
  RxString emailErrorMsg = "".obs;
  RxString confirmEmailErrorMsg = "".obs;
  RxString phoneEmailErrorMsg = "".obs;
  RxString subjectEmailErrorMsg = "".obs;
  RxString onYourMindEmailErrorMsg = "".obs;
  RxString typeOfEnquiryErrorMsg = "".obs;
  RxString countryErrorMsg = "".obs;
  RxString msgErrorMsg = "".obs;

  List<String> data = [
    LanguageConstants.typeOfEnquiryText.tr,
    LanguageConstants.deliveryText.tr,
    LanguageConstants.ordersText.tr,
    LanguageConstants.paymentText.tr,
    LanguageConstants.productText.tr,
    LanguageConstants.promotionText.tr,
    LanguageConstants.returnsContactText.tr,
    LanguageConstants.shippingText.tr,
    LanguageConstants.technicalText.tr,
  ];
  Rx<ContactUsResponseModel> contactUsResponseModel =
      ContactUsResponseModel().obs;
  RxList<ContactUsResponseModel> getRersponse =
      RxList<ContactUsResponseModel>();

  @override
  Future<void> onInit() async {
    super.onInit();
    chosenCountry.value = countryController.storeWebsitesList
            .firstWhere((element) =>
                element.websiteId.toString() == localStore.websiteId)
            .name ??
        '';
  }

  Future<void> contactUsPost(BuildContext context) async {
    isValid = true;
    update(["Contact"]);
    try {
      if (formKey.currentState?.validate() ?? false) {
        List<ContactUsResponseModel> response =
            (await aboutAPIRepository.getContactUsApiResponse(
                jsonEncode(''),
                '10000',
                chosenCountry.value,
                subjectController.value.text,
                onYourMindController.value.text,
                'mobile',
                "+$countryCode${phoneController.value.text}",
                chosenTypeOfEnquiryValue.value,
                emailController.value.text,
                nameController.value.text,
                surnameController.value.text));
        debugPrint("contactUsResponseModel -> $contactUsResponseModel");
        if (response.isNotEmpty == true) {
          getRersponse.value = response;
        }
        if (getRersponse.first.status.toString() == "success") {
          AwesomeDialog(
            btnOkColor: appColor,
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.bottomSlide,
            title: 'Success',
            desc: '${getRersponse.first.message}',
            btnOkOnPress: () {
              Navigator.pop(context);
            },
          ).show();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'Error',
            desc: '${getRersponse.first.message}',
            btnOkOnPress: () {
              Navigator.pop(context);
            },
          ).show();
        }
        debugPrint(
            "contactUsResponseModel 111-> ${getRersponse.first.message}");
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log("e ==> ${e.toString()}");
      ExceptionHandler.appCatchError(error: e);
    }
  }
}
