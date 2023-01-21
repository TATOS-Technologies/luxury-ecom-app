import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class GuestBillingAddressForm extends GetView<CheckoutOrderController> {
  const GuestBillingAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14.0),
        Container(
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextFormField(
            controller: controller.billingEmailController,
            style: AppStyle.textStyleUtils400().copyWith(
                decoration: TextDecoration.none, decorationThickness: 0),
            decoration: getInputDecoration(
              controller.validatorListBilling[0]
                  ? LanguageConstants.emailAddressRequired.tr
                  : LanguageConstants.emailAddress.tr,
            ),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorListBilling[0] = true;
              controller.emailBilling.value = val;
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
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: controller.billingFirstNameController,
                  style: AppStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: getInputDecoration(
                    controller.validatorListBilling[1]
                        ? LanguageConstants.enterFirstName.tr
                        : LanguageConstants.firstNameText.tr,
                  ),
                  onChanged: (val) {
                    controller.validatorListBilling[1] = true;
                    controller.firstNameBilling.value = val;
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
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: controller.billingLastNameController,
                  style: AppStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: getInputDecoration(
                      controller.validatorListBilling[2]
                          ? LanguageConstants.enterLastName.tr
                          : LanguageConstants.lastNameText.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorListBilling[2] = true;
                    controller.lastNameBilling.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        Container(
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextFormField(
            controller: controller.billingAddress1Controller,
            style: AppStyle.textStyleUtils400().copyWith(
                decoration: TextDecoration.none, decorationThickness: 0),
            decoration: getInputDecoration(
              controller.validatorListBilling[3]
                  ? LanguageConstants.enterStreetAddress1.tr
                  : LanguageConstants.addressOneText.tr,
            ),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorListBilling[3] = true;
              controller.add1Billing.value = val;
              controller.setOnAddressChangeDeBouncer();
            },
          ),
        ),
        const SizedBox(height: 6.0),
        Container(
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextFormField(
            controller: controller.billingAddress2Controller,
            style: AppStyle.textStyleUtils400().copyWith(
                decoration: TextDecoration.none, decorationThickness: 0),
            decoration: getInputDecoration(controller.validatorListBilling[5]
                ? LanguageConstants.enterStreetAdress2.tr
                : LanguageConstants.addressTwoText.tr),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorListBilling[5] = true;
              controller.add2Billing.value = val;
              controller.setOnAddressChangeDeBouncer();
            },
          ),
        ),
        const SizedBox(height: 6.0),
        Container(
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextFormField(
            controller: controller.billingAddress3Controller,
            style: AppStyle.textStyleUtils400().copyWith(
                decoration: TextDecoration.none, decorationThickness: 0),
            decoration: getInputDecoration(
              controller.validatorListBilling[6]
                  ? LanguageConstants.enterStreetAddress3.tr
                  : LanguageConstants.streetAddress3.tr,
            ),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorListBilling[6] = true;
              controller.add3Billing.value = val;
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
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: controller.billingCityController,
                  style: AppStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: getInputDecoration(
                    controller.validatorListBilling[4]
                        ? LanguageConstants.enterCityName.tr
                        : LanguageConstants.cityText.tr,
                  ),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorListBilling[4] = true;
                    controller.cityBilling.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                ),
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
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<CountryListModel>(
                    dropdownColor: whiteColor,
                    items: controller.getcountryList
                        .map(
                          (value) => DropdownMenuItem<CountryListModel>(
                            value: value,
                            child: Text(value.fullNameEnglish.toString()),
                          ),
                        )
                        .toList(),
                    isExpanded: true,
                    hint:
                        controller.selectedCoutry2.value.fullNameEnglish == null
                            ? Text(LanguageConstants.countryText.tr,
                                style: AppStyle.textStyleUtils400())
                            : Text(
                                controller.selectedCoutry2.value.fullNameEnglish
                                    .toString(),
                                style: AppStyle.textStyleUtils400()),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 28,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      controller.selectedCoutry2.value = value!;
                      controller.selectedState2.value = AvailableRegion();
                      controller.selectedStateList2.value =
                          controller.selectedCoutry2.value.availableRegions ??
                              [];
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
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: controller.billingZipPovinceController,
                  style: AppStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  keyboardType: TextInputType.number,
                  decoration: getInputDecoration(
                      controller.validatorListBilling[8]
                          ? LanguageConstants.enterZipPostalCode.tr
                          : LanguageConstants.zipPostalText.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorListBilling[8] = true;
                    controller.zipCodeBilling.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                ),
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
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<AvailableRegion>(
                          dropdownColor: whiteColor,
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
                              ? Text(LanguageConstants.stateText.tr,
                                  style: AppStyle.textStyleUtils400())
                              : Text(controller.selectedState2.value.name ?? '',
                                  style: AppStyle.textStyleUtils400()),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 28,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            controller.selectedState2.value = value!;
                            controller.state.value =
                                controller.selectedState2.value.name ?? '';
                            controller.setOnAddressChangeDeBouncer();
                          },
                        ),
                      ),
                    )
                  : Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        controller: controller.billingStateController,
                        style: AppStyle.textStyleUtils400().copyWith(
                            decoration: TextDecoration.none,
                            decorationThickness: 0),
                        decoration: getInputDecoration(
                            controller.validatorListBilling[7]
                                ? LanguageConstants.enterStateProvince.tr
                                : LanguageConstants.stateText.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return null;
                          }
                          return null;
                        },
                        onChanged: (val) {
                          controller.validatorListBilling[7] = true;
                          controller.stateBilling.value = val;
                          controller.setOnAddressChangeDeBouncer();
                        },
                      ),
                    ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextFormField(
            controller: controller.billingPhoneNumberController,
            style: AppStyle.textStyleUtils400().copyWith(
                decoration: TextDecoration.none, decorationThickness: 0),
            keyboardType: TextInputType.number,
            decoration: getInputDecoration(
              controller.validatorListBilling[9]
                  ? LanguageConstants.enterPhoneNumber.tr
                  : LanguageConstants.phoneNumberText.tr,
            ),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorListBilling[9] = true;

              controller.phoneBilling.value = val;
              if (val.length == 10) {
                controller.setOnAddressChangeDeBouncer();
              }
            },
          ),
        ),
      ],
    );
  }

  InputDecoration getInputDecoration(String message) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.only(
        bottom: 0,
        top: 10,
        left: 10,
      ),
      hintText: message,
      hintStyle: AppStyle.textStyleUtils400(color: Colors.grey),
      errorStyle: AppStyle.textStyleUtils400(),
      isDense: true,
      suffixIcon: null,
      border: InputBorder.none,
    );
  }
}
