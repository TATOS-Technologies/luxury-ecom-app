import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/controller/affiliate_program/affiliate_program_controller.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/common_text_phone_field.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:veralusso/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class ProfilePartWidget extends GetView<AffiliateProgramController> {
  @override
  final AffiliateProgramController controller = Get.find();
  ProfilePartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
          title: LanguageConstants.profileText.tr,
          titleColor: Colors.black,
          titleTextAlign: TextAlign.center,
          fontSize: 16.0,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: textFieldBoarderColor,width: 2)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    onChanged: (String? value) {
                      controller.selectedValue.value = value.toString();
                    },
                    itemHeight: 49,
                    icon: Image.asset(AppAsset.downArrow,
                        height: 16, width: 16.0),
                    value: controller.selectedValue.value,
                    items: <String>[LanguageConstants.mr.tr,
                      LanguageConstants.mrs.tr]
                        .map(
                          (String value) => DropdownMenuItem<String>(
                            child: HeadlineBodyOneBaseWidget(
                              title: value,
                              fontSize: 13,
                            ),
                            value: value,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 45.h,
                  child: TextFormField(
                    controller: controller.firstNameController.value,
                    focusNode: controller.focusNode.value,
                   decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                     hintText: controller.isValid &&
                            controller.firstNameController.value.text == ""
                        ? LanguageConstants.enterFirstName.tr
                        : LanguageConstants.firstNameText.tr,
                    hintStyle: AppTextStyle.textStyleUtils400(),
                   ),
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 45.h,
          child: TextFormFieldWidget(
            controller: controller.lastNameController.value,
            focusNode: controller.lastNameFocusNode.value,
            hintText: controller.isValid &&
                    controller.lastNameController.value.text == ""
                ? LanguageConstants.enterLastName.tr
                : LanguageConstants.lastNameText.tr,
            hintStyle: AppTextStyle.textStyleUtils400(),
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
                height: 45.h,
                child: TextFormFieldWidget(
                  controller: controller.emailController.value,
                  focusNode: controller.emailFocusNode.value,
                  hintStyle: AppTextStyle.textStyleUtils400(),
                  keyboardType: TextInputType.emailAddress,
                  hintText: controller.isValid &&
                          controller.emailController.value.text == ""
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
                height: 45.w,
                child: CommonTextPhoneField(
                  textColor: darkGrey,
                  cursorColor: regularGrey,
                  dropdownIconColor: darkGrey,
                  country:
                      Get.find<CountryController>().country?.value.toString(),
                  borderColor: darkGrey,
                  focusedColor: blue,
                  errorBorderColor: red,
                  dropdownTextStyle:
                  AppTextStyle.textStyleUtils400(color: darkGrey),
                  fontStyle: AppTextStyle.textStyleUtils400(color: darkGrey),
                  hintStyle: AppTextStyle.textStyleUtils400(color: regularGrey),
                  hintText: controller.isValid &&
                          controller.contactNoController.value.text == ""
                      ? LanguageConstants.enterPhoneNumber.tr
                      : LanguageConstants.contactNoText.tr,
                  hintColor: appColor,
                  onCountryChanged: (country) {
                    controller.countryCode = country.dialCode;
                  },
                ),
              ),
              /*TextFormFieldWidget(
                controller: controller.contactNoController.value,
                focusNode: controller.contactNoFocusNode.value,
                keyboardType: TextInputType.number,
                hintText: LanguageConstants.contactNoText.tr,
                validator: (value) {
                  return Validators.validateMobile(value!);
                },
              ),*/
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
                height: 45.h,
                child: TextFormFieldWidget(
                  controller: controller.websiteController.value,
                  focusNode: controller.websiteNoFocusNode.value,
                  hintText: controller.isValid &&
                          controller.websiteController.value.text == ""
                      ? LanguageConstants.enterWebsiteUrl.tr
                      : LanguageConstants.websiteUrlText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(),
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
