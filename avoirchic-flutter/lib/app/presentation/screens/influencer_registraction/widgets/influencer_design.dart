import 'package:avoirchic/app/controller/country_controller.dart';
import 'package:avoirchic/app/controller/influencer_registration_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_text_phone_field.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/screens/influencer_registraction/widgets/textform_field_widget.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../theme/colors.dart';

class InfluencerDesign extends GetView<InfluencerRegistrationController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: GetBuilder<InfluencerRegistrationController>(
              id: "Influencer",
              builder: (controller) {
                return Form(
                  key: controller.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: borderGrey)),
                                    child: Row(
                                      children: [
                                        DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            padding: const EdgeInsets.all(1),
                                            child: DropdownButton<String>(
                                              isExpanded: false,
                                              style: AppTextStyle
                                                  .textStyleUtils400(
                                                      color: Colors.grey),
                                              value: controller
                                                  .selectedStatus.value,
                                              iconSize: 15,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: controller.status
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(
                                                    items,
                                                    style: AppTextStyle
                                                        .textStyleUtils400(
                                                            color: grey636363),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? val) {
                                                controller.selectedStatus
                                                    .value = val!;
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 40.h,
                                            child: TextFormField(
                                              controller: controller.firstName,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      controller.isValidation &&
                                                              controller
                                                                      .firstName
                                                                      .text ==
                                                                  ""
                                                          ? LanguageConstants
                                                              .enterFirstName.tr
                                                          : LanguageConstants
                                                              .firstNameText.tr,
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 40.h,
                                    child: TextFormFieldWidget(
                                      hintText: controller.isValidation &&
                                              controller.lastName.text == ""
                                          ? LanguageConstants.enterLastName.tr
                                          : LanguageConstants.lastNameText.tr,
                                      textEditingController:
                                          controller.lastName,
                                      validation: (value) => null,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: controller.isValidation &&
                                          controller.email.text == ""
                                      ? LanguageConstants.enterEmailAddress.tr
                                      : LanguageConstants.emailText.tr,
                                  textEditingController: controller.email,
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
                                  textController: controller.contactNo,
                                  cursorColor: blackColor,
                                  dropdownIconColor: borderGrey,
                                  borderColor: borderGrey,
                                  country: Get.find<CountryController>()
                                      .country!
                                      .value,
                                  focusedColor: borderGrey,
                                  dropdownTextStyle:
                                      AppTextStyle.textStyleUtils400(),
                                  fontStyle: AppTextStyle.textStyleUtils400(),
                                  hintStyle: AppTextStyle.textStyleUtils400(
                                    color: grey636363,
                                  ),
                                  hintText: controller.isValidation &&
                                          controller.contactNo.text == ""
                                      ? LanguageConstants.enterPhoneNumber.tr
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
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.websiteUrlText.tr,
                                  textEditingController: controller.websiteUrl,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.cityText.tr,
                                  textEditingController: controller.city,
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
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.countryText.tr,
                                  textEditingController: controller.country,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.postCodeText.tr,
                                  textEditingController: controller.postCode,
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
                          style: AppTextStyle.textStyleUtils400(
                              color: blue367587, size: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.facebookText.tr,
                                  textEditingController: controller.faceBook,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.instagramText.tr,
                                  textEditingController: controller.instagram,
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
                                child: TextFormFieldWidget(
                                  hintText:
                                      '${LanguageConstants.youtubeText.tr} twitter',
                                  textEditingController: controller.twitter,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.youtubeText.tr,
                                  textEditingController: controller.youtube,
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
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.linkendinText.tr,
                                  textEditingController: controller.linkedin,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.pinterestText.tr,
                                  textEditingController: controller.pinterest,
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
                          style: AppTextStyle.textStyleUtils400(
                              color: blue367587, size: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.facebookText.tr,
                                  textEditingController:
                                      controller.faceBookFollower,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.instagramText.tr,
                                  textEditingController:
                                      controller.instagramFollower,
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
                                child: TextFormFieldWidget(
                                  hintText:
                                      '${LanguageConstants.youtubeText.tr} twitter',
                                  textEditingController:
                                      controller.twitterFollower,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.youtubeText.tr,
                                  textEditingController:
                                      controller.youtubeFollower,
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
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.linkendinText.tr,
                                  textEditingController:
                                      controller.linkedinFollower,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: TextFormFieldWidget(
                                  hintText: LanguageConstants.pinterestText.tr,
                                  textEditingController:
                                      controller.pinterestFollower,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormFieldWidget(
                          bottomPadding: 50.0,
                          topPadding: 10.0,
                          height: 79.0,
                          hintText: LanguageConstants.workedOnText.tr,
                          textEditingController: controller.projectWork,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        SizedBox(
                          height: 35.w,
                          width: 120.w,
                          child: CommonThemeButton(
                            onTap: () {
                              controller.influencerReg(
                                context,
                                controller.formKey,
                              );
                            },
                            title: LanguageConstants.submitText.tr,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
