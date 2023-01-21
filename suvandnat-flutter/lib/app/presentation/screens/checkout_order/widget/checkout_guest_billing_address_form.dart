import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../../../controller/checkout_order/checkout_order_controller.dart';

class CheckoutGuestBillingAddressForm extends GetView<CheckoutOrderController> {
  const CheckoutGuestBillingAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14.0),
        TextFormField(
          controller: controller.billingEmailController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.only(
              bottom: 10,
              top: 12,
              left: 10,
            ),
            hintText: LanguageConstants.emailAddress.tr,
            hintStyle: const TextStyle(
              fontFamily: AppConstants.fontPoppins,
              color: Colors.grey,
              fontSize: 14,
            ),
            errorStyle: const TextStyle(
              color: Colors.black,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                5.0,
              ),
              borderSide: const BorderSide(
                color: brownColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                5.0,
              ),
              borderSide: const BorderSide(
                color: brownColor,
                width: 1.0,
              ),
            ),
            isDense: true,
            suffixIcon: null,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: brownColor,
              ),
              borderRadius: BorderRadius.circular(
                5.0,
              ),
            ),
          ),
          validator: Validators.validateEmail,
          onChanged: (val) {
            controller.emailBilling.value = val;
            controller.setOnAddressChangeDeBouncer();
          },
        ),
        const SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.billingFirstNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.only(
                    bottom: 10,
                    top: 12,
                    left: 10,
                  ),
                  hintText: LanguageConstants.firstNameText.tr,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  suffixIcon: null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                ),
                onChanged: (val) {
                  controller.firstNameBilling.value = val;
                  controller.setOnAddressChangeDeBouncer();
                },
                validator: (value) {
                  if (value == null || value == '') {
                    return LanguageConstants.enterFirstName.tr;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: TextFormField(
                controller: controller.billingLastNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.only(
                    bottom: 10,
                    top: 12,
                    left: 10,
                  ),
                  hintText: LanguageConstants.lastName.tr,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  suffixIcon: null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return LanguageConstants.enterLastName.tr;
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.lastNameBilling.value = val;
                  controller.setOnAddressChangeDeBouncer();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.billingAddress1Controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.only(
                    bottom: 10,
                    top: 12,
                    left: 10,
                  ),
                  hintText: LanguageConstants.streetAddress1.tr,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  suffixIcon: null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return LanguageConstants.enterStreetAddress1.tr;
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.add1Billing.value = val;
                  controller.setOnAddressChangeDeBouncer();
                },
              ),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: TextFormField(
                controller: controller.billingCityController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.only(
                    bottom: 10,
                    top: 12,
                    left: 10,
                  ),
                  hintText: LanguageConstants.city.tr,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  suffixIcon: null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return LanguageConstants.enterCity.tr;
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.cityBilling.value = val;
                  controller.setOnAddressChangeDeBouncer();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.billingAddress2Controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.only(
                    bottom: 10,
                    top: 12,
                    left: 10,
                  ),
                  hintText: LanguageConstants.streetAddress2.tr,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  suffixIcon: null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return LanguageConstants.enterStreetAddress.tr;
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.add2Billing.value = val;
                  controller.setOnAddressChangeDeBouncer();
                },
              ),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: Container(
                height: 40.0,
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 6.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: brownColor, width: 1),
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
                    hint:
                        controller.selectedCoutry2.value.fullNameEnglish == null
                            ? Text(
                                LanguageConstants.country.tr,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              )
                            : Text(
                                controller.selectedCoutry2.value.fullNameEnglish
                                    .toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 28,
                      color: brownColor.withOpacity(0.2),
                    ),
                    onChanged: (value) {
                      controller.selectedCoutry2.value = value!;
                      controller.selectedState2.value = AvailableRegion();
                      controller.selectedStateList2.value =
                          controller.selectedCoutry2.value.availableRegions ??
                              [];
                      controller.countryNameBilling.value =
                          value.fullNameEnglish!;
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
              child: TextFormField(
                controller: controller.billingAddress3Controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.only(
                    bottom: 10,
                    top: 12,
                    left: 10,
                  ),
                  hintText: LanguageConstants.streetAddress3.tr,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  suffixIcon: null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return LanguageConstants.enterStreetAddress.tr;
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.add3Billing.value = val;
                  controller.setOnAddressChangeDeBouncer();
                },
              ),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: controller.selectedStateList2.isNotEmpty
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
                          color: brownColor,
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<AvailableRegion>(
                          dropdownColor: Colors.white,
                          items: controller.selectedStateList2
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
                          hint: controller.selectedState2.value.name == null
                              ? Text(
                                  LanguageConstants.stateOrProvince.tr,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                )
                              : Text(
                                  controller.selectedState2.value.name ?? '',
                                  style: const TextStyle(color: Colors.black),
                                ),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 28,
                            color: brownColor.withOpacity(0.2),
                          ),
                          onChanged: (value) {
                            controller.selectedState2.value = value!;
                            controller.stateBilling.value =
                                controller.selectedState2.value.name ?? '';
                            controller.setOnAddressChangeDeBouncer();
                          },
                        ),
                      ),
                    )
                  : TextFormField(
                      controller: controller.billingStateController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(
                          bottom: 10,
                          top: 12,
                          left: 10,
                        ),
                        hintText: LanguageConstants.stateOrProvince.tr,
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                          borderSide: const BorderSide(
                            color: brownColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                          borderSide: const BorderSide(
                            color: brownColor,
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        suffixIcon: null,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: brownColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterStateProvince.tr;
                        }
                        return null;
                      },
                      onChanged: (val) {
                        controller.stateBilling.value = val;
                        controller.setOnAddressChangeDeBouncer();
                      },
                    ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.billingZipPovinceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.only(
                    bottom: 10,
                    top: 12,
                    left: 10,
                  ),
                  hintText: LanguageConstants.zipPostalCode.tr,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  suffixIcon: null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return LanguageConstants.enterZipPostalCode.tr;
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.zipCodeBilling.value = val;
                  controller.setOnAddressChangeDeBouncer();
                },
              ),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: TextFormField(
                controller: controller.billingPhoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.only(
                    bottom: 10,
                    top: 12,
                    left: 10,
                  ),
                  hintText: LanguageConstants.phoneNumberText.tr,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: brownColor,
                      width: 1.0,
                    ),
                  ),
                  isDense: true,
                  suffixIcon: null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: brownColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return LanguageConstants.enterPhoneNumber.tr;
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.phoneBilling.value = val;
                  if (val.length == 10) {
                    controller.setOnAddressChangeDeBouncer();
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
