import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/controller/influencer_registraction/influencer_registration_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/common_text_phone_field.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/screens/influencer_registraction/widgets/error_text_widget.dart';
import 'package:veralusso/app/presentation/screens/influencer_registraction/widgets/influencer_reg_form_field.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class InfluencerRegistrationScreen
    extends GetView<InfluencerRegistrationController> {
  const InfluencerRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          commonAppbar(title: LanguageConstants.influencerRegistrationText.tr),
      // backgroundColor: greenD1F1FF,
      body: const InfluencerDesign(),
    );
  }
}

class InfluencerDesign extends GetView<InfluencerRegistrationController> {
  const InfluencerDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: GetBuilder<InfluencerRegistrationController>(
        id: "Influencer",
        builder: (controller) {
          return Form(
            key: controller.formKey.value,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      LanguageConstants.profile.tr,
                      style: AppTextStyle.textStyleUtils600_16(),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Obx(() => Container(
                    height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: textFieldBoarderColor,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 39,
                                width: 50,
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    padding: const EdgeInsets.all(1),
                                    child: DropdownButton<String>(
                                      isExpanded: false,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      value: controller.selectedStatus.value,
                                      iconSize: 15,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items:
                                          controller.status.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: CommonTextPoppins(
                                            items,
                                            
                                              
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: grey636363,
                                            
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? val) {
                                        controller.selectedStatus.value =
                                            val ?? '';
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: InfluencerRegFormField(
                                desableBorder: true,
                                hintText: controller.isValid &&
                                        controller.firstName.value.text == ""
                                    ? LanguageConstants.enterFirstName.tr
                                    : LanguageConstants.firstNameText.tr,
                                controller: controller.firstName.value,
                                // ignore: avoid_returning_null_for_void
                                // validation: (){},
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  InfluencerRegFormField(
                    color: textFieldBoarderColor,
                    hintText: controller.isValid &&
                            controller.lastName.value.text == ""
                        ? LanguageConstants.enterLastName.tr
                        : LanguageConstants.lastNameText.tr,
                    controller: controller.lastName.value,
                    // validation: (){},
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: controller.isValid &&
                                  controller.email.value.text == ""
                              ? LanguageConstants.enterEmailAddress.tr
                              : LanguageConstants.emailText.tr,
                          controller: controller.email.value,
                          // validation:(){},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45.h,
                          child: CommonTextPhoneField(
                            textController: controller.contactNo.value,
                            textColor: darkGrey,
                            cursorColor: regularGrey,
                            country: Get.find<CountryController>()
                                .country!
                                .value
                                .toString(),
                            dropdownIconColor: darkGrey,
                            borderColor: darkGrey,
                            focusedColor: darkGrey,
                            errorBorderColor: red,
                            dropdownTextStyle:
                                AppTextStyle.textStyleUtils400_16(
                                    color: darkGrey),
                            fontStyle: AppTextStyle.textStyleUtils400_16(
                                color: darkGrey),
                            hintStyle: AppTextStyle.textStyleUtils400_16(
                                color: regularGrey),
                            hintText: controller.isValid &&
                                    controller.contactNo.value.text == ""
                                ? LanguageConstants.enterPhoneNumber.tr
                                : LanguageConstants.contactNoText.tr,
                            hintColor: appColor,
                            onCountryChanged: (country) {
                              controller.countryCode = country.dialCode;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(() => Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ErrorTextWidget(controller.phoneErrorMsg.value),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.websiteUrlText.tr,
                          controller: controller.websiteUrl.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.cityText.tr,
                          controller: controller.city.value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.countryText.tr,
                          controller: controller.country.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.postCodeText.tr,
                          controller: controller.postCode.value,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      LanguageConstants.socialLinksText.tr,
                      style: AppTextStyle.textStyleUtils600_16(),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.facebookText.tr,
                          controller: controller.faceBook.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.instagramText.tr,
                          controller: controller.instagram.value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: 'twiter',
                          controller: controller.twitter.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.youtubeText.tr,
                          controller: controller.youtube.value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.linkendinText.tr,
                          controller: controller.linkedin.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.pinterestText.tr,
                          controller: controller.pinterest.value,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      LanguageConstants.followersText.tr,
                      style: AppTextStyle.textStyleUtils600_16(),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.facebookText.tr,
                          controller: controller.faceBookFollower.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.instagramText.tr,
                          controller: controller.instagramFollower.value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: 'twitter',
                          controller: controller.twitterFollower.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.youtubeText.tr,
                          controller: controller.youtubeFollower.value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.linkendinText.tr,
                          controller: controller.linkedinFollower.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InfluencerRegFormField(
                          color: textFieldBoarderColor,
                          hintText: LanguageConstants.pinterestText.tr,
                          controller: controller.pinterestFollower.value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  InfluencerRegFormField(
                    color: textFieldBoarderColor,
                    bottomPadding: 50.0,
                    topPadding: 10.0,
                    height: 79.0,
                    hintText: LanguageConstants.workedOnText.tr,
                    controller: controller.projectWork.value,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 45.h,
                    width: 327.w,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.influencerReg(
                            context, controller.formKey.value);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: blackColor,
                       shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),

                       )
                      ),
                      child: Text(
                        LanguageConstants.submitText.tr,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyle.textStyleUtils400(color: whiteColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
