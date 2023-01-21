import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/controller/add_address/add_address_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_opensans.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_phone_field.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/common_widget/screen_loading.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class AddAddressScreen extends GetView<AddAddressController> {
  AddAddressScreen({Key? key}) : super(key: key);

  final AddAddressController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        key: controller.scaffoldKey,
        drawerEnableOpenDragGesture: false,
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(title: LanguageConstants.addAddress.tr),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: Color(0xff973133),
                  ),
                )
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        child: Padding(
                          padding: EdgeInsets.all(24.w),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: controller.firstNameController,
                                decoration: getInputDecoration(
                                    LanguageConstants.name.tr),
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return LanguageConstants.enterFirstName.tr;
                                  }
                                  return null;
                                },
                              ),
                              controller.getFirstName.value == true
                                  ? const SizedBox(
                                      height: 6.0,
                                    )
                                  : Container(),
                              controller.getFirstName.value == true
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            LanguageConstants.enterName.tr,
                                            style: AppTextStyle
                                                .textStyleUtils400_12(
                                                    color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: controller.lastNameController,
                                decoration: getInputDecoration(
                                    LanguageConstants.surNameText.tr),
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return LanguageConstants.enterSurName.tr;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              CommonTextPhoneField(
                                textController:
                                    controller.phoneNumberController,
                                cursorColor: blue,
                                country: controller.country.value,
                                dropdownIconColor: borderGrey,
                                fillColor: whiteColor,
                                filled: true,
                                borderColor:
                                    controller.phoneErrorMsg.value.isEmpty
                                        ? borderGrey
                                        : borderGrey,
                                focusedColor:
                                    controller.phoneErrorMsg.value.isEmpty
                                        ? borderGrey
                                        : borderGrey,
                                dropdownTextStyle:
                                    AppTextStyle.textStyleUtils400_16(),
                                fontStyle: AppTextStyle.textStyleUtils400_16(),
                                hintStyle: AppTextStyle.textStyleUtils400_16(),
                                errorBorderColor: borderGrey,
                                hintText: LanguageConstants.telephoneNoText.tr,
                                initialCountryCode: 'US',
                                onCountryChanged: (country) {
                                  controller.countryCodeNumber =
                                      country.dialCode;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: controller
                                          .phoneErrorMsg.value.isNotEmpty
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: CommonTextOpenSans(
                                            controller.phoneErrorMsg.value,
                                            fontSize: 12,
                                            textAlign: TextAlign.left,
                                            color: Colors.red,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: controller.address1Controller,
                                decoration: getInputDecoration(
                                    LanguageConstants.streetAdd1Text.tr),
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return LanguageConstants
                                        .enterStreetAddress.tr;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: controller.address2Controller,
                                decoration: getInputDecoration(
                                    LanguageConstants.streetAdd2Text.tr),
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return LanguageConstants
                                        .enterStreetAddress.tr;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: controller.address3Controller,
                                decoration: getInputDecoration(
                                    LanguageConstants.streetAdd3Text.tr),
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return LanguageConstants
                                        .enterStreetAddress.tr;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: controller.cityController,
                                decoration: getInputDecoration(
                                    LanguageConstants.city.tr),
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return LanguageConstants.enterCity.tr;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.zipPovinceController,
                                decoration: getInputDecoration(
                                    LanguageConstants.postCodeText.tr),
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return LanguageConstants.enterPostCode.tr;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 15.6,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: borderGrey, width: 1),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<CountryListModel>(
                                    items: controller.getcountryList
                                        .map((value) =>
                                            DropdownMenuItem<CountryListModel>(
                                              child: Text(value.fullNameEnglish
                                                  .toString()),
                                              value: value,
                                            ))
                                        .toList(),
                                    dropdownColor: backGroundColor,
                                    isExpanded: true,
                                    hint: controller.selectedCoutry.value
                                                .fullNameEnglish
                                                .toString() ==
                                            "null"
                                        ? const Text(
                                            "United States",
                                          )
                                        : Text(
                                            controller.selectedCoutry.value
                                                .fullNameEnglish
                                                .toString(),
                                            style: AppTextStyle
                                                .textStyleUtils400(),
                                          ),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 22,
                                      color: Colors.black45,
                                    ),
                                    onChanged: (value) {
                                      controller.selectedCoutry.value = value!;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              controller.selectedCoutry.value.availableRegions
                                          .toString() ==
                                      "null"
                                  ? Container()
                                  : Container(
                                      height: Get.height / 15.6,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: whiteColor,
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
                                                    child: Text(
                                                        value.name.toString()),
                                                    value: value,
                                                  ))
                                              .toList(),
                                          isExpanded: true,
                                          dropdownColor: backGroundColor,
                                          hint: controller
                                                      .selectedState.value.name
                                                      .toString() ==
                                                  "null"
                                              ? Text(
                                                  LanguageConstants
                                                      .regionText.tr,
                                                )
                                              : Text(
                                                  controller
                                                      .selectedState.value.name
                                                      .toString(),
                                                  style: AppTextStyle
                                                      .textStyleUtils400(),
                                                ),
                                          icon: null,
                                          iconEnabledColor: Colors.transparent,
                                          onChanged: (value) {
                                            controller.selectedState.value =
                                                value!;
                                          },
                                        ),
                                      ),
                                    ),
                              const SizedBox(height: 10),
                              const SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 36.w,
                                    child: CommonThemeButton(
                                      onTap: () {
                                        if (controller.seletedPage.value == 0) {
                                          controller.addAddress(
                                              context, controller.formKey);
                                        } else {
                                          controller.updateAddress(
                                              context, controller.formKey);
                                        }
                                      },
                                      title: controller.seletedPage.value == 0
                                          ? LanguageConstants.saveAddressText.tr
                                          : LanguageConstants
                                              .updateAddressText.tr,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),
                    ),
                    controller.isScreenLoading.value
                        ? const ScreenLoading()
                        : const SizedBox.shrink()
                  ],
                ),
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
        filled: true,
        fillColor: whiteColor,
        // contentPadding: const EdgeInsets.only(
        //     bottom: 12, top: 12, left: 10),
        hintText: hint,
        labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
        errorStyle: AppTextStyle.textStyleUtils400(color: Colors.red),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: controller.getFirstName.value == true
                  ? Colors.red
                  : borderGrey,
              width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color:
                controller.getFirstName.value == true ? Colors.red : borderGrey,
            width: 1.0,
          ),
        ),
        isDense: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: controller.getFirstName.value == true
                  ? Colors.red
                  : borderGrey,
            ),
            borderRadius: BorderRadius.circular(12)));
  }
}
