import 'package:avoirchic/app/controller/add_address_controller.dart';
import 'package:avoirchic/app/controller/country_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_text_phone_field.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/screen_loading.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/utils/validator.dart';

class AddAddressScreen extends GetView<AddAddressController> {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(controller.isFromAddAddress
            ? LanguageConstants.addAddressText.tr
            : LanguageConstants.updateAddress.tr),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: avoirChickTheme,
                ),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(24.w),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() => Container(
                                height: 35.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: controller.firstNameController,
                                  style: AppTextStyle.textStyleUtils400(),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      hintText:
                                          LanguageConstants.firstNameText.tr,
                                      hintStyle: AppTextStyle.textStyleUtils400(
                                        color: grey636363,
                                      ),
                                      labelStyle:
                                          AppTextStyle.textStyleUtils400(
                                        color: Colors.black54,
                                      ),
                                      isDense: true,
                                      border: InputBorder.none),
                                  validator: (value) =>
                                      Validators.validateName(value),
                                ),
                              )),
                          SizedBox(height: 16.h),
                          Obx(
                            () => Container(
                              height: 35.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: borderGrey)),
                              child: TextFormField(
                                controller: controller.lastNameController,
                                style: AppTextStyle.textStyleUtils400(),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: LanguageConstants.lastNameText.tr,
                                    hintStyle: AppTextStyle.textStyleUtils400(
                                        color: grey636363),
                                    labelStyle: AppTextStyle.textStyleUtils400(
                                        color: Colors.grey),
                                    isDense: true,
                                    border: InputBorder.none),
                                validator: (value) =>
                                    Validators.validateName(value),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Obx(() => SizedBox(
                                height: 35.h,
                                child: CommonTextPhoneField(
                                  textController:
                                      controller.phoneNumberController,
                                  country: Get.find<CountryController>()
                                      .country!
                                      .value,
                                  cursorColor: blue,
                                  dropdownIconColor: Colors.black,
                                  borderColor: borderGrey,
                                  focusedColor: Colors.black26,
                                  dropdownTextStyle:
                                      AppTextStyle.textStyleUtils400(),
                                  fontStyle: AppTextStyle.textStyleUtils400(),
                                  hintStyle: AppTextStyle.textStyleUtils400(
                                      color: grey636363),
                                  errorBorderColor: Colors.red,
                                  hintText:
                                      LanguageConstants.phoneNumberText.tr,
                                  onCountryChanged: (country) {
                                    controller.countryCodenumber =
                                        country.dialCode;
                                  },
                                  validator: (value) =>
                                      Validators.validateMobile(
                                          value?.number ?? ''),
                                ),
                              )),
                          SizedBox(height: 16.h),
                          Obx(() => Container(
                                height: 35.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: controller.address1Controller,
                                  style: AppTextStyle.textStyleUtils400(),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      hintText: LanguageConstants
                                          .streetAddressText.tr,
                                      hintStyle: hintStyle(),
                                      labelStyle: labelStyle(),
                                      isDense: true,
                                      border: InputBorder.none),
                                  validator: (value) =>
                                      Validators.validateAddress(
                                          value?.trim() ?? '',
                                          LanguageConstants.enterAddress1.tr),
                                ),
                              )),
                          SizedBox(height: 16.h),
                          Obx(() => Container(
                                height: 35.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: controller.address2Controller,
                                  style: AppTextStyle.textStyleUtils400(),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      hintText: LanguageConstants
                                          .streetAddressText.tr,
                                      hintStyle: hintStyle(),
                                      labelStyle: labelStyle(),
                                      isDense: true,
                                      border: InputBorder.none),
                                  validator: (value) =>
                                      Validators.validateAddress(
                                          value?.trim() ?? '',
                                          LanguageConstants.enterAddress2.tr),
                                ),
                              )),
                          SizedBox(height: 16.h),
                          Obx(() => Container(
                                height: 35.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: controller.address3Controller,
                                  style: AppTextStyle.textStyleUtils400(),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      hintText: LanguageConstants
                                          .streetAddressText.tr,
                                      hintStyle: hintStyle(),
                                      labelStyle: labelStyle(),
                                      isDense: true,
                                      border: InputBorder.none),
                                  validator: (value) =>
                                      Validators.validateAddress(
                                          value?.trim() ?? '',
                                          LanguageConstants.enterAddress3.tr),
                                ),
                              )),
                          SizedBox(height: 16.h),
                          Obx(() => Container(
                                height: 35.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: controller.cityController,
                                  style: AppTextStyle.textStyleUtils400(),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      hintText: LanguageConstants.cityText.tr,
                                      hintStyle: hintStyle(),
                                      labelStyle: labelStyle(),
                                      isDense: true,
                                      border: InputBorder.none),
                                  validator: (value) =>
                                      Validators.validateAddress(
                                          value?.trim() ?? '',
                                          LanguageConstants.enterCity.tr),
                                ),
                              )),
                          SizedBox(height: 16.h),
                          Obx(() => Container(
                                height: 35.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: controller.zipPovinceController,
                                  style: AppTextStyle.textStyleUtils400(),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      hintText:
                                          LanguageConstants.zipCodeText.tr,
                                      hintStyle: hintStyle(),
                                      labelStyle: labelStyle(),
                                      isDense: true,
                                      border: InputBorder.none),
                                  validator: (value) =>
                                      Validators.validateAddress(
                                          value?.trim() ?? '',
                                          LanguageConstants
                                              .enterZipOrProvince.tr),
                                ),
                              )),
                          SizedBox(height: 16.h),
                          Container(
                            height: 35.h,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: borderGrey, width: 1),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<CountryListModel>(
                                items: controller.getcountryList
                                    .map((value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value.fullNameEnglish.toString(),
                                            style: AppTextStyle
                                                .textStyleUtils400(),
                                          ),
                                        ))
                                    .toList(),
                                isExpanded: true,
                                hint: controller.selectedCoutry.value
                                            .fullNameEnglish
                                            .toString() ==
                                        "null"
                                    ? Text(
                                        LanguageConstants.countryText.tr,
                                        style: hintStyle(),
                                      )
                                    : Text(
                                        controller.selectedCoutry.value
                                            .fullNameEnglish
                                            .toString(),
                                        style: AppTextStyle.textStyleUtils400(),
                                      ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color:
                                      const Color(0xff367587).withOpacity(0.8),
                                ),
                                onChanged: (value) {
                                  controller.selectedCoutry.value = value!;
                                  // });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          controller.selectedCoutry.value.availableRegions
                                      .toString() ==
                                  "null"
                              ? Container()
                              : controller.selectedCoutry.value.availableRegions
                                          .toString() ==
                                      "[]"
                                  ? Container()
                                  : Container(
                                      height: 35.h,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: borderGrey, width: 1),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<AvailableRegion>(
                                          items: controller.selectedCoutry.value
                                              .availableRegions!
                                              .map((value) => DropdownMenuItem<
                                                      AvailableRegion>(
                                                    value: value,
                                                    child: Text(
                                                        value.name.toString()),
                                                  ))
                                              .toList(),
                                          isExpanded: true,
                                          hint: Text(
                                            controller.selectedOrHintText(),
                                            style: AppTextStyle
                                                .textStyleUtils400(),
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: const Color(0xff367587)
                                                .withOpacity(0.8),
                                          ),
                                          onChanged: (value) {
                                            controller.selectedState.value =
                                                value!;
                                          },
                                        ),
                                      ),
                                    ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 35.w,
                            width: 250.w,
                            child: CommonThemeButton(
                                onTap: () async {
                                  controller.isValidation.value = true;
                                  if (controller.isFromAddAddress) {
                                    controller.addAddress(
                                      context,
                                      controller.formKey,
                                    );
                                  } else {
                                    controller.updateAddress(
                                      context,
                                      controller.formKey,
                                    );
                                  }
                                },
                                title: controller.buttonText()),
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                  controller.isScreenLoading.value
                      ? const ScreenLoading()
                      : const SizedBox.shrink()
                ],
              ),
      ),
    );
  }

  TextStyle hintStyle() {
    return AppTextStyle.textStyleUtils400(
      color: grey636363,
    );
  }

  TextStyle labelStyle() {
    return AppTextStyle.textStyleUtils400(
      color: Colors.grey,
    );
  }
}
