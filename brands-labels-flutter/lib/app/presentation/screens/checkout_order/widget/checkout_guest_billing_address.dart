import 'package:brandslabels/app/controller/checkout_order_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/translations/translations.dart';

class CheckoutGuestBillingAddress extends GetView<CheckoutOrderController> {
  const CheckoutGuestBillingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.isSameAsBilling.value = !controller.isSameAsBilling.value;
        controller.checkEnablePlaceOrder();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => Container(
                    height: 24.0,
                    width: 24.0,
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      controller.isSameAsBilling.value
                          ? Icons.check_box_sharp
                          : Icons.check_box_outline_blank_sharp,
                      color: appBarPrimary,
                      size: 24.0,
                    ),
                  )),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: CommonTextOpenSans(
                  LanguageConstants.myBillingShipAddressSameText.tr,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          !controller.isSameAsBilling.value
              ? guestBillingAddressForm()
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget guestBillingAddressForm() {
    return Column(
      children: [
        const SizedBox(height: 14.0),
        Container(
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextFormField(
            controller: controller.billingEmailController,
            style: AppTextStyle.textStyleUtils400().copyWith(
                decoration: TextDecoration.none, decorationThickness: 0),
            cursorColor: Colors.black,
            decoration: getInputDecoration(controller.validatorList1[0]
                ? LanguageConstants.emailAddressRequired.tr
                : LanguageConstants.emailAddress.tr),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorList1[0] = true;
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
                  style: AppTextStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  cursorColor: Colors.black,
                  decoration: getInputDecoration(controller.validatorList1[1]
                      ? LanguageConstants.enterFirstName.tr
                      : LanguageConstants.firstNameText.tr),
                  onChanged: (val) {
                    controller.validatorList1[1] = true;
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
                  style: AppTextStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  cursorColor: Colors.black,
                  decoration: getInputDecoration(controller.validatorList1[2]
                      ? LanguageConstants.enterLastName.tr
                      : LanguageConstants.lastName.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorList1[2] = true;
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
            style: AppTextStyle.textStyleUtils400().copyWith(
                decoration: TextDecoration.none, decorationThickness: 0),
            cursorColor: Colors.black,
            decoration: getInputDecoration(controller.validatorList1[3]
                ? LanguageConstants.enterStreetAddress1.tr
                : LanguageConstants.streetAddress1.tr),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorList1[3] = true;
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
            style: AppTextStyle.textStyleUtils400().copyWith(
                decoration: TextDecoration.none, decorationThickness: 0),
            cursorColor: Colors.black,
            decoration: getInputDecoration(controller.validatorList1[5]
                ? LanguageConstants.enterStreetAdress2.tr
                : LanguageConstants.streetAddress2.tr),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorList1[5] = true;
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
            style: AppTextStyle.textStyleUtils400().copyWith(
                decoration: TextDecoration.none, decorationThickness: 0),
            cursorColor: Colors.black,
            decoration: getInputDecoration(controller.validatorList1[6]
                ? LanguageConstants.enterStreetAddress3.tr
                : LanguageConstants.streetAddress3.tr),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorList1[6] = true;
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
                  style: AppTextStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  cursorColor: Colors.black,
                  decoration: getInputDecoration(controller.validatorList1[4]
                      ? LanguageConstants.enterCityName.tr
                      : LanguageConstants.city.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorList1[4] = true;
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
                        controller.selectedCoutry1.value.fullNameEnglish == null
                            ? Text(
                                LanguageConstants.country.tr,
                                style: AppTextStyle.textStyleUtils400(
                                  color: Colors.grey,
                                ),
                              )
                            : Text(
                                controller.selectedCoutry1.value.fullNameEnglish
                                    .toString(),
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 28,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      controller.selectedCoutry1.value = value!;
                      controller.selectedState1.value = AvailableRegion();
                      controller.selectedStateList1.value =
                          controller.selectedCoutry1.value.availableRegions ??
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
                  controller: controller.zipPovinceController,
                  style: AppTextStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: getInputDecoration(controller.validatorList1[8]
                      ? LanguageConstants.enterZipPostalCode.tr
                      : LanguageConstants.zipPostalCode.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorList1[8] = true;
                    controller.zipCodeBilling.value = val;
                    controller.setOnAddressChangeDeBouncer();
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
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<AvailableRegion>(
                          dropdownColor: whiteColor,
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
                                  LanguageConstants.stateProvince.tr,
                                  style: AppTextStyle.textStyleUtils400(
                                    color: Colors.grey,
                                  ),
                                )
                              : Text(
                                  controller.selectedState1.value.name ?? '',
                                  style: AppTextStyle.textStyleUtils400(),
                                ),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 28,
                            color: appButtonColor.withOpacity(0.2),
                          ),
                          onChanged: (value) {
                            controller.selectedState1.value = value!;
                            controller.state.value =
                                controller.selectedState1.value.name ?? '';
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
                        style: AppTextStyle.textStyleUtils400().copyWith(
                            decoration: TextDecoration.none,
                            decorationThickness: 0),
                        cursorColor: Colors.black,
                        decoration: getInputDecoration(
                            controller.validatorList1[7]
                                ? LanguageConstants.enterStateProvince.tr
                                : LanguageConstants.stateProvince.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return null;
                          }
                          return null;
                        },
                        onChanged: (val) {
                          controller.validatorList1[7] = true;
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
            style: AppTextStyle.textStyleUtils400().copyWith(
                decoration: TextDecoration.none, decorationThickness: 0),
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
            decoration: getInputDecoration(controller.validatorList1[9]
                ? LanguageConstants.enterPhoneNumber.tr
                : LanguageConstants.enterPhoneNumber.tr),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorList1[9] = true;

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
        bottom: 10,
        top: 12,
        left: 10,
      ),
      hintText: message,
      hintStyle: AppTextStyle.textStyleUtils400(),
      errorStyle: AppTextStyle.textStyleUtils400(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: appColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 1.0,
        ),
      ),
      isDense: true,
      suffixIcon: null,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: appColor,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
