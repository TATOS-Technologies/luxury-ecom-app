import 'package:brandslabels/app/controller/checkout_order_controller.dart';
import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/common_text_phone_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_divider.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart' as multi_address;
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
                      LanguageConstants.youHaveNoSavedAddressAddnewAddressToContinueWithCheckout.tr,
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
                  itemCount: controller.multiAddressModel.value.addresses?.length,
                  itemBuilder: (context, index) {
                    multi_address.Address? address = controller.multiAddressModel.value.addresses?[index];
                    return Obx(
                      () => Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                child: CommonButton(
                                  padding: const EdgeInsets.only(
                                    left: 5.0,
                                    right: 5.0,
                                  ),
                                  buttonType: ButtonType.OutlinedButton,
                                  color: controller.selectedAddressIndex.value == index ? darkBlue : Colors.transparent,
                                  border: controller.selectedAddressIndex.value == index
                                      ? BorderSide.none
                                      : const BorderSide(
                                          color: darkBlue,
                                          width: 1.0,
                                        ),
                                  onPressed: () {
                                    controller.shipHereOnTap(index, address);
                                  },
                                  child: CommonTextPoppins(
                                    LanguageConstants.shipHere.tr,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: controller.selectedAddressIndex.value == index ? whiteColor : darkBlue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          (controller.multiAddressModel.value.addresses?.length ?? 0) - 1 == index
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
                      ),
                    );
                  },
                ),
                newAddressButton(context),
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
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextFormField(
            controller: controller.emailController,
            style: AppTextStyle.textStyleUtils400().copyWith(decoration: TextDecoration.none, decorationThickness: 0),
            cursorColor: Colors.black,
            decoration: getInputDecoration(controller.validatorList[0]
                ? LanguageConstants.emailAddressRequired.tr
                : LanguageConstants.emailAddress.tr),
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
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: controller.firstNameController,
                  style: AppTextStyle.textStyleUtils400()
                      .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                  cursorColor: Colors.black,
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
                height: 40,
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: controller.lastNameController,
                  style: AppTextStyle.textStyleUtils400()
                      .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                  cursorColor: Colors.black,
                  decoration: getInputDecoration(
                      controller.validatorList[2] ? LanguageConstants.enterLastName.tr : LanguageConstants.lastName.tr),
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
        const SizedBox(height: 6.0),
        Container(
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextFormField(
            controller: controller.address1Controller,
            style: AppTextStyle.textStyleUtils400().copyWith(decoration: TextDecoration.none, decorationThickness: 0),
            cursorColor: Colors.black,
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
        const SizedBox(height: 6.0),
        Container(
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextFormField(
            controller: controller.address2Controller,
            style: AppTextStyle.textStyleUtils400().copyWith(decoration: TextDecoration.none, decorationThickness: 0),
            cursorColor: Colors.black,
            decoration: getInputDecoration(controller.validatorList[5]
                ? LanguageConstants.enterStreetAdress2.tr
                : LanguageConstants.streetAddress2.tr),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorList[5] = true;
              controller.add2.value = val;
              controller.setOnAddressChangeDeBouncer();
            },
          ),
        ),
        const SizedBox(height: 6.0),
        Container(
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextFormField(
            controller: controller.address3Controller,
            style: AppTextStyle.textStyleUtils400().copyWith(decoration: TextDecoration.none, decorationThickness: 0),
            cursorColor: Colors.black,
            decoration: getInputDecoration(controller.validatorList[6]
                ? LanguageConstants.enterStreetAddress3.tr
                : LanguageConstants.streetAddress3.tr),
            validator: (value) {
              if (value == null || value == '') {
                return null;
              }
              return null;
            },
            onChanged: (val) {
              controller.validatorList[6] = true;
              controller.add3.value = val;
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
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: controller.cityController,
                  style: AppTextStyle.textStyleUtils400()
                      .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                  cursorColor: Colors.black,
                  decoration: getInputDecoration(
                      controller.validatorList[4] ? LanguageConstants.enterCityName.tr : LanguageConstants.city.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorList[4] = true;
                    controller.city.value = val;
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
                    hint: controller.selectedCoutry1.value.fullNameEnglish == null
                        ? Text(
                            LanguageConstants.country.tr,
                            style: AppTextStyle.textStyleUtils400(
                              color: Colors.grey,
                            ),
                          )
                        : Text(
                            controller.selectedCoutry1.value.fullNameEnglish.toString(),
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
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: controller.zipPovinceController,
                  style: AppTextStyle.textStyleUtils400()
                      .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                  cursorColor: Colors.black,
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
                            controller.state.value = controller.selectedState1.value.name ?? '';
                            controller.setOnAddressChangeDeBouncer();
                          },
                        ),
                      ),
                    )
                  : Container(
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        controller: controller.stateController,
                        style: AppTextStyle.textStyleUtils400()
                            .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                        cursorColor: Colors.black,
                        decoration: getInputDecoration(controller.validatorList[7]
                            ? LanguageConstants.enterStateProvince.tr
                            : LanguageConstants.stateProvince.tr),
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
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          height: 40,
          child: CommonTextPhoneField(
            textController: controller.phoneNumberController,
            cursorColor: Colors.black,
            dropdownIconColor: Colors.black,
            country: Get.find<CountryController>().country.value.toString(),
            borderColor: Colors.black,
            borderRadius: BorderRadius.zero,
            dropdownTextStyle:
                AppTextStyle.textStyleUtils400().copyWith(decoration: TextDecoration.none, decorationThickness: 0),
            fontStyle:
                AppTextStyle.textStyleUtils400().copyWith(decoration: TextDecoration.none, decorationThickness: 0),
            hintStyle: AppTextStyle.textStyleUtils400()
                .copyWith(decoration: TextDecoration.none, decorationThickness: 0, color: grey636363),
            hintText: controller.validatorList[9] ? LanguageConstants.enterPhoneNumber.tr : LanguageConstants.phoneNumberText.tr,
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
      child: SizedBox(
        height: 40,
        width: 135.0,
        child: CommonThemeButton(
          onTap: () {
            controller.showDialogAddress(Get.context!);
          },
         title: LanguageConstants.newAddressText.tr,
        ),
      ),
    );
  }
}
