import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/contact_us_response_model.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/error_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';

class ContactUsController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt index = 0.obs;
  final AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ContactUsController();

  RxString chosenValue = LanguageConstants.typeOfEnquiryText.tr.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController onyourmindController = TextEditingController();
  RxBool isValid = false.obs;

  RxString chosenCountry = 'Admin'.obs;
  String countryCode = '1';

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

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);

      return false;
    }
    return true;
  }

  void submitButton(BuildContext context) {
    isValid.value = true;
    update(["ContactUs"]);

    if (validation()) {
      if (formKey.currentState?.validate() ?? false) {
        contactUsPost(context);
      } else if (nameController.text != "" &&
          surnameController.text != "" &&
          emailController.text != "" &&
          phoneController.text != "" &&
          subjectController.text != "" &&
          onyourmindController.text != "") {
        contactUsPost(context);
      }
    }
  }

  void contactUsPost(BuildContext context) async {
    try {
      List<ContactUsResponseModel> response =
          (await aboutAPIRepository.getContactUsApiResponse(
              jsonEncode(''),
              '10000',
              chosenCountry.value,
              subjectController.value.text,
              onyourmindController.value.text,
              'mobile',
              "+$countryCode${phoneController.value.text}",
              chosenValue.value,
              emailController.value.text,
              nameController.value.text,
              surnameController.value.text));
      debugPrint("contactUsResponseModel -> $response");
      if (response.isNotEmpty == true) {
        getRersponse.value = response;
      }
      if (getRersponse.first.status.toString() == "success") {
        AwesomeDialog(
          btnOkColor: Colors.black,
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Succcess',
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
          title: LanguageConstants.error.tr,
          desc: '${getRersponse.first.message}',
          btnOkOnPress: () {
            Navigator.pop(context);
          },
        ).show();
      }
      debugPrint(
          "contactUsResponseModel 111-> ${getRersponse.first.message.toString()}");
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }
  }
}
