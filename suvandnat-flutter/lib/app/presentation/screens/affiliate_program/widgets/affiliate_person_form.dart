import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/affiliate_program/affiliate_program_controller.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_phone_field.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class AffiliatePersonForm extends GetView<AffiliateProgramController> {
  const AffiliatePersonForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AffiliateProgramController>(
      id: "Affi",
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 24.0),
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: controller.formKey.value,
            child: Column(
              children: [
                Column(
                  children: [
                    HeadlineBodyOneBaseWidget(
                      title: LanguageConstants.profile.tr,
                      titleColor: Colors.black,
                      titleTextAlign: TextAlign.center,
                      underline: true,
                      fontSize: 16.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderGrey, width: 2)),
                      child: Row(
                        children: [
                          Container(
                            height: 40.h,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  onChanged: (String? value) {
                                    controller.selectedValue.value =
                                        value.toString();
                                  },
                                  icon: Image.asset(AppAsset.downArrowPng,
                                      height: 16, width: 16.0),
                                  itemHeight: 54,
                                  value: controller.selectedValue.value,
                                  items: <String>[
                                    LanguageConstants.mr.tr,
                                    LanguageConstants.mrs.tr
                                  ]
                                      .map(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                          child: HeadlineBodyOneBaseWidget(
                                            title: value,
                                            fontFamily:
                                                AppConstants.fontPoppins,
                                            titleColor: Colors.grey,
                                            fontSize: 14,
                                          ),
                                          value: value,
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
                                controller:
                                    controller.firstNameController.value,
                                focusNode: controller.focusNode.value,
                                decoration: InputDecoration(
                                    hintText: controller.isValidation &&
                                            controller.firstNameController.value
                                                    .text ==
                                                ""
                                        ? LanguageConstants.enterFirstName.tr
                                        : LanguageConstants.firstNameText.tr,
                                    hintStyle: AppTextStyle.textStyleUtils400(
                                        color: Colors.grey),
                                    border: InputBorder.none),
                                validator: (value) {
                                  return null;
                                },
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
                        hintStyle:
                            AppTextStyle.textStyleUtils400(color: Colors.grey),
                        hintText: controller.isValidation &&
                                controller.lastNameController.value.text == ""
                            ? LanguageConstants.enterLastName.tr
                            : LanguageConstants.lastNameText.tr,
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
                              textStyle: AppTextStyle.textStyleUtils400(),
                              controller: controller.emailController.value,
                              focusNode: controller.emailFocusNode.value,
                              keyboardType: TextInputType.emailAddress,
                              hintStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey),
                              hintText: controller.isValidation &&
                                      controller
                                              .firstNameController.value.text ==
                                          ""
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
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40.h,
                            child: CommonTextPhoneField(
                              textController:
                                  controller.contactNoController.value,
                              cursorColor: Colors.black,
                              dropdownIconColor: borderGrey,
                              borderColor: blackColor,
                              focusedColor: borderGrey,
                              fillColor: whiteColor,
                              filled: true,
                              country:
                                  Get.find<CountryController>().country.value,
                              dropdownTextStyle:
                                  AppTextStyle.textStyleUtils400_12(),
                              fontStyle: AppTextStyle.textStyleUtils400_12(),
                              hintStyle: AppTextStyle.textStyleUtils300_12(
                                  color: Colors.grey),
                              hintText: controller.isValidation &&
                                      controller
                                              .contactNoController.value.text ==
                                          ""
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
                          child: SizedBox(
                            height: 40.h,
                            child: TextFormFieldWidget(
                              controller: controller.websiteController.value,
                              focusNode: controller.websiteNoFocusNode.value,
                              hintText: controller.isValidation &&
                                      controller.websiteController.value.text ==
                                          ""
                                  ? LanguageConstants.enterWebsiteUrl.tr
                                  : LanguageConstants.websiteUrlText.tr,
                              hintStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey),
                              validator: (value) {
                                return Validators.validateName(
                                    value, LanguageConstants.websiteUrlText.tr);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Column(
                  children: [
                    HeadlineBodyOneBaseWidget(
                      title: LanguageConstants.addressText.tr,
                      titleColor: Colors.black,
                      titleTextAlign: TextAlign.center,
                      underline: true,
                      fontSize: 16.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Obx(() => Expanded(
                              child: Container(
                                height: 40.h,
                                decoration: ShapeDecoration(
                                    color: whiteColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(
                                            color: borderGrey, width: 0))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      dropdownColor: backGroundColor,
                                      onChanged: (String? value) {
                                        controller.selectedVisitorValue.value =
                                            value.toString();
                                      },
                                      icon: Image.asset(AppAsset.downArrowPng,
                                          height: 16, width: 16.0),
                                      value:
                                          controller.selectedVisitorValue.value,
                                      items: <String>[
                                        LanguageConstants
                                            .visitorMonthHintText.tr,
                                        LanguageConstants.lessThen500Text.tr,
                                        LanguageConstants
                                            .fiveHundredToThousandText.tr,
                                        LanguageConstants.over500Text.tr
                                      ]
                                          .map(
                                            (String value) =>
                                                DropdownMenuItem<String>(
                                              child: HeadlineBodyOneBaseWidget(
                                                title: value,
                                                fontSize: 14,
                                                fontFamily:
                                                    AppConstants.fontPoppins,
                                                titleColor: Colors.grey,
                                              ),
                                              value: value,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Obx(() => Expanded(
                              child: Container(
                                height: 40.h,
                                decoration: ShapeDecoration(
                                    color: whiteColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(
                                            color: borderGrey, width: 2))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      dropdownColor: backGroundColor,
                                      onChanged: (String? value) {
                                        controller.selectedViewsValue.value =
                                            value.toString();
                                      },
                                      icon: Image.asset(AppAsset.downArrowPng,
                                          height: 16, width: 16.0),
                                      value:
                                          controller.selectedViewsValue.value,
                                      items: <String>[
                                        LanguageConstants.viewsMonthHintText.tr,
                                        LanguageConstants.lessThen500Text.tr,
                                        LanguageConstants
                                            .fiveHundredToThousandText.tr,
                                        LanguageConstants.over500Text.tr
                                      ]
                                          .map(
                                            (String value) =>
                                                DropdownMenuItem<String>(
                                              child: HeadlineBodyOneBaseWidget(
                                                title: value,
                                                fontSize: 14,
                                                fontFamily:
                                                    AppConstants.fontPoppins,
                                                titleColor: Colors.grey,
                                              ),
                                              value: value,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
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
                              controller: controller.addressOneController.value,
                              focusNode: controller.addressOneFocusNode.value,
                              keyboardType: TextInputType.streetAddress,
                              hintText: controller.isValidation &&
                                      controller.addressOneController.value
                                              .text ==
                                          ""
                                  ? LanguageConstants.enterAddress1.tr
                                  : LanguageConstants.addressOneText.tr,
                              hintStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey),
                              validator: (value) {
                                return Validators.validateName(
                                    value, LanguageConstants.addressOneText.tr);
                              },
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
                              controller: controller.addressTwoController.value,
                              focusNode: controller.addressTwoFocusNode.value,
                              keyboardType: TextInputType.streetAddress,
                              hintText: controller.isValidation &&
                                      controller.addressTwoController.value
                                              .text ==
                                          ""
                                  ? LanguageConstants.enterAddress2.tr
                                  : LanguageConstants.addressTwoText.tr,
                              hintStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey),
                              validator: (value) {
                                return null;
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
                          child: Container(
                            height: 40.h,
                            decoration: ShapeDecoration(
                                color: whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: const BorderSide(
                                        color: borderGrey, width: 2))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  onChanged: (String? value) {
                                    controller.cityValue.value =
                                        value.toString();
                                  },
                                  icon: Image.asset(AppAsset.downArrowPng,
                                      height: 16, width: 16.0),
                                  value: controller.cityValue.value,
                                  items: <String>[
                                    LanguageConstants.cityHintText.tr,
                                    LanguageConstants.mr.tr,
                                    LanguageConstants.mrs.tr
                                  ]
                                      .map(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                          child: HeadlineBodyOneBaseWidget(
                                            title: value,
                                            fontSize: 14,
                                            fontFamily:
                                                AppConstants.fontPoppins,
                                            titleColor: Colors.grey,
                                          ),
                                          value: value,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 40.h,
                            decoration: ShapeDecoration(
                                color: whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: const BorderSide(
                                        color: borderGrey, width: 2))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  onChanged: (String? value) {
                                    controller.countryValue.value =
                                        value.toString();
                                  },
                                  icon: Image.asset(AppAsset.downArrowPng,
                                      height: 16, width: 16.0),
                                  style: AppTextStyle.textStyleUtils400(
                                      color: Colors.grey),
                                  value: controller.countryValue.value,
                                  items: <String>[
                                    LanguageConstants.countryHintText.tr,
                                    LanguageConstants.mr.tr,
                                    LanguageConstants.mrs.tr
                                  ]
                                      .map(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                          child: HeadlineBodyOneBaseWidget(
                                            title: value,
                                            fontSize: 14,
                                            fontFamily:
                                                AppConstants.fontPoppins,
                                            titleColor: Colors.grey,
                                          ),
                                          value: value,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
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
                          child: SizedBox(
                            height: 40.h,
                            child: TextFormFieldWidget(
                              controller: controller.postCodeController.value,
                              focusNode: controller.postCodeFocusNode.value,
                              keyboardType: TextInputType.streetAddress,
                              hintText: controller.isValidation &&
                                      controller
                                              .postCodeController.value.text ==
                                          ""
                                  ? LanguageConstants.enterPostCode.tr
                                  : LanguageConstants.postCodeText.tr,
                              hintStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey),
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CommonThemeButton(
                  onTap: () {
                    controller.onTap();
                  },
                  title: LanguageConstants.submitText.tr,
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
