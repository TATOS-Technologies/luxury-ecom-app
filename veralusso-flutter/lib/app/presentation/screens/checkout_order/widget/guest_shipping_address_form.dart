import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/common_text_phone_field.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class GuestShippingAddressForm extends GetView<CheckoutOrderController> {
  @override
  final CheckoutOrderController controller = Get.find();

  GuestShippingAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            const SizedBox(height: 14.0),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: textFieldBoarderColor, width: 2)),
              child: TextFormField(
                controller: controller.emailController,
                decoration: getInputDecoration(controller.validatorList[0]
                    ? LanguageConstants.emailIsRequired.tr
                    : LanguageConstants.emailAddressTextveralusso.tr),
                onChanged: (val) {
                  controller.validatorList[0] = true;
                  controller.email.value = val;
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
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: textFieldBoarderColor, width: 2)),
                    child: TextFormField(
                      controller: controller.firstNameController,
                      decoration: getInputDecoration(controller.validatorList[1]
                          ? LanguageConstants.enterFirstName.tr
                          : LanguageConstants.firstNameText.tr),
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
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: textFieldBoarderColor, width: 2)),
                    child: TextFormField(
                      controller: controller.lastNameController,
                      decoration: getInputDecoration(controller.validatorList[2]
                          ? LanguageConstants.enterLastName.tr
                          : LanguageConstants.lastName.tr),
                      onTap: () {},
                      validator: (value) {
                        if (value == null || value == '') {
                          return null;
                        }
                        return null;
                      },
                      onChanged: (val) {
                        controller.validatorList[2] = true;

                        controller.lastName.value = val;
                        controller.setOnAddressChangeDeBouncer();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: textFieldBoarderColor, width: 2)),
              child: TextFormField(
                controller: controller.address1Controller,
                decoration: getInputDecoration(controller.validatorList[3]
                    ? LanguageConstants.enterStreetAddress1.tr
                    : LanguageConstants.streetAddress1.tr),
                validator: (value) {
                  if (value == null || value == '') {
                    return null;
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.validatorList[3] = true;

                  controller.add1.value = val;
                  controller.setOnAddressChangeDeBouncer();
                },
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: textFieldBoarderColor, width: 2)),
              child: TextFormField(
                controller: controller.address2Controller,
                decoration: getInputDecoration(controller.validatorList[4]
                    ? LanguageConstants.enterStreetAdress2.tr
                    : LanguageConstants.streetAddress2.tr),
                validator: (value) {
                  if (value == null || value == '') {
                    return null;
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.validatorList[4] = true;

                  controller.add2.value = val;
                  controller.setOnAddressChangeDeBouncer();
                },
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: textFieldBoarderColor, width: 2)),
              child: TextFormField(
                controller: controller.address3Controller,
                decoration: getInputDecoration(controller.validatorList[5]
                    ? LanguageConstants.enterStreetAddress3.tr
                    : LanguageConstants.streetAddress3.tr),
                onTap: () {},
                validator: (value) {
                  if (value == null || value == '') {
                    return null;
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.validatorList[5] = true;
                  controller.add3.value = val;
                  controller.setOnAddressChangeDeBouncer();
                },
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40.h,
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 6.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border:
                            Border.all(color: textFieldBoarderColor, width: 2),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<CountryListModel>(
                        items: controller.getcountryList
                            .map(
                              (value) => DropdownMenuItem<CountryListModel>(
                                value: value,
                                child: Text(value.fullNameEnglish.toString()),
                              ),
                            )
                            .toList(),
                        isExpanded: true,
                        hint: controller
                                    .selectedCoutry1.value.fullNameEnglish ==
                                null
                            ? Text(
                                LanguageConstants.country.tr,
                                style: AppTextStyle.textStyleUtils400(
                                    color: Colors.grey),
                              )
                            : Text(
                                controller.selectedCoutry1.value.fullNameEnglish
                                    .toString(),
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 28,
                          color: blackColor.withOpacity(0.2),
                        ),
                        onChanged: (value) {
                          controller.selectedCoutry1.value = value!;
                          controller.selectedState1.value = AvailableRegion();
                          controller.selectedStateList1.value = controller
                                  .selectedCoutry1.value.availableRegions ??
                              [];
                          controller.countryName.value = value.fullNameEnglish!;
                          controller.setOnAddressChangeDeBouncer();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: textFieldBoarderColor, width: 2)),
                    child: TextFormField(
                      controller: controller.cityController,
                      decoration: getInputDecoration(controller.validatorList[6]
                          ? LanguageConstants.enterCityName.tr
                          : LanguageConstants.city.tr),
                      onTap: () {},
                      validator: (value) {
                        if (value == null || value == '') {
                          return null;
                        }
                        return null;
                      },
                      onChanged: (val) {
                        controller.validatorList[6] = true;

                        controller.city.value = val;
                        controller.setOnAddressChangeDeBouncer();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: controller.selectedStateList1.isNotEmpty
                      ? Container(
                          height: 40.h,
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 6.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: blackColor,
                              width: 2,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<AvailableRegion>(
                              dropdownColor: Colors.white,
                              items: controller.selectedStateList1
                                  .map(
                                    (value) =>
                                        DropdownMenuItem<AvailableRegion>(
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
                                          color: Colors.grey),
                                    )
                                  : Text(
                                      controller.selectedState1.value.name ??
                                          '',
                                      style: AppTextStyle.textStyleUtils400(),
                                    ),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 28,
                                color: blackColor.withOpacity(0.2),
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
                          height: 40.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: textFieldBoarderColor, width: 2)),
                          child: TextFormField(
                            controller: controller.stateController,
                            decoration: getInputDecoration(
                                controller.validatorList[7]
                                    ? LanguageConstants.enterStateProvince.tr
                                    : LanguageConstants.stateProvince.tr),
                            onTap: () {},
                            validator: (value) {
                              if (value == null || value == '') {
                                return null;
                              }
                              return null;
                            },
                            onChanged: (val) {
                              controller.validatorList[7] = true;

                              controller.state.value = val;
                              controller.setOnAddressChangeDeBouncer();
                            },
                          ),
                        ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: textFieldBoarderColor, width: 2)),
                    child: TextFormField(
                      controller: controller.zipPovinceController,
                      keyboardType: TextInputType.number,
                      decoration: getInputDecoration(controller.validatorList[8]
                          ? LanguageConstants.enterZipPostalCode.tr
                          : LanguageConstants.zipPostalCode.tr),
                      validator: (value) {
                        if (value == null || value == '') {
                          return null;
                        }
                        return null;
                      },
                      onChanged: (val) {
                        controller.validatorList[8] = true;
                        controller.zipCode.value = val;
                        controller.setOnAddressChangeDeBouncer();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 40.h,
              child: CommonTextPhoneField(
                textController: controller.phoneNumberController,
                textColor: darkGrey,
                cursorColor: blue,
                dropdownIconColor: darkGrey,
                country:
                    Get.find<CountryController>().country?.value.toString(),
                borderColor: Colors.black,
                focusedColor: darkGrey,
                errorBorderColor: red,
                dropdownTextStyle:
                    AppTextStyle.textStyleUtils400(color: darkGrey),
                fontStyle: AppTextStyle.textStyleUtils400(color: darkGrey),
                hintStyle: AppTextStyle.textStyleUtils400(color: regularGrey),
                hintText: LanguageConstants.contactNoText.tr,
                hintColor: appColor,
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
        ));
  }

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.only(
        bottom: 0,
        top: 10,
        left: 10,
      ),
      hintText: hint,
      errorStyle: AppTextStyle.textStyleUtils400(color: Colors.white),
      hintStyle: AppTextStyle.textStyleUtils400(color: Colors.grey),
      isDense: true,
      suffixIcon: null,
    );
  }
}
