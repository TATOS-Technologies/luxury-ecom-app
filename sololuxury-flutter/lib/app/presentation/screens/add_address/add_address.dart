import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_text_phone_field.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/common_widget/screen_loading.dart';
import 'package:solo_luxury/app/presentation/screens/add_address/widget/error_text.dart';

class AddAddressScreen extends GetView<AddAddressController> {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: false);
        return false;
      },
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: commonAppbar(
            title: LanguageConstants.addressDetails.tr,
            onTap: () {
              Get.back(result: false);
            }),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: AbsorbPointer(
                    absorbing: true,
                    child: Center(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: const SpinKitThreeBounce(
                          color: appColor,
                        ),
                      ),
                    ),
                  ),
                )
              : Stack(
                  children: [
                    _AddAddressBody(),
                    Obx(() => controller.isScreenLoading.value
                        ? const ScreenLoading()
                        : const SizedBox.shrink())
                  ],
                ),
        ),
      ),
    );
  }
}

class _AddAddressBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<AddAddressController>(
        id: "Address",
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstNameController,
                        cursorColor: appColor,
                        decoration: addressDecoration(
                            hintText: LanguageConstants.firstNameText.tr),
                        validator: (value) => Validators.validateName(
                          value?.trim(),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        child: TextFormField(
                          cursorColor: appColor,
                          controller: controller.lastNameController,
                          decoration: addressDecoration(
                              hintText: LanguageConstants.lastNameText.tr),
                          validator: (value) => Validators.validateName(
                            value?.trim(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        child: CommonTextPhoneField(
                          filled: true,
                          fillColor: appTileColor,
                          textController: controller.phoneNumberController,
                          textColor: appColorButton,
                          cursorColor: appColor,
                          dropdownTextColor: appColorButton,
                          dropdownIconColor: appColorButton,
                          borderColor: Colors.transparent,
                          dropdownTextStyle: const TextStyle(
                            color: blackColor,
                          ),
                          fontStyle: const TextStyle(
                            color: blackColor,
                          ),
                          hintStyle: const TextStyle(color: regularGrey),
                          country: Get.find<CountryController>().country?.value,
                          hintText: controller.isValidation &&
                                  controller.phoneNumberController.text == ""
                              ? LanguageConstants.enterPhoneNumber.tr
                              : LanguageConstants.contactNoText.tr,
                          onCountryChanged: (country) {
                            controller.countryCodeNumber.value =
                                country.dialCode;
                          },
                          validator: (value) => Validators.validateMobile(
                            value?.number ?? '',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: ErrorText(
                            text: controller.phoneErrorMsg.value,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        child: TextFormField(
                          cursorColor: appColor,
                          controller: controller.zipPovinceController,
                          keyboardType: TextInputType.number,
                          decoration: addressDecoration(
                              hintText: LanguageConstants.zipOrProvinceText.tr),
                          validator: (value) => Validators.validateZip(
                              value?.trim() ?? '',
                              LanguageConstants.enterZipOrProvince.tr),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        child: TextFormField(
                          cursorColor: appColor,
                          controller: controller.address1Controller,
                          decoration: addressDecoration(
                              hintText: LanguageConstants.addressOneText.tr,
                              borderRadius: BorderRadius.circular(0.0)),
                          validator: (value) => Validators.validateAddress(
                              value?.trim() ?? '',
                              LanguageConstants.enterAddress1.tr),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        child: TextFormField(
                          cursorColor: appColor,
                          controller: controller.address2Controller,
                          decoration: addressDecoration(
                              hintText: LanguageConstants.addressTwoText.tr),
                          validator: (value) => Validators.validateAddress(
                              value?.trim() ?? '',
                              LanguageConstants.enterAddress2.tr),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        child: TextFormField(
                          cursorColor: appColor,
                          controller: controller.cityController,
                          decoration: addressDecoration(
                              hintText: controller.isValidation &&
                                      controller.cityController.text == ""
                                  ? LanguageConstants.enterCity.tr
                                  : LanguageConstants.cityText.tr,
                              borderRadius: BorderRadius.circular(0.0)),
                          validator: (value) => Validators.validateAddress(
                              value?.trim() ?? '',
                              LanguageConstants.enterCity.tr),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Obx(() => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: appTileColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<CountryListModel>(
                                dropdownColor: backGroundColor,
                                items: controller.getcountryList
                                    .map((value) =>
                                        DropdownMenuItem<CountryListModel>(
                                          value: value,
                                          child: Text(
                                              value.fullNameEnglish.toString()),
                                        ))
                                    .toList(),
                                isExpanded: true,
                                hint: controller.selectedCoutry.value
                                            .fullNameEnglish
                                            .toString() ==
                                        "null"
                                    ? Text(
                                        LanguageConstants.countryText.tr,
                                        style: const TextStyle(
                                            color: Colors.black54),
                                      )
                                    : Text(
                                        controller.selectedCoutry.value
                                            .fullNameEnglish
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 28,
                                  color: Colors.black,
                                ),
                                onChanged: (value) {
                                  debugPrint("value Is $value");
                                  controller.selectedCoutry.value = value!;
                                },
                              ),
                            ),
                          )),
                      SizedBox(height: 16.h),
                      Obx(() => controller
                                  .selectedCoutry.value.availableRegions ==
                              null
                          ? Container()
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              width: double.infinity,
                               decoration: BoxDecoration(
                                color: appTileColor,
                                borderRadius: BorderRadius.circular(12)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<AvailableRegion>(
                                  dropdownColor: backGroundColor,
                                  items: controller
                                      .selectedCoutry.value.availableRegions!
                                      .map((value) =>
                                          DropdownMenuItem<AvailableRegion>(
                                            value: value,
                                            child: Text(value.name.toString()),
                                          ))
                                      .toList(),
                                  isExpanded: true,
                                  hint: controller.selectedState.value.name
                                              .toString() ==
                                          "null"
                                      ? Text(
                                          LanguageConstants.stateText.tr,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                          ),
                                        )
                                      : Text(
                                          controller.selectedState.value.name
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 28,
                                    color: Colors.black,
                                  ),
                                  onChanged: (value) {
                                    controller.selectedState.value = value!;
                                  },
                                ),
                              ),
                            )),
                      SizedBox(height: 16.h),
                      SizedBox(
                        child: CommonThemeButton(
                          onTap: () {
                            controller.isValidation = true;
                            controller.update(["Address"]);
                            if (Get.arguments[2] == 0) {
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
                         title:
                            Get.arguments[2] == 0
                                ? LanguageConstants.saveAddress.tr
                                : LanguageConstants.updateAddress.tr,
                           
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  InputDecoration addressDecoration(
      {required String hintText, BorderRadius? borderRadius}) {
    return InputDecoration(
      filled: true,
      fillColor: appTileColor,
      hintText: hintText,
      labelStyle: const TextStyle(color: Colors.black54),
      errorStyle: const TextStyle(color: Colors.red),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
    );
  }
}
