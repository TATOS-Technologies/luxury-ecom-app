import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/controller/influencer_registraction/influencer_registration_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_form_field.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_phone_field.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class InfluencerRegistrationScreen
    extends GetView<InfluencerRegistrationController> {
  InfluencerRegistrationScreen({Key? key}) : super(key: key);

  final InfluencerRegistrationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(
            title: LanguageConstants.influencerRegistrationText.tr),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GetBuilder<InfluencerRegistrationController>(
                id: "influencer",
                builder: (controller) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        LanguageConstants.profile.tr,
                        style: AppTextStyle.headerTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: borderGrey,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 40.h,
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      padding: const EdgeInsets.all(1),
                                      child: DropdownButton<String>(
                                        isExpanded: false,
                                        style: AppTextStyle.textStyleUtils400(
                                            color: Colors.grey),
                                        value: controller.selectedStatus.value,
                                        iconSize: 15,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: controller.status
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? val) {
                                          controller.selectedStatus.value =
                                              val!;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                  height: 40.h,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: controller.isValid &&
                                              controller.firstName.value.text ==
                                                  ""
                                          ?  LanguageConstants.enterFirstName.tr
                                          : LanguageConstants.firstNameText.tr,
                                    ),
                                    controller: controller.firstName.value,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40.h,
                        child: CommonTextFormField(
                          hintText: controller.isValid &&
                                  controller.lastName.value.text == ""
                              ?  LanguageConstants.enterLastName.tr
                              : LanguageConstants.lastNameText.tr,
                          controller: controller.lastName.value,
                          validation: (value) => null,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: controller.isValid &&
                                        controller.email.value.text == ""
                                    ?  LanguageConstants.enterEmailAddress.tr
                                    : LanguageConstants.emailText.tr,
                                controller: controller.email.value,
                                validation: (value) => null,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextPhoneField(
                                fillColor: whiteColor,
                                filled: true,
                                textController: controller.contactNo.value,
                                cursorColor: blackColor,
                                country:
                                    Get.find<CountryController>().country.value,
                                dropdownIconColor: borderGrey,
                                borderColor: borderGrey,
                                focusedColor: borderGrey,
                                dropdownTextStyle:
                                    AppTextStyle.textStyleUtils400(),
                                fontStyle: AppTextStyle.textStyleUtils400(),
                                hintStyle: AppTextStyle.textStyleUtils400(),
                                errorBorderColor: borderGrey,
                                hintText: controller.isValid &&
                                        controller.contactNo.value.text == ""
                                    ?  LanguageConstants.enterPhoneNumber.tr
                                    : LanguageConstants.contactNoText.tr,
                                onCountryChanged: (country) {
                                  controller.countryCode = country.dialCode;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.websiteUrlText.tr,
                                controller: controller.websiteUrl.value,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.cityText.tr,
                                controller: controller.city.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.countryText.tr,
                                controller: controller.country.value,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.postCodeText.tr,
                                controller: controller.postCode.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        LanguageConstants.socialLinksText.tr,
                        style: AppTextStyle.headerTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.facebookText.tr,
                                controller: controller.faceBook.value,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.instagramText.tr,
                                controller: controller.instagram.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.youtubeText.tr +
                                    ' twitter',
                                controller: controller.twitter.value,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.youtubeText.tr,
                                controller: controller.youtube.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.linkendinText.tr,
                                controller: controller.linkedin.value,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.pinterestText.tr,
                                controller: controller.pinterest.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        LanguageConstants.followersText.tr,
                        style: AppTextStyle.headerTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.facebookText.tr,
                                controller: controller.faceBookFollower.value,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.instagramText.tr,
                                controller: controller.instagramFollower.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.youtubeText.tr +
                                    ' twitter',
                                controller: controller.twitterFollower.value,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.youtubeText.tr,
                                controller: controller.youtubeFollower.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.linkendinText.tr,
                                controller: controller.linkedinFollower.value,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: CommonTextFormField(
                                hintText: LanguageConstants.pinterestText.tr,
                                controller: controller.pinterestFollower.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40.h,
                        child: CommonTextFormField(
                          hintText: LanguageConstants.workedOnText.tr,
                          controller: controller.projectWork.value,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CommonThemeButton(
                        onTap: () {
                          controller.influencerReg(
                              context, controller.formKey.value);
                        },
                       
                          title: LanguageConstants.submitText.tr,
                          
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
