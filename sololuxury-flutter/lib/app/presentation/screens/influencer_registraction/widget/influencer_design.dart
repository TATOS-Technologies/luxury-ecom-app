import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/screens/influencer_registraction/widget/error_text.dart';

import '../../../../../all_imports.dart';
import '../../../common_widget/common_widget/common_text_phone_field.dart';
import 'common_text_form_field.dart';

class InfluencerDesign extends StatelessWidget {
  const InfluencerDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, right: 24.w, left: 24.w),
      child: SingleChildScrollView(
        child: GetBuilder<InfluencerRegistrationController>(
          id: "influencer",
          builder: (controller) {
            return Form(
              key: controller.formKey.value,
              child: Column(
                children: [
                  Text(
                    LanguageConstants.profile.tr,
                    style: AppStyle.textStyleUtils400_16(color: appColorPrimary)
                        .copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: appColor,
                      decorationThickness: 1.5,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: appTileColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 39,
                          width: 62,
                          child: Text(
                            LanguageConstants.mr.tr,
                            style:
                                AppStyle.textStyleUtils400(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CommonTextFormField(
                            hintText: LanguageConstants.firstNameText.tr,
                            controller: controller.firstName.value,
                            height: 0.0,
                            bottomPadding: 0.0,
                            topPadding: 0.0,
                            validation: (value) => Validators.validateName(
                              value?.trim() ?? '',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFormField(
                    hintText: LanguageConstants.lastNameText.tr,
                    controller: controller.lastName.value,
                    height: 0.0,
                    bottomPadding: 0.0,
                    topPadding: 0.0,
                    validation: (value) => Validators.validateName(
                      value?.trim() ?? '',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextFormField(
                          hintText: LanguageConstants.emailText.tr,
                          controller: controller.email.value,
                          height: 0.0,
                          bottomPadding: 0.0,
                          topPadding: 0.0,
                          validation: (value) => Validators.validateEmail(
                            value?.trim(),
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
                          width: Get.width,
                          child: CommonTextPhoneField(
                            filled: true,
                            fillColor: appTileColor,
                            textController: controller.contactNo.value,
                            fontStyle: AppStyle.textStyleUtils400(),
                            hintStyle:
                                AppStyle.textStyleUtils400(color: Colors.grey),
                            textColor: blackColor,
                            cursorColor: Colors.black,
                            dropdownTextColor: blackColor,
                            country:
                                Get.find<CountryController>().country?.value,
                            dropdownIconColor: appColorButton,
                            dropdownTextStyle: const TextStyle(
                                fontSize: 12, color: blackColor),
                            borderColor: Colors.transparent,
                            errorBorderColor: Colors.transparent,
                            hintText: (controller.contactNo.value.text == "" &&
                                    controller.isSubmitButtonPressed)
                                ? LanguageConstants.contactRequired.tr
                                : LanguageConstants.contactNoText.tr,
                            hintColor: blackColor,
                            onCountryChanged: (country) {
                              controller.countryCode = country.dialCode;
                            },
                            validator: (value) => Validators.validateMobile(
                              value?.number ?? '',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: ErrorText(
                        text: controller.phoneErrorMsg.value,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.websiteUrlText.tr,
                          controller: controller.websiteUrl.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.cityText.tr,
                          controller: controller.city.value,
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
                        child: textFormField(
                          hintText: LanguageConstants.countryText.tr,
                          controller: controller.country.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.postCodeText.tr,
                          controller: controller.postCode.value,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LanguageConstants.socialLinksText.tr,
                    style: AppStyle.textStyleUtils400_16(color: appColorPrimary)
                        .copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: appColor,
                      decorationThickness: 1.5,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.facebookText.tr,
                          controller: controller.faceBook.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.instagramText.tr,
                          controller: controller.instagram.value,
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
                        child: textFormField(
                          hintText: LanguageConstants.youtubeText.tr,
                          controller: controller.twitter.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.youtubeText.tr,
                          controller: controller.youtube.value,
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
                        child: textFormField(
                          hintText: LanguageConstants.linkendinText.tr,
                          controller: controller.linkedin.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.pinterestText.tr,
                          controller: controller.pinterest.value,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LanguageConstants.followersText.tr,
                    style: AppStyle.textStyleUtils400_16(color: appColorPrimary)
                        .copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: appColor,
                      decorationThickness: 1.5,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.facebookText.tr,
                          controller: controller.faceBookFollower.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.instagramText.tr,
                          controller: controller.instagramFollower.value,
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
                        child: textFormField(
                          hintText:
                              "${LanguageConstants.youtubeText.tr}",
                          controller: controller.twitterFollower.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.youtubeText.tr,
                          controller: controller.youtubeFollower.value,
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
                        child: textFormField(
                          hintText: LanguageConstants.linkendinText.tr,
                          controller: controller.linkedinFollower.value,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: textFormField(
                          hintText: LanguageConstants.pinterestText.tr,
                          controller: controller.pinterestFollower.value,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFormField(
                    bottomPadding: 50.0,
                    topPadding: 10.0,
                    height: 79.0,
                    hintText: LanguageConstants.workedOnText.tr,
                    controller: controller.projectWork.value,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    child: CommonThemeButton(
                      onTap: () {
                        controller.isSubmitButtonPressed = true;
                        controller.update(["influencer"]);
                        controller.influencerReg(context);
                      },
                    title:
                        LanguageConstants.submitText.tr,
                       
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
