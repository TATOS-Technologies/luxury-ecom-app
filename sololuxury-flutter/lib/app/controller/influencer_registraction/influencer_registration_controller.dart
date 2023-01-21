import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:solo_luxury/all_imports.dart';

class InfluencerRegistrationController extends GetxController {
  String countryCode = '1';
  RxString phoneErrorMsg = "".obs;
  final formKey = GlobalKey<FormState>().obs;
  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> contactNo = TextEditingController().obs;
  Rx<TextEditingController> websiteUrl = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> country = TextEditingController().obs;
  Rx<TextEditingController> postCode = TextEditingController().obs;
  Rx<TextEditingController> faceBook = TextEditingController().obs;
  Rx<TextEditingController> instagram = TextEditingController().obs;
  Rx<TextEditingController> twitter = TextEditingController().obs;
  Rx<TextEditingController> youtube = TextEditingController().obs;
  Rx<TextEditingController> linkedin = TextEditingController().obs;
  Rx<TextEditingController> pinterest = TextEditingController().obs;
  Rx<TextEditingController> faceBookFollower = TextEditingController().obs;
  Rx<TextEditingController> instagramFollower = TextEditingController().obs;
  Rx<TextEditingController> twitterFollower = TextEditingController().obs;
  Rx<TextEditingController> youtubeFollower = TextEditingController().obs;
  Rx<TextEditingController> linkedinFollower = TextEditingController().obs;
  Rx<TextEditingController> pinterestFollower = TextEditingController().obs;
  Rx<TextEditingController> projectWork = TextEditingController().obs;

  late final InfluencerApiRepository influencerApiRepository =
      InfluencerApiRepository();

  InfluencerRegistrationController();

  bool isSubmitButtonPressed = false;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint("PRIYA DETAILS");
  }

  Future<void> influencerReg(context) async {
    try {
      if (formKey.value.currentState?.validate() ?? false) {
        isLoading.value = true;
        InfluencerRegistrationMethodModel influencerRegistrationMethodModel =
            InfluencerRegistrationMethodModel(
          firstName: firstName.value.text.toString(),
          country: country.value.text.toString(),
          emailaddress: email.value.text.toString(),
          facebook: faceBook.value.text.toString(),
          postcode: postCode.value.text.toString(),
          city: city.value.text.toString(),
          facebookFollowers: faceBookFollower.value.text.toString(),
          instagram: instagram.value.text.toString(),
          instagramFollowers: instagramFollower.value.text.toString(),
          lastName: lastName.value.text.toString(),
          linkedin: linkedin.value.text.toString(),
          linkedinFollowers: linkedinFollower.value.text.toString(),
          phone: "+$countryCode${contactNo.value.text}",
          pinterest: pinterest.value.text.toString(),
          pinterestFollowers: pinterestFollower.value.text.toString(),
          twitter: twitter.value.text.toString(),
          twitterFollowers: twitterFollower.value.text.toString(),
          workedOn: projectWork.value.text.toString(),
          youtube: youtube.value.text.toString(),
          youtubeFollowers: youtubeFollower.value.text.toString(),
          website: "www.sololuxury.com",
          url: websiteUrl.value.text.toString(),
          langCode: "storeCode",
          type: "influencer",
          websiteName: "websitename",
        );
        (await influencerApiRepository.getInfluencerAPIResponse(
            json.encode(influencerRegistrationMethodModel)));
        Get.offAndToNamed<dynamic>(
            RoutesConstants.influencerRegistrationThankyouScreen);
      }
      isLoading.value = false;
      update(["influencer"]);
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
