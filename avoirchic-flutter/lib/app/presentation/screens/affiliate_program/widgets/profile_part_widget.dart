import 'package:avoirchic/app/controller/affiliate_program_controller.dart';
import 'package:avoirchic/app/controller/country_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_text_phone_field.dart';
import 'package:avoirchic/app/presentation/common_widgets/headline_body_one_base_widget.dart';
import 'package:avoirchic/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePartWidget extends GetView<AffiliateProgramController> {
  @override
  final AffiliateProgramController controller = Get.find();

  ProfilePartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
          title: LanguageConstants.profile.tr,
          titleColor: titleColor,
          titleTextAlign: TextAlign.center,
          underline: true,
          fontSize: 16.0,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: borderGrey),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Container(
                height: 40.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (String? value) {
                        controller.selectedValue.value = value.toString();
                      },
                      icon: Image.asset(
                        AppAsset.downArrow,
                        height: 16,
                        width: 16.0,
                      ),
                      itemHeight: 48,
                      value: controller.selectedValue.value,
                      items: <String>[
                        LanguageConstants.mr.tr,
                        LanguageConstants.mrs.tr
                      ]
                          .map(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: HeadlineBodyOneBaseWidget(
                                title: value,
                                fontSize: 14,
                                titleColor: grey636363,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 40.h,
                  child: TextFormField(
                    controller: controller.firstNameController.value,
                    focusNode: controller.focusNode.value,
                    cursorColor: blackColor,
                    decoration: InputDecoration(
                        hintText:
                            controller.firstNameController.value.text == "" &&
                                    controller.isValidation
                                ? LanguageConstants.enterFirstName.tr
                                : LanguageConstants.firstNameText.tr,
                        hintStyle:
                            AppTextStyle.textStyleUtils400(color: grey636363),
                        border: InputBorder.none),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 40.h,
          child: TextFormFieldWidget(
            controller: controller.lastNameController.value,
            focusNode: controller.lastNameFocusNode.value,
            hintText: controller.lastNameController.value.text == "" &&
                    controller.isValidation
                ? LanguageConstants.enterLastName.tr
                : LanguageConstants.lastNameText.tr,
            hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
            validator: (value) {
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: TextFormFieldWidget(
                  controller: controller.emailController.value,
                  focusNode: controller.emailFocusNode.value,
                  keyboardType: TextInputType.emailAddress,
                  hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                  hintText: controller.emailController.value.text == "" &&
                          controller.isValidation
                      ? LanguageConstants.enterEmailAddress.tr
                      : LanguageConstants.emailText.tr,
                  validator: (value) {
                    return null;
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
                child: CommonTextPhoneField(
                  textController: controller.contactNoController.value,
                  cursorColor: avoirChickTheme,
                  dropdownIconColor: blackColor,
                  borderColor: borderGrey,
                  focusedColor: borderGrey,
                  errorBorderColor: avoirChickTheme,
                  country: Get.find<CountryController>().country?.value,
                  dropdownTextStyle:
                      AppTextStyle.textStyleUtils400(color: grey636363),
                  fontStyle:
                      AppTextStyle.textStyleUtils400(color: Colors.black),
                  hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                  hintText: controller.contactNoController.value.text == "" &&
                          controller.isValidation
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
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 40.h,
                child: TextFormFieldWidget(
                  controller: controller.websiteController.value,
                  focusNode: controller.websiteNoFocusNode.value,
                  hintText: controller.websiteController.value.text == "" &&
                          controller.isValidation
                      ? LanguageConstants.enterWebsiteUrl.tr
                      : LanguageConstants.websiteUrlText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
