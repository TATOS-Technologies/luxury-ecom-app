import 'dart:convert';

import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/influencer_api_repository.dart';
import 'package:meta_package/api/models/influence_registration/influencer_registration_model.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class InfluencerRegistrationController extends GetxController {
  String countryCode = '1';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController websiteUrl = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController postCode = TextEditingController();
  TextEditingController faceBook = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController twitter = TextEditingController();
  TextEditingController youtube = TextEditingController();
  TextEditingController linkedin = TextEditingController();
  TextEditingController pinterest = TextEditingController();
  TextEditingController faceBookFollower = TextEditingController();
  TextEditingController instagramFollower = TextEditingController();
  TextEditingController twitterFollower = TextEditingController();
  TextEditingController youtubeFollower = TextEditingController();
  TextEditingController linkedinFollower = TextEditingController();
  TextEditingController pinterestFollower = TextEditingController();
  TextEditingController projectWork = TextEditingController();
  RxString selectedStatus = "Mr".obs;
  bool isValidation = false;

  RxList<String> status = ['Mr', 'Mrs'].obs;

  late final InfluencerApiRepository influencerApiRepository =
      InfluencerApiRepository();

  InfluencerRegistrationController();

  bool validation() {
    if (!GetUtils.isEmail(email.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  Future<void> influencerReg(
      BuildContext context, GlobalKey<FormState> formKey) async {
    isValidation = true;
    update(["Influencer"]);
    try {
      if (validation()) {
        if (email.value.text != "" &&
            firstName.value.text != "" &&
            lastName.value.text != "" &&
            contactNo.value.text != "") {
          InfluencerRegistrationMethodModel influencerRegistrationMethodModel =
              InfluencerRegistrationMethodModel(
            firstName: firstName.text.toString(),
            country: country.text.toString(),
            emailaddress: email.text.toString(),
            facebook: faceBook.text.toString(),
            postcode: postCode.text.toString(),
            city: city.text.toString(),
            facebookFollowers: faceBookFollower.text.toString(),
            instagram: instagram.text.toString(),
            instagramFollowers: instagramFollower.text.toString(),
            lastName: lastName.text.toString(),
            linkedin: linkedin.text.toString(),
            linkedinFollowers: linkedinFollower.text.toString(),
            phone: "+$countryCode${contactNo.text.toString()}",
            pinterest: pinterest.text.toString(),
            pinterestFollowers: pinterestFollower.text.toString(),
            twitter: twitter.text.toString(),
            twitterFollowers: twitterFollower.text.toString(),
            workedOn: projectWork.text.toString(),
            youtube: youtube.text.toString(),
            youtubeFollowers: youtubeFollower.text.toString(),
            website: "www.avoir-chic.com",
            url: websiteUrl.text.toString(),
            langCode: "storeCode",
            type: "influencer",
            websiteName: "websitename",
          );

          await influencerApiRepository.getInfluencerAPIResponse(
              json.encode(influencerRegistrationMethodModel));
          Get.offAndToNamed(
              RoutesConstants.influencerRegistrationThankyouScreen);
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("ERROR:::::::::::::::::::::${e.toString()}");
      ExceptionHandler.appCatchError(error: e);
    }
  }
}
