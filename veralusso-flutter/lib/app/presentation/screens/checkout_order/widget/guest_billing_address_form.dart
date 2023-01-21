import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class GuestBillingAddressForm extends GetView<CheckoutOrderController> {
  @override
  final CheckoutOrderController controller = Get.find();

  GuestBillingAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14.0),
        TextFormField(
          controller: controller.billingEmailController,
          decoration: getInputDecoration(LanguageConstants.emailAddreessText.tr),
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
                decoration: getInputDecoration(LanguageConstants.firstNameText.tr),
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
                decoration: getInputDecoration(LanguageConstants.lastName.tr),
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
                decoration: getInputDecoration(LanguageConstants.streetAddress1.tr),
                validator: (value) {
                  if (value == null || value == '') {
                    return LanguageConstants.enterStreetAddress.tr;
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
                decoration: getInputDecoration(LanguageConstants.cityText.tr),
                validator: (value) {
                  if (value == null || value == '') {
                    return LanguageConstants.enterCityName.tr;
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
                decoration: getInputDecoration(LanguageConstants.enterStreetAdress2.tr),
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
                  border: Border.all(color: blackColor, width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<CountryListModel>(
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
                                style: AppTextStyle.textStyleUtils400(),
                              )
                            : Text(
                                controller.selectedCoutry2.value.fullNameEnglish
                                    .toString(),
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 28,
                      color: blackColor.withOpacity(0.2),
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
                decoration: getInputDecoration( LanguageConstants.enterStreetAddress3.tr),
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
                          color: blackColor,
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
                            LanguageConstants.stateProvince.tr,
                                  style: AppTextStyle.textStyleUtils400(),
                                )
                              : Text(
                                  controller.selectedState2.value.name ?? '',
                                  style: AppTextStyle.textStyleUtils400(),
                                ),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 28,
                            color: blackColor.withOpacity(0.2),
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
                      decoration: getInputDecoration(LanguageConstants.stateProvince.tr),
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
                decoration: getInputDecoration(LanguageConstants.zipCodeText.tr),
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
                decoration: getInputDecoration(LanguageConstants.phoneNumberText.tr),
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

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.only(
        bottom: 10,
        top: 12,
        left: 10,
      ),
      hintText: hint,
      hintStyle: AppTextStyle.textStyleUtils400(),
      errorStyle: AppTextStyle.textStyleUtils400(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        borderSide: const BorderSide(
          color: blackColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        borderSide: const BorderSide(
          color: blackColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        borderSide: const BorderSide(
          color: blackColor,
          width: 1.0,
        ),
      ),
      isDense: true,
      suffixIcon: null,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: blackColor,
        ),
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
    );
  }
}
