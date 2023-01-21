import 'package:avoirchic/app/controller/checkout_order_controller.dart';
import 'package:avoirchic/app/controller/country_controller.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_text_phone_field.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_divider.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart'
    as multi_address;
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/translations/translations.dart';

class CheckoutShippingAddress extends GetView<CheckoutOrderController> {
  const CheckoutShippingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.multiAddressModel.value.addresses == null ||
            (controller.multiAddressModel.value.addresses?.isEmpty ?? false)
        ? localStore.isGuest
            ? guestShippingAddressForm()
            : Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      LanguageConstants
                          .youHaveNoSavedAddressAddnewAddressToContinueWithCheckout
                          .tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  newAddressButton(context),
                ],
              )
        : SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15.0),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        controller.multiAddressModel.value.addresses?.length,
                    itemBuilder: (context, index) {
                      multi_address.Address? address =
                          controller.multiAddressModel.value.addresses?[index];
                      return Obx(() => Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonTextPoppins(
                                          "${address?.firstname} ${address?.lastname} ${address?.street?.join(",")} ${address?.city} ${address?.postcode}",
                                          textAlign: TextAlign.start,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0,
                                          maxLine: 5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        CommonTextPoppins(
                                          '${address?.telephone}',
                                          textAlign: TextAlign.start,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0,
                                          maxLine: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 60.0,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        controller.shipHereOnTap(
                                            index, address);
                                      },
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: controller.selectedAddressIndex
                                                      .value ==
                                                  index
                                              ? const Color(0xff367587)
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        alignment: Alignment.center,
                                        child: CommonTextPoppins(
                                          LanguageConstants.shipHere.tr,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: controller.selectedAddressIndex
                                                      .value ==
                                                  index
                                              ? Colors.white
                                              : Colors.black,
                                          // decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              controller.multiAddressModel.value.addresses!
                                              .length -
                                          1 ==
                                      index
                                  ? Container()
                                  : Column(
                                      children: [
                                        CommonDivider(
                                          width: Get.width,
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                      ],
                                    ),
                            ],
                          ));
                    }),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.showAddDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: appTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: CommonTextOpenSans(
                      LanguageConstants.newAddressText.tr,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ));
  }

  Widget guestShippingAddressForm() {
    return Column(
      children: [
        const SizedBox(height: 14.0),
        Container(
          height: 40,
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: TextFormField(
            controller: controller.emailController,
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
                  : LanguageConstants.emailAddressTextveralusso.tr,
              hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
              errorStyle:
                  AppTextStyle.textStyleUtils400(color: Colors.grey, size: 10),
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
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: TextFormField(
                  controller: controller.firstNameController,
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
                    hintStyle:
                        AppTextStyle.textStyleUtils400(color: grey636363),
                    errorStyle: AppTextStyle.textStyleUtils400(
                        color: Colors.black, size: 10),
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
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: TextFormField(
                  controller: controller.lastNameController,
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
                    hintStyle: AppTextStyle.textStyleUtils400(
                      color: grey636363,
                    ),
                    errorStyle: AppTextStyle.textStyleUtils400(
                        color: Colors.black, size: 10),
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
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: TextFormField(
            controller: controller.address1Controller,
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
              hintStyle: AppTextStyle.textStyleUtils400(
                color: grey636363,
              ),
              errorStyle:
                  AppTextStyle.textStyleUtils400(color: Colors.black, size: 10),
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
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: TextFormField(
            controller: controller.address2Controller,
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
              hintStyle: AppTextStyle.textStyleUtils400(
                color: grey636363,
              ),
              errorStyle:
                  AppTextStyle.textStyleUtils400(color: Colors.black, size: 10),
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
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: TextFormField(
            controller: controller.address3Controller,
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
              hintStyle: AppTextStyle.textStyleUtils400(
                color: grey636363,
              ),
              errorStyle:
                  AppTextStyle.textStyleUtils400(color: Colors.black, size: 10),
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
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: TextFormField(
                  controller: controller.cityController,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(
                      bottom: 0,
                      top: 10,
                      left: 10,
                    ),
                    hintText: controller.validatorList[4]
                        ? LanguageConstants.enterCityName.tr
                        : LanguageConstants.city.tr,
                    hintStyle: AppTextStyle.textStyleUtils400(
                      color: grey636363,
                    ),
                    errorStyle: AppTextStyle.textStyleUtils400(
                        color: Colors.black, size: 10),
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
                    dropdownColor: avoirChickLightBgTheme,
                    items: controller.getcountryList
                        .map((value) => DropdownMenuItem<CountryListModel>(
                              value: value,
                              child: Text(value.fullNameEnglish.toString()),
                            ))
                        .toList(),
                    isExpanded: true,
                    hint:
                        controller.selectedCoutry1.value.fullNameEnglish == null
                            ? Text(
                                LanguageConstants.country.tr,
                                style: AppTextStyle.textStyleUtils400(
                                  color: grey636363,
                                ),
                              )
                            : Text(
                                controller.selectedCoutry1.value.fullNameEnglish
                                    .toString(),
                                style: AppTextStyle.textStyleUtils400(
                                  color: Colors.black,
                                ),
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
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: TextFormField(
                  controller: controller.zipPovinceController,
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
                    hintStyle: AppTextStyle.textStyleUtils400(
                      color: grey636363,
                    ),
                    errorStyle: AppTextStyle.textStyleUtils400(
                        color: Colors.black, size: 10),
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
                          dropdownColor: avoirChickLightBgTheme,
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
                                    color: grey636363,
                                  ),
                                )
                              : Text(
                                  controller.selectedState1.value.name ?? '',
                                  style: AppTextStyle.textStyleUtils400(
                                    color: Colors.black,
                                  ),
                                ),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 28,
                            color: appBorderColor.withOpacity(0.2),
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
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: TextFormField(
                        controller: controller.stateController,
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
                              : LanguageConstants.stateProvince.tr,
                          hintStyle: AppTextStyle.textStyleUtils400(
                            color: grey636363,
                          ),
                          errorStyle: AppTextStyle.textStyleUtils400(
                              color: Colors.black, size: 10),
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
            country: Get.find<CountryController>().country?.value.toString(),
            borderColor: Colors.black,
            focusedColor: avoirChickTheme,
            dropdownTextStyle: AppTextStyle.textStyleUtils400_16(),
            fontStyle: AppTextStyle.textStyleUtils400_16(),
            hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
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
      hintStyle: AppTextStyle.textStyleUtils400(color: Colors.grey),
      errorStyle: AppTextStyle.textStyleUtils400(),
      isDense: true,
      suffixIcon: null,
      border: InputBorder.none,
    );
  }

  Widget newAddressButton(context) {
    return Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            controller.showAddDialog(
              Get.context!,
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: appTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: CommonTextOpenSans(
            LanguageConstants.newAddressText.tr,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ));
  }
}
