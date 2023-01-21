import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../../../controller/country/country_controller.dart';
import '../../../../core/const/app_constants.dart';
import '../../../common_widget/common_text_phone_field.dart';

class CheckoutGuestShippingAddressForm
    extends GetView<CheckoutOrderController> {
  const CheckoutGuestShippingAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14.0),
        Container(
          height: 40,
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: TextFormField(
            controller: controller.emailController,
            style: AppTextStyle.textStyleUtils400().copyWith(decoration: TextDecoration.none, decorationThickness: 0),
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              fillColor: Colors.transparent,
              contentPadding: const EdgeInsets.only(
                bottom: 0,
                top: 10,
                left: 10,
              ),
              hintText: controller.validatorList[0]
                  ? LanguageConstants.emailIsRequired.tr
                  : LanguageConstants.emailAddress.tr,
              hintStyle: const TextStyle(
                fontFamily: AppConstants.fontPoppins,
                color: Colors.grey,
                fontSize: 14,
              ),
              errorStyle: const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black, fontSize: 10),
              isDense: true,
              suffixIcon: null,
            ),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorList[0] = true;
              controller.email.value = val;
              controller.setOnAddressChangeDeBouncer();
            },
          ),
        ),
        const SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  controller: controller.firstNameController,
                  style: const TextStyle(decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(
                      bottom: 0,
                      top: 10,
                      left: 10,
                    ),
                    hintText: controller.validatorList[1]
                        ? LanguageConstants.enterFirstName.tr
                        : LanguageConstants.firstNameText.tr,
                    hintStyle: const TextStyle(
                      fontFamily: AppConstants.fontPoppins,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    errorStyle:
                    const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black, fontSize: 10),
                    isDense: true,
                    suffixIcon: null,
                  ),
                  onChanged: (val) {
                    controller.validatorList[1] = true;
                    controller.firstName.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  controller: controller.lastNameController,
                  style: const TextStyle(decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(
                      bottom: 0,
                      top: 10,
                      left: 10,
                    ),
                    hintText: controller.validatorList[2]
                        ? LanguageConstants.enterLastName.tr
                        : LanguageConstants.lastName.tr,
                    hintStyle: const TextStyle(
                      fontFamily: AppConstants.fontPoppins,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    errorStyle:
                    const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black, fontSize: 10),
                    isDense: true,
                    suffixIcon: null,
                  ),
                  onChanged: (val) {
                    controller.validatorList[2] = true;
                    controller.lastName.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: TextFormField(
            controller: controller.address1Controller,
            style: const TextStyle(decoration: TextDecoration.none, decorationThickness: 0),
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              fillColor: Colors.transparent,
              contentPadding: const EdgeInsets.only(
                bottom: 0,
                top: 10,
                left: 10,
              ),
              hintText: controller.validatorList[3]
                  ? LanguageConstants.enterStreetAddress1.tr
                  : LanguageConstants.streetAddress1.tr,
              hintStyle: const TextStyle(
                fontFamily: AppConstants.fontPoppins,
                color: Colors.grey,
                fontSize: 14,
              ),
              errorStyle: const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black, fontSize: 10),
              isDense: true,
              suffixIcon: null,
            ),
            onChanged: (val) {
              controller.validatorList[3] = true;
              controller.add1.value = val;
              controller.setOnAddressChangeDeBouncer();
            },
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 6.0),
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: TextFormField(
            controller: controller.address2Controller,
            style: const TextStyle(decoration: TextDecoration.none, decorationThickness: 0),
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              fillColor: Colors.transparent,
              contentPadding: const EdgeInsets.only(
                bottom: 0,
                top: 10,
                left: 10,
              ),
              hintText: controller.validatorList[5]
                  ? LanguageConstants.enterStreetAdress2.tr
                  : LanguageConstants.streetAddress2.tr,
              hintStyle: const TextStyle(
                fontFamily: AppConstants.fontPoppins,
                color: Colors.grey,
                fontSize: 14,
              ),
              errorStyle: const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black, fontSize: 10),
              isDense: true,
              suffixIcon: null,
            ),
            onChanged: (val) {
              controller.validatorList[5] = true;
              controller.add2.value = val;
              controller.setOnAddressChangeDeBouncer();
            },
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: TextFormField(
            controller: controller.address3Controller,
            style: const TextStyle(decoration: TextDecoration.none, decorationThickness: 0),
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              fillColor: Colors.transparent,
              contentPadding: const EdgeInsets.only(
                bottom: 0,
                top: 10,
                left: 10,
              ),
              hintText: controller.validatorList[6]
                  ? LanguageConstants.enterStreetAddress3.tr
                  : LanguageConstants.streetAddress3.tr,
              hintStyle: const TextStyle(
                fontFamily: AppConstants.fontPoppins,
                color: Colors.grey,
                fontSize: 14,
              ),
              errorStyle: const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black, fontSize: 10),
              isDense: true,
              suffixIcon: null,
            ),
            onChanged: (val) {
              controller.validatorList[6] = true;
              controller.add3.value = val;
              controller.setOnAddressChangeDeBouncer();
            },
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  controller: controller.cityController,
                  style: const TextStyle(decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(
                      bottom: 0,
                      top: 10,
                      left: 10,
                    ),
                    hintText:
                    controller.validatorList[4] ? LanguageConstants.enterCityName.tr : LanguageConstants.city.tr,
                    hintStyle: const TextStyle(
                      fontFamily: AppConstants.fontPoppins,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    errorStyle:
                    const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black, fontSize: 10),
                    isDense: true,
                    suffixIcon: null,
                  ),
                  onChanged: (val) {
                    controller.validatorList[4] = true;
                    controller.city.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: Container(
                height: 40.0,
                padding: const EdgeInsets.only(left: 8.0, right: 6.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<CountryListModel>(
                    dropdownColor: backGroundColor,
                    items: controller.getcountryList
                        .map((value) => DropdownMenuItem<CountryListModel>(
                      value: value,
                      child: Text(value.fullNameEnglish.toString()),
                    ))
                        .toList(),
                    isExpanded: true,
                    hint: controller.selectedCoutry1.value.fullNameEnglish == null
                        ? Text(
                      LanguageConstants.country.tr,
                      style: const TextStyle(
                        fontFamily: AppConstants.fontPoppins,
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    )
                        : Text(
                      controller.selectedCoutry1.value.fullNameEnglish.toString(),
                      style: const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 28,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      controller.selectedCoutry1.value = value!;
                      controller.selectedState1.value = AvailableRegion();
                      controller.selectedStateList1.value = controller.selectedCoutry1.value.availableRegions ?? [];
                      controller.countryName.value = value.fullNameEnglish!;
                      controller.setOnAddressChangeDeBouncer();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  controller: controller.zipPovinceController,
                  style: const TextStyle(decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(
                      bottom: 0,
                      top: 10,
                      left: 10,
                    ),
                    hintText: controller.validatorList[8]
                        ? LanguageConstants.enterZipPostalCode.tr
                        : LanguageConstants.zipPostalCode.tr,
                    hintStyle: const TextStyle(
                      fontFamily: AppConstants.fontPoppins,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    errorStyle:
                    const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black, fontSize: 10),
                    isDense: true,
                    suffixIcon: null,
                  ),
                  onChanged: (val) {
                    controller.validatorList[8] = true;
                    controller.zipCode.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: controller.selectedStateList1.isNotEmpty
                  ? Container(
                height: 40.0,
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 6.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<AvailableRegion>(
                    dropdownColor: backGroundColor,
                    items: controller.selectedStateList1
                        .map(
                          (value) => DropdownMenuItem<AvailableRegion>(
                        value: value,
                        child: Text(
                          value.name ?? '',
                        ),
                      ),
                    )
                        .toList(),
                    isExpanded: true,
                    hint: controller.selectedState1.value.name == null
                        ? Text(
                      LanguageConstants.stateOrProvince.tr,
                      style: const TextStyle(
                        fontFamily: AppConstants.fontPoppins,
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    )
                        : Text(
                      controller.selectedState1.value.name ?? '',
                      style: const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 28,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      controller.selectedState1.value = value!;
                      controller.state.value = controller.selectedState1.value.name ?? '';
                      controller.setOnAddressChangeDeBouncer();
                    },
                  ),
                ),
              )
                  : Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  controller: controller.stateController,
                  style: const TextStyle(decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(
                      bottom: 0,
                      top: 10,
                      left: 10,
                    ),
                    hintText: controller.validatorList[7]
                        ? LanguageConstants.enterStateProvince.tr
                        : LanguageConstants.stateOrProvince.tr,
                    hintStyle: const TextStyle(
                      fontFamily: AppConstants.fontPoppins,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    errorStyle:
                    const TextStyle(fontFamily: AppConstants.fontPoppins, color: Colors.black, fontSize: 10),
                    isDense: true,
                    suffixIcon: null,
                  ),
                  onChanged: (val) {
                    controller.validatorList[7] = true;

                    controller.state.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        SizedBox(
          height: 40,
          child: CommonTextPhoneField(
            textController: controller.phoneNumberController,
            cursorColor: Colors.black,
            dropdownIconColor: Colors.black,
            country: Get.find<CountryController>().country.value.toString(),
            borderColor: Colors.black,
            focusedColor: Colors.black,
            dropdownTextStyle: AppTextStyle.textStyleUtils400_16(),
            fontStyle: const TextStyle(decoration: TextDecoration.none, decorationThickness: 0),
            hintStyle: const TextStyle(
              fontFamily: AppConstants.fontPoppins,
              color: Colors.grey,
              fontSize: 14,
            ),
            errorBorderColor: Colors.red,
            hintText: controller.validatorList[9]
                ? LanguageConstants.enterPhoneNumber.tr
                : LanguageConstants.phoneNumberText.tr,
            onCountryChanged: (country) {
              controller.countryCode = country.dialCode;
            },
            onChanged: (value) {
              controller.validatorList[9] = true;
              if (value.isValidNumber()) {
                controller.phone.value = value.number;
                controller.setOnAddressChangeDeBouncer();
              }
            },
            validator: (value) {
              if (value == null) {
                return null;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
